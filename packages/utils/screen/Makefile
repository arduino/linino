#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=screen
PKG_VERSION:=4.0.2
PKG_RELEASE:=1
PKG_MD5SUM:=ed68ea9b43d9fba0972cb017a24940a1

PKG_SOURCE_URL:=@GNU/screen
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/screen
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=Full-screen terminal window manager
  DESCRIPTION:=Screen is a full-screen window manager that multiplexes a physical\\\
	terminal between several processes, typically interactive shells.\\\
  URL:=http://www.gnu.org/software/screen/
endef

define Build/Configure	
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status} ; \
		$(TARGET_CONFIGURE_OPTS) \
		$(foreach flag,rename fchmod fchown strerror lstat _exit utimes vsnprintf getcwd setlocale strftime,ac_cv_func_$(flag)=yes ) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
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
		  --enable-shared \
		  --disable-static \
	);
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/screen/install	
	install -d -m0755 $(1)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/screen $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,screen))
