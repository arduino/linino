#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lcd4linux
PKG_REV:=1037
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://ssl.bulix.org/svn/lcd4linux/trunk/
PKG_SOURCE_SUBDIR:=lcd4linux-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=svn

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lcd4linux
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libusb
  TITLE:=LCD display utility
  URL:=http://lcd4linux.bulix.org/
  MENU:=1
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
	G15 \
	GLCD2USB \
	IRLCD \
	HD44780 \
	LCD2USB \
	LCDLinux \
	LCDTerm \
	LPH7508 \
	LUIse \
	M50530 \
	MatrixOrbital \
	MatrixOrbitalGX \
	MilfordInstruments \
	Noritake \
	NULL \
	PNG \
	PPM \
	Pertelian \
	PHAnderson \
	picoLCD \
	picoLCDGraphic \
	RouterBoard \
	serdisplib \
	ShuttleVFD \
	SimpleLCD \
	st2205 \
	T6963 \
	Trefon \
	USBLCD \
	USBHUB \
	ULA200 \
	VNC \
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
	hddtemp \
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

ifneq ($(CONFIG_LCD4LINUX_DRV_PNG),)
PKG_BUILD_DEPENDS += libgd
endif

ifneq ($(CONFIG_LCD4LINUX_DRV_PPM),)
PKG_BUILD_DEPENDS += libgd
endif

ifneq ($(CONFIG_LCD4LINUX_DRV_G15),)
PKG_BUILD_DEPENDS += libgd
endif

ifneq ($(CONFIG_LCD4LINUX_DRV_LPH7508),)
PKG_BUILD_DEPENDS += libgd
endif

ifneq ($(CONFIG_LCD4LINUX_DRV_LUIse),)
PKG_BUILD_DEPENDS += libgd
endif

ifneq ($(CONFIG_LCD4LINUX_DRV_Noritake),)
PKG_BUILD_DEPENDS += libgd
endif

ifneq ($(CONFIG_LCD4LINUX_DRV_serdisplib),)
PKG_BUILD_DEPENDS += libgd, serdisplib
endif

ifneq ($(CONFIG_LCD4LINUX_DRV_st2205),)
PKG_BUILD_DEPENDS += libgd, st2205tool
endif

ifneq ($(CONFIG_LCD4LINUX_DRV_T6963),)
PKG_BUILD_DEPENDS += libgd
endif

ifneq ($(CONFIG_LCD4LINUX_DRV_Curses),)
PKG_BUILD_DEPENDS += libncurses
endif

ifneq ($(CONFIG_LCD4LINUX_DRV_VNC),)
PKG_BUILD_DEPENDS += libvncserver
endif

ifneq ($(CONFIG_LCD4LINUX_DRV_X11),)
PKG_BUILD_DEPENDS += libgd, libX11
endif

ifneq ($(CONFIG_LCD4LINUX_PLUGIN_gps),)
PKG_BUILD_DEPENDS += libnmeap
endif

ifneq ($(CONFIG_LCD4LINUX_PLUGIN_iconv),)
PKG_BUILD_DEPENDS += libiconv
endif

ifneq ($(CONFIG_LCD4LINUX_PLUGIN_mysql),)
PKG_BUILD_DEPENDS += libmysqlclient
endif

# XXX: lcd4linux needs at least one driver and one plugin, if none are selected, build'em all
ifeq ($(strip $(LCD4LINUX_CONFIGURE_DRIVERS)),)
  LCD4LINUX_CONFIGURE_DRIVERS:=all
endif  
ifeq ($(strip $(LCD4LINUX_CONFIGURE_PLUGINS)),)
  LCD4LINUX_CONFIGURE_PLUGINS:=all
endif  
  
## TODO PYTHON PLUGIN, DEPENDS on ver >= '2.1.0'


EXTRA_CFLAGS+= $(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/lib/libiconv/include
EXTRA_LDFLAGS+= $(TARGET_LDFLAGS) -Wl,-rpath-link,$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/usr/lib/libiconv/lib

TARGET_CONFIGURE_OPTS+=\
	CC="$(TARGET_CC) $(EXTRA_CFLAGS) $(EXTRA_LDFLAGS)"

CONFIGURE_ARGS += \
	--without-x \
	--without-python \
	--disable-rpath \
	--with-drivers="$(strip $(LCD4LINUX_CONFIGURE_DRIVERS))" \
	--with-plugins="$(strip $(LCD4LINUX_CONFIGURE_PLUGINS))" \


define Package/lcd4linux/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/$(PKG_NAME).conf $(1)/etc/$(PKG_NAME).conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
endef

$(eval $(call BuildPackage,lcd4linux))
