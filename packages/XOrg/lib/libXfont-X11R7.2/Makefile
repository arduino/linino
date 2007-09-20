include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libXfont
PKG_NAME:=libXfont-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=1.2.7

_DEPEND:= +zlib +libfontenc-X11R7.2 +fontcacheproto-X11R7.0 +fontsproto-X11R7.0 +freetype

include ../common.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
