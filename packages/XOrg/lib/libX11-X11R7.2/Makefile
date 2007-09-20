include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libX11
PKG_NAME:=libX11-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=1.1.1

_DEPEND:= +bigreqsproto-X11R7.0 +xproto-X11R7.2 +xextproto-X11R7.0 +libXau-X11R7.2 +xtrans-X11R7.2 +xcmiscproto-X11R7.0 +libXdmcp-X11R7.2 +xf86bigfontproto-X11R7.0 +kbproto-X11R7.2 +inputproto-X11R7.0


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
