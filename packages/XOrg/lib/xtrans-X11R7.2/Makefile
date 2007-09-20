include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=xtrans
PKG_NAME:=xtrans-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=1.0.3

_DEPEND:=


include ../common.mk

ifeq ("$(PKG_NAME)","libX11-X11R7.2")
 #CONFIGURE_ARGS_XTRA=--without-xcb --disable-udc --enable-xcms --disable-xlocale --disable-xkb
 CONFIGURE_ARGS_XTRA=--without-xcb
define Build/Compile
	$(MAKE_VARS) \
		$(MAKE) -C $(PKG_BUILD_DIR)/src/util CFLAGS="" LDFLAGS="" CC="cc" makekeys 
	$(MAKE_VARS) \
		$(MAKE) -C $(PKG_BUILD_DIR)/$(MAKE_PATH) \
		$(MAKE_FLAGS) \
		all ;
endef
endif

ifeq ("$(PKG_NAME)","libXt-X11R7.2")
define Build/Compile
	$(MAKE_VARS) \
	$(MAKE) -C $(PKG_BUILD_DIR)/util CFLAGS="" LDFLAGS="" CC="cc" 
	make -C $(PKG_BUILD_DIR)
endef
endif

$(eval $(call BuildPackage,$(PKG_NAME)))
