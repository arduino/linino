#
# Copyright (C) 2008-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=motion
PKG_VERSION:=3.2.11.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.lavrsen.dk/sources/motion-daily \
		@SF/motion
PKG_MD5SUM:=4e729f129d8f9b9abaed5121c3cd0037

include $(INCLUDE_DIR)/package.mk

define Package/motion
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libjpeg +libpthread
  TITLE:=webcam motion sensing and logging
  URL:=http://www.lavrsen.dk/twiki/bin/view/Motion/WebHome
endef

define Package/motion/conffiles
/etc/motion.conf
endef

CONFIGURE_ARGS+= \
	--without-ffmpeg \
	--without-jpeg-mmx \
	--without-mysql \
	--without-pgsql \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/motion/install
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/motion-dist.conf $(1)/etc/motion.conf
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/motion $(1)/usr/bin/

endef

$(eval $(call BuildPackage,motion))
