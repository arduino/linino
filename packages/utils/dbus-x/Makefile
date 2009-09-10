#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

# Make sure to also update the dbus package
PKG_NAME:=dbus-x
PKG_VERSION:=1.2.12
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/dbus-x/dbus-$(PKG_VERSION)
PKG_SOURCE:=dbus-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dbus.freedesktop.org/releases/dbus/
PKG_MD5SUM:=39bd582c3b06a261cac44d4cab6fd60b
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib \
	-Wl,-rpath=/usr/lib/

define Package/dbus/Default/description
 D-Bus is a message bus system, a simple way for applications to talk to one
 another. In addition to interprocess communication, D-Bus helps coordinate
 process lifecycle; it makes it simple and reliable to code a "single instance"
 application or daemon, and to launch applications and daemons on demand when
 their services are needed.
endef

define Package/dbus-launch-x
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=dbus launch utility with x support
  DEPENDS:=+libexpat +dbus +libX11
  URL:=http://dbus.freedesktop.org/
endef

define Package/dbus-launch-x/Description
$(call Package/dbus/Default/description)
  This package contains the dbus-launch utility with compiled in x support.
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-abstract-sockets \
	--disable-ansi \
	--disable-asserts \
	--disable-console-owner-file \
	--disable-doxygen-docs \
	--disable-gcov \
	--disable-selinux \
	--disable-tests \
	--disable-verbose-mode \
	--disable-xml-docs \
	--with-xml="expat" \
	--with-dbus-user=root \
	--with-dbus-daemondir="/usr/sbin" \
	--with-system-socket="/var/run/dbus/system_bus_socket" \
	--with-system-pid-file="/var/run/dbus.pid" \
	--with-x \
	--libexecdir=/usr/lib/dbus-1

CONFIGURE_VARS+= \
	ac_cv_have_abstract_sockets="yes" \

define Package/dbus-launch-x/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/bin/dbus-launch \
		$(1)/usr/bin/dbus-launch-x
endef

$(eval $(call BuildPackage,dbus-launch-x))
