# 
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# blogic@openwrt.org

PKG_SOURCE_URL:=http://xorg.freedesktop.org/releases/X11R7.2/src/driver

_CATEGORY:=driver
_DEPEND+=+xorg-server-X11R7.2
include ../../common.mk

EXTRA_CFLAGS+= -I${STAGING_DIR}/usr/include/xorg -I${STAGING_DIR}/usr/include/X11/

CONFIGURE_VARS+=DRI_CFLAGS="-I$(STAGING_DIR)/usr/include/X11/dri/"

acvar=$(subst -,_,$(subst .,_,$(subst /,_,$(1))))

CONFIGURE_VARS += $(foreach a,dri.h sarea.h dristruct.h exa.h,ac_cv_file_$(call acvar,$(STAGING_DIR)/usr/include/xorg/$(a))=yes) \
		ac_cv_file__usr_share_sgml_X11_defs_ent=yes

define Build/Configure
	(cd $(PKG_BUILD_DIR)/$(CONFIGURE_PATH); \
	if [ -x $(CONFIGURE_CMD) ]; then \
		$(CP) $(SCRIPT_DIR)/config.{guess,sub} $(PKG_BUILD_DIR)/ && \
		$(CONFIGURE_VARS) \
		$(CONFIGURE_CMD) \
		$(CONFIGURE_ARGS_XTRA) \
		$(CONFIGURE_ARGS) ;\
	fi \
	)
endef

define Build/Compile
	make -C $(PKG_BUILD_DIR)
	DESTDIR=$(PKG_INSTALL_DIR) $(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) install
	find $(PKG_INSTALL_DIR) -name *a | xargs rm -rf
endef

define Package/${PKG_NAME}/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef
