#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=lcd4linux
PKG_REV:=877
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://ssl.bulix.org/svn/lcd4linux/trunk/
PKG_SOURCE_SUBDIR:=lcd4linux-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=svn

PKG_FIXUP = libtool

include $(INCLUDE_DIR)/package.mk

define Package/lcd4linux
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses +libusb +libiconv +libgd
  TITLE:=LCD display utility
  URL:=http://lcd4linux.bulix.org/
endef

define Package/lcd4linux/config
	menu "Configuration"
	depends on PACKAGE_lcd4linux
	source "$(SOURCE)/Config.in"
	endmenu
endef

define Package/lcd4linux/description
	LCD4Linux is a small program that grabs information from the kernel and 
	some subsystems and displays it on an external liquid crystal display.
endef

define Package/lcd4linux/conffiles
/etc/lcd4linux.conf
endef

LCD4LINUX_DRIVERS:= \
	BeckmannEgle \
	BWCT \
	CrystalFontz \
	Curses \
	Cwlinux \
	G15 \
	HD44780 \
	LCD2USB \
	LCDLinux \
	LCDTerm \
	LPH7508 \
	LUIse \
	M50530 \
	MatrixOrbital \
	MilfordInstruments \
	Noritake \
	NULL \
	PNG \
	PPM \
	Pertelian \
	picoLCD \
	RouterBoard \
	serdisplib \
	SimpleLCD \
	st2205 \
	T6963 \
	Trefon \
	USBLCD \
	USBHUB \
	WincorNixdorf \
	X11 \

LCD4LINUX_PLUGINS:= \
	apm \
	asterisk \
	button_exec \
	cpuinfo \
	diskstats \
	dvb \
	exec \
	fifo \
	file \
	gps \
	i2c_sensors \
	iconv \
	imon \
	isdn \
	kvv \
	loadavg \
	meminfo \
	mpd \
	mysql \
	netdev \
	pop3 \
	ppp \
	proc_stat \
	python \
	seti \
	statfs \
	uname \
	uptime \
	wireless \
	xmms \

LCD4LINUX_CONFIGURE_DRIVERS:= \
	$(foreach c, $(LCD4LINUX_DRIVERS), \
	    $(if $(CONFIG_LCD4LINUX_DRV_$(c)),$(c),) \
	)

LCD4LINUX_CONFIGURE_PLUGINS:= \
	$(foreach c, $(LCD4LINUX_PLUGINS), \
	    $(if $(CONFIG_LCD4LINUX_PLUGIN_$(c)),$(c),) \
	)

EXTRA_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/lib/libiconv/include
EXTRA_LDFLAGS+=-L$(STAGING_DIR)/usr/lib -Wl,-rpath-link,$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/usr/lib/libiconv/lib

TARGET_CONFIGURE_OPTS+=\
	CC="$(TARGET_CC) $(EXTRA_CFLAGS) $(EXTRA_LDFLAGS)"


CONFIGURE_ARGS += \
	--without-x \
	--without-python \
	--with-drivers="$(LCD4LINUX_CONFIGURE_DRIVERS)" \
	--with-plugins="$(LCD4LINUX_CONFIGURE_PLUGINS)" \
	--disable-rpath \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" all install
endef

define Package/lcd4linux/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/$(PKG_NAME).conf $(1)/etc/$(PKG_NAME).conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
endef

$(eval $(call BuildPackage,lcd4linux))
