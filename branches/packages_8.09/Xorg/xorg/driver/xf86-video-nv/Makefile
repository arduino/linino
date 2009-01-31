# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org
include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=xf86
PKG_NAME:=xf86-video-nv
PKG_RELEASE:=3
PKG_VERSION:=2.1.12
PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.4/src/driver
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_BUILD_DIR=$(BUILD_DIR)/Xorg/$(_CATEGORY)/${PKG_NAME}-$(PKG_VERSION)/
PKG_MD5SUM:=42f12a36d7afc26c817e8e8f5c8b7274

include $(INCLUDE_DIR)/package.mk

define Package/xf86-video-nv
  SECTION:=xorg-driver
  CATEGORY:=Xorg
  SUBMENU:=driver
  DEPENDS:=+xserver-xorg
  TITLE:=xf86-video-nv
  URL:=http://xorg.freedesktop.org/
endef

define Build/InstallDev
	DESTDIR="$(1)" $(MAKE) -C $(PKG_BUILD_DIR)/ $(MAKE_FLAGS) install
endef

EXTRA_CPPFLAGS= -I$(STAGING_DIR)/usr/include/xorg \
		-I$(STAGING_DIR)/usr/include/X11/ \
		-I$(STAGING_DIR)/usr/include/ \
		-I$(STAGING_DIR)/include/

EXTRA_CFLAGS+= $(EXTRA_CPPFLAGS)

acvar=$(subst -,_,$(subst .,_,$(subst /,_,$(1))))

CONFIGURE_VARS +=DRI_CFLAGS="-I$(STAGING_DIR)/usr/include/X11/dri/" ac_cv_file__usr_share_sgml_X11_defs_ent=yes \
	sdkdir=$(STAGING_DIR) 

define Build/Configure
	(cd $(PKG_BUILD_DIR)/$(CONFIGURE_PATH); \
	if [ -x $(CONFIGURE_CMD) ]; then \
		$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
		$(foreach a,dri.h sarea.h dristruct.h exa.h damage.h,export ac_cv_file_$(call acvar,$(STAGING_DIR)/usr/include/xorg/$(a))=yes;) \
		sed -i "s|sdkdir=.*|sdkdir=$(STAGING_DIR)/usr/include/xorg|g" $(PKG_BUILD_DIR)/configure ;\
		$(CONFIGURE_VARS) \
		$(CONFIGURE_CMD) \
		$(CONFIGURE_ARGS_XTRA) \
		$(CONFIGURE_ARGS) \
		CPPFLAGS="$(EXTRA_CPPFLAGS)" ;\
	fi \
	)
endef

define Build/Compile
	make -C $(PKG_BUILD_DIR)
	DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
	find $(PKG_INSTALL_DIR) -name *a | xargs rm -rf
endef

define Package/xf86-video-nv/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,xf86-video-nv))
