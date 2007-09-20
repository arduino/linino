include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libX11
PKG_NAME:=libX11-X11R7.2
PKG_RELEASE:=1
PKG_VERSION:=1.1.1

_DEPEND:= +bigreqsproto-X11R7.0 +xproto-X11R7.2 +xextproto-X11R7.0 +libXau-X11R7.2 +xtrans-X11R7.2 +xcmiscproto-X11R7.0 +libXdmcp-X11R7.2 +xf86bigfontproto-X11R7.0 +kbproto-X11R7.2 +inputproto-X11R7.0

include ../common.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
