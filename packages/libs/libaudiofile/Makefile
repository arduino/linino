# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=libaudiofile
PKG_VERSION:=0.2.6
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.cti.ecp.fr/~beauxir5/peercast
PKG_MD5SUM:=460f848ce5f4a33ae66b15a4fb7720ec
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libaudiofile
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Audio File library
  DESCRIPTION:=Audio File library.\\\
    The audiofile library allows the processing of audio data to and from audio \\\
    files of many common formats (currently AIFF, AIFF-C, WAVE, NeXT/Sun, BICS, \\\
    and raw data).
  URL:=http://www.68k.org/~michael/audiofile/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		ac_cv_linux_vers=$(BR2_DEFAULT_KERNEL_HEADERS) \
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
			$(DISABLE_NLS) \
			$(DISABLE_LARGEFILE) \
			--enable-shared \
			--enable-static \
			--with-build-cc="$(HOSTCC)" \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CCOPT="$(TARGET_CFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/libaudiofile/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libaudiofile.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/audiofile-config $(STAGING_DIR)/usr/bin/
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/af_vfs.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/audiofile.h $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/aupvlist.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libaudiofile.{a,so*} $(STAGING_DIR)/usr/lib/
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/audiofile.pc $(STAGING_DIR)/usr/lib/pkgconfig/
	$(SED) 's,-I$$$${includedir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/audiofile.pc
	$(SED) 's,-L$$$${libdir},,g' $(STAGING_DIR)/usr/lib/pkgconfig/audiofile.pc
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/af_vfs.h \
		$(STAGING_DIR)/usr/include/audiofile.h \
		$(STAGING_DIR)/usr/include/aupvlist.h \
		$(STAGING_DIR)/usr/lib/libaudiofile.{a,so*} \
		$(STAGING_DIR)/usr/lib/pkgconfig/libaudiofile.pc
endef

$(eval $(call BuildPackage,libaudiofile))
