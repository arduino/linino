#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lcd4linux
PKG_REV:=1158
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://ssl.bulix.org/svn/lcd4linux/trunk/
PKG_SOURCE_SUBDIR:=lcd4linux-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=svn

PKG_FIXUP:=libtool
PKG_INSTALL:=1

PKG_BUILD_DEPENDS:= \
	libdbus \
	libgd \
	libmysqlclient \
	libncurses \
	libnmeap \
	libsqlite3 \
	libvncserver \
	ppp \
	serdisplib \
	st2205tool \
#	libftdi \
#	libmpdclient \
#	libX11 \
#	python \

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/lcd4linux
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:= \
	+LCD4LINUX_NEEDS_libdbus:libdbus \
	+LCD4LINUX_NEEDS_libgd:libgd \
	$(if $(ICONV_FULL),+LCD4LINUX_NEEDS_libiconv:libiconv-full) \
	+LCD4LINUX_NEEDS_libmysqlclient:libmysqlclient \
	+LCD4LINUX_NEEDS_libncurses:libncurses \
	+LCD4LINUX_NEEDS_libnmeap:libnmeap \
	+LCD4LINUX_NEEDS_libsqlite3:libsqlite3 \
	+LCD4LINUX_NEEDS_libusb:libusb \
	+LCD4LINUX_NEEDS_libvncserver:libvncserver \
	+LCD4LINUX_NEEDS_serdisplib:serdisplib \
	+LCD4LINUX_NEEDS_st2205tool:st2205tool \
#	+LCD4LINUX_NEEDS_libftdi:libftdi \
#	+LCD4LINUX_NEEDS_libmpdclient:libmpdclient \
#	+LCD4LINUX_NEEDS_libX11:libX11 \
#	+LCD4LINUX_NEEDS_python:python
  TITLE:=LCD display utility
  URL:=http://lcd4linux.bulix.org/
  MENU:=1
  MAINTAINER:=Jonathan McCrohan <jmccrohan@gmail.com>
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
	D4D \
	EA232graphic \
	G15 \
	GLCD2USB \
	IRLCD \
	HD44780 \
	HD44780-I2C \
	LCD2USB \
	LCDLinux \
	LCDTerm \
	LEDMatrix \
	LPH7508 \
	LUIse \
	LW_ABP \
	M50530 \
	MatrixOrbital \
	MatrixOrbitalGX \
	MilfordInstruments \
	Noritake \
	NULL \
	Pertelian \
	PHAnderson \
	PICGraphic \
	picoLCD \
	picoLCDGraphic \
	PNG \
	PPM \
	RouterBoard \
	serdisplib \
	ShuttleVFD \
	SimpleLCD \
	st2205 \
	T6963 \
	Trefon \
	ULA200 \
	USBHUB \
	USBLCD \
	VNC \
	WincorNixdorf \
	X11 \

LCD4LINUX_PLUGINS:= \
	apm \
	asterisk \
	button_exec \
	cpuinfo \
	dbus \
	diskstats \
	dvb \
	event \
	exec \
	fifo \
	file \
	gps \
	hddtemp \
	huawei \
	i2c_sensors \
	iconv \
	imon \
	isdn \
	kvv \
	loadavg \
	netdev \
	netinfo \
	meminfo \
	mpd \
	mpris_dbus \
	mysql \
	netdev \
	pop3 \
	ppp \
	proc_stat \
	python \
	qnaplog \
	seti \
	statfs \
	uname \
	uptime \
	w1retap \
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

ifeq ($(CONFIG_LCD4LINUX_HAS_AT_LEAST_ONE_DRIVER),)
  LCD4LINUX_CONFIGURE_DRIVERS:=Sample
endif

ifeq ($(CONFIG_LCD4LINUX_HAS_AT_LEAST_ONE_PLUGIN),)
  LCD4LINUX_CONFIGURE_PLUGINS:=sample
endif

CONFIGURE_ARGS+= \
	--disable-rpath \
	--with-drivers="$(strip $(LCD4LINUX_CONFIGURE_DRIVERS))" \
	--with-plugins="$(strip $(LCD4LINUX_CONFIGURE_PLUGINS))" \

EXTRA_LDFLAGS+= -Wl,-rpath-link,$(STAGING_DIR)/usr/lib

ifneq ($(CONFIG_LCD4LINUX_NEEDS_libiconv),)
  CONFIGURE_ARGS+= \
	--with-libiconv-prefix="$(ICONV_PREFIX)"
else
  CONFIGURE_ARGS+= \
	--without-libiconv-prefix
endif

ifneq ($(CONFIG_LCD4LINUX_NEEDS_libmysqlclient),)
  EXTRA_LDFLAGS+= -L$(STAGING_DIR)/usr/lib/mysql
endif

ifneq ($(CONFIG_LCD4LINUX_NEEDS_python),)
  CONFIGURE_ARGS+= --with-python
else
  CONFIGURE_ARGS+= --without-python
endif

ifneq ($(CONFIG_LCD4LINUX_NEEDS_libX11),)
  CONFIGURE_ARGS+= --with-x
else
  CONFIGURE_ARGS+= --without-x
endif


define Package/lcd4linux/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/lcd4linux $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/lcd4linux.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/lcd4linux.init $(1)/etc/init.d/lcd4linux
endef

$(eval $(call BuildPackage,lcd4linux))
