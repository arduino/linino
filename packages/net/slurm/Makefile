#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=slurm
PKG_VERSION:=0.3.3
PKG_RELEASE:=1
PKG_MD5SUM:=e68d09202b835c644f7f6b7f070f29a2

PKG_SOURCE_URL:=http://www.wormulon.net/files/code/slurm/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/slurm
  SECTION:=net
  CATEGORY:=Network
  TITLE:=A realtime network interface monitor
  DESCRIPTION:=A realtime network interface monitor with the following features:\\\
		* realtime traffic statistics divided into incoming and outgoing\\\
		* optional combined view\\\
		* can monitor any kind of network interface\\\
		* shows detailed statistics about the interface.\\\
		* it's themeable\\\
  URL:=http://www.wormulon.net/projects/slurm
endef

define Build/Configure	
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status}; \
		touch configure.in; \
		touch aclocal.m4; \
		touch Makefile.in; \
		touch config.h.in; \
		touch configure; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		LIBS="-lncurses" \
		ac_cv_func_malloc_0_nonnull=yes \
		ac_cv_lib_ncurses_use_default_colors=yes \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
	);
endef

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/slurm/install	
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/slurm $(1)/usr/bin/
endef

$(eval $(call BuildPackage,slurm))
