include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libXrandr
PKG_NAME:=libXrandr-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=1.1.2

_DEPEND:= +libXext-X11R7.2 +libXrender-X11R7.2 +randrproto-X11R7.0 +renderproto-X11R7.0 +xextproto-X11R7.0 +libX11-X11R7.2

include ../common.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
