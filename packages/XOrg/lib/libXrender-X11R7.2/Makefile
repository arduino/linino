include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libXrender
PKG_NAME:=libXrender-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=0.9.2

_DEPEND:= +freetype +zlib +xproto-X11R7.2 +libfontenc-X11R7.2 +xtrans-X11R7.2 +fontsproto-X11R7.0 +renderproto-X11R7.0


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
