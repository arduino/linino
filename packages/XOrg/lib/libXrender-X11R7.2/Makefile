include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libXrender
PKG_NAME:=libXrender-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=0.9.2

_DEPEND:= +freetype +zlib +xproto-X11R7.2 +libfontenc-X11R7.2 +xtrans-X11R7.2 +fontsproto-X11R7.0 +renderproto-X11R7.0

include ../common.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
