include $(TOPDIR)/rules.mk

PKG_BASE_NAME:=libXaw
PKG_NAME:=libXaw-X11R7.1
PKG_RELEASE:=1
PKG_VERSION:=1.0.2

_DEPEND:= +libXmu-X11R7.2 +libXpm-X11R7.2 +libXau-X11R7.2 +libXdmcp-X11R7.2

include ../common.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
