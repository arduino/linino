include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libXext
PKG_NAME:=libXext-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=1.0.2

_DEPEND:= +xproto-X11R7.2 +xextproto-X11R7.0 +libXau-X11R7.2 +libX11-X11R7.2

include ../common.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
