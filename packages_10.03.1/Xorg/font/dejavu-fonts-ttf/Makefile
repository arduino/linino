#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=dejavu-fonts-ttf
PKG_VERSION:=2.23
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/${PKG_NAME}-$(PKG_VERSION)/
PKG_SOURCE_URL:=@SF/dejavu
PKG_MD5SUM:=ff871dff0b3e8a11cd5c54478f11073f

include $(INCLUDE_DIR)/package.mk

FILES:= \
	DejaVuSans-BoldOblique \
	DejaVuSans-Bold \
	DejaVuSansCondensed-BoldOblique \
	DejaVuSansCondensed-Bold \
	DejaVuSansCondensed-Oblique \
	DejaVuSansCondensed \
	DejaVuSans-ExtraLight \
	DejaVuSansMono-BoldOblique \
	DejaVuSansMono-Bold \
	DejaVuSansMono-Oblique \
	DejaVuSansMono \
	DejaVuSans-Oblique \
	DejaVuSans \
	DejaVuSerif-BoldItalic \
	DejaVuSerif-Bold \
	DejaVuSerifCondensed-BoldItalic \
	DejaVuSerifCondensed-Bold \
	DejaVuSerifCondensed-Italic \
	DejaVuSerifCondensed \
	DejaVuSerif-Italic \
	DejaVuSerif

define PartGen
define Package/dejavu-fonts-ttf-$(1)
  SECTION:=xorg-font
  CATEGORY:=Xorg
  SUBMENU:=font
  TITLE:=$(1)
  DEPENDS:=dejavu-fonts-ttf
endef
endef

define Package/dejavu-fonts-ttf
  TITLE:=dejavu-fonts-ttf
  SECTION:=xorg-font
  SUBMENU:=font
  CATEGORY:=Xorg
  URL:=http://dejavu.sourceforge.net/
  DEPENDS:=@DISPLAY_SUPPORT
endef

$(foreach file,$(FILES),$(eval $(call PartGen,$(file))))

define Build/Compile
	true
endef

define Build/Configure
	true
endef

define PartInstall
define Package/dejavu-fonts-ttf-$(1)/install
	$(INSTALL_DIR) \
		$$(1)/usr/share/fonts/ttf-dejavu

	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/ttf/$(1).ttf \
		$$(1)/usr/share/fonts/ttf-dejavu/
endef
endef

$(foreach file,$(FILES),$(eval $(call PartInstall,$(file))))

$(eval $(call BuildPackage,dejavu-fonts-ttf))
$(foreach file,$(FILES),$(eval $(call BuildPackage,dejavu-fonts-ttf-$(file))))

