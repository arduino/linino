#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pulseaudio
PKG_VERSION:=0.99.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://freedesktop.org/software/pulseaudio/releases/
PKG_MD5SUM:=a73d30cc01ad430681e27160e22e7f8c

PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=intltool/host

PKG_FIXUP = libtool

PKG_INSTALL = 1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

#TODO: split pulse into executable and library (or even better into several libraries since they're used as loadable modules, so not linked into)
define Package/pulseaudio/Default
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libspeexdsp +libsndfile +libltdl +libpthread \
	+librt +alsa-lib +libjson $(ICONV_DEPENDS) $(INTL_DEPENDS) \
	@!UCLIBC_VERSION_0_9_30_1 @!UCLIBC_VERSION_0_9_30_2 \
	@!UCLIBC_VERSION_0_9_30_3
  TITLE:=Network sound server
  URL:=http://www.pulseaudio.org
endef

define Package/pulseaudio-daemon
  $(call Package/pulseaudio/Default)
  VARIANT:=noavahi
endef

define Package/pulseaudio-daemon-avahi
  $(call Package/pulseaudio/Default)
  DEPENDS+=+dbus +libavahi-client +avahi-daemon-dbus
  TITLE+= (avahi)
  VARIANT:=avahi
endef

define Package/pulseaudio/Default/description
  PulseAudio (formerly Polypaudio) is a cross-platform, networked sound server.
endef

define Package/pulseaudio-daemon/description
  $(call Package/pulseaudio/Default/description)
endef

define Package/pulseaudio-daemon-avahi/description
  $(call Package/pulseaudio/Default/description)
  This package is compiled against dbus and avahi.
endef

define Package/pulseaudio-daemon/conffiles
/etc/pulse/client.conf
/etc/pulse/daemon.conf
/etc/pulse/default.pa
/etc/pulse/system.pa
endef

define Package/pulseaudio-daemon-avahi/conffiles
/etc/pulse/client.conf
/etc/pulse/daemon.conf
/etc/pulse/default.pa
/etc/pulse/system.pa
endef

define Package/pulseaudio-tools
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+libsndfile @PACKAGE_pulseaudio-daemon||PACKAGE_pulseaudio-daemon-avahi #+libpulse
  TITLE:=Tools for Pulseaudio
  URL:=http://www.pulseaudio.org
  VARIANT:=noavahi
endef

define Package/pulseaudio-profiles
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=@PACKAGE_pulseaudio-daemon||PACKAGE_pulseaudio-daemon-avahi
  TITLE:=Profiles for Pulseaudio
  URL:=http://www.pulseaudio.org
endef

CONFIGURE_ARGS += \
	--with-system-user=root \
	--with-system-group=root \
	--with-access-group=root \
	--with-database=simple \
	--enable-alsa \
	--disable-hal \
	--disable-gconf \
	--disable-tcpwrap \
	--disable-nls \
	--disable-manpages \
	--disable-oss-output \
	--disable-oss-wrapper \
	--disable-samplerate \
	--disable-per-user-esound-socket \
	--disable-solaris \
	--disable-glib2 \
	--disable-jack \
	--disable-asyncns \
	--disable-lirc \
	--disable-bluez \
	--without-caps

ifeq ($(BUILD_VARIANT),avahi)
CONFIGURE_ARGS += \
	--enable-avahi \
	--enable-dbus
endif
ifeq ($(BUILD_VARIANT),noavahi)
CONFIGURE_ARGS += \
	--disable-avahi \
	--disable-dbus	
endif

CONFIGURE_VARS += \
	PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig"

#SUPP_LIBS:=-L$(INTL_PREFIX)/lib -L$(ICONV_PREFIX)/lib
TARGET_CFLAGS += -std=gnu99

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/lib/pkgconfig \
		$(1)/usr/include/pulse \
		$(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/include/pulse/* \
		$(1)/usr/include/pulse
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc \
		$(1)/usr/lib/pkgconfig
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/
endef

define Package/pulseaudio-daemon/install
	$(INSTALL_DIR) \
		$(1)/etc/pulse \
		$(1)/etc/init.d \
		$(1)/usr/bin \
		$(1)/usr/lib \
		$(1)/usr/lib/pulse-0.99/modules 

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/pulseaudio \
		$(1)/usr/bin/pulseaudio

	$(INSTALL_BIN) \
		./files/pulseaudio.init \
		$(1)/etc/init.d/pulseaudio

	$(INSTALL_CONF) \
		$(PKG_INSTALL_DIR)/etc/pulse/* \
		$(1)/etc/pulse

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pulse-0.99/modules/lib*.so \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pulse-0.99/modules/module*.so \
		$(1)/usr/lib/pulse-0.99/modules/
endef

define Package/pulseaudio-daemon-avahi/install
	$(INSTALL_DIR) \
		$(1)/etc/pulse \
		$(1)/etc/init.d \
		$(1)/usr/bin \
		$(1)/usr/lib \
		$(1)/usr/lib/pulse-0.99/modules \
		$(1)/etc/dbus-1/system.d 

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/pulseaudio \
		$(1)/usr/bin/pulseaudio

	$(INSTALL_BIN) \
		./files/pulseaudio.init \
		$(1)/etc/init.d/pulseaudio

	$(INSTALL_CONF) \
		$(PKG_INSTALL_DIR)/etc/pulse/* \
		$(1)/etc/pulse

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pulse-0.99/modules/lib*.so \
		$(1)/usr/lib/

	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/pulse-0.99/modules/module*.so \
		$(1)/usr/lib/pulse-0.99/modules/

	$(INSTALL_CONF) \
		$(PKG_INSTALL_DIR)/etc/dbus-1/system.d/pulseaudio-system.conf \
		$(1)/etc/dbus-1/system.d/pulseaudio-system.conf

	$(SED) \
		's/user="pulse"/user="root"/' \
		$(1)/etc/dbus-1/system.d/pulseaudio-system.conf
endef

define Package/pulseaudio-tools/install
	$(INSTALL_DIR) \
		$(1)/usr/bin

	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/pa* \
		$(1)/usr/bin/
endef

define Package/pulseaudio-profiles/install
	$(INSTALL_DIR) \
		$(1)/usr/share/pulseaudio/alsa-mixer/paths \
		$(1)/usr/share/pulseaudio/alsa-mixer/profile-sets

	$(INSTALL_CONF) \
		$(PKG_INSTALL_DIR)/usr/share/pulseaudio/alsa-mixer/paths/* \
		$(1)/usr/share/pulseaudio/alsa-mixer/paths

	$(INSTALL_CONF) \
		$(PKG_INSTALL_DIR)/usr/share/pulseaudio/alsa-mixer/profile-sets/* \
		$(1)/usr/share/pulseaudio/alsa-mixer/profile-sets
endef

$(eval $(call BuildPackage,pulseaudio-daemon))
$(eval $(call BuildPackage,pulseaudio-daemon-avahi))
$(eval $(call BuildPackage,pulseaudio-tools))
$(eval $(call BuildPackage,pulseaudio-profiles))
