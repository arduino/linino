#
# Copyright © 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nut
PKG_VERSION:=2.6.5
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.networkupstools.org/source/2.6/
PKG_MD5SUM:=e6eac4fa04baff0d0a827d64efe81a7e

PKG_BUILD_DEPENDS:=libusb-compat libnetsnmp
PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

PKG_BUILD_PARALLEL:=1

define Package/nut/Default
  URL:=http://www.networkupstools.org/
  TITLE:= Network UPS Tools
  DEPENDS:=@USB_SUPPORT +libnetsnmp +libpthread
  SECTION:=utils
  CATEGORY:=Utilities
endef

define Package/nut/description
  Network UPS Tools (NUT) is a client/server monitoring system that
  allows computers to share uninterruptible power supply (UPS) and
  power distribution unit (PDU) hardware. Clients access the hardware
  through the server, and are notified whenever the power status
  changes.
endef

define Package/nut
$(call Package/nut/Default)
  MENU:=1
#  TITLE+= (common)
endef

define Package/nut-server
$(call Package/nut/Default)
  TITLE+= (server)
  DEPENDS+= nut
endef

define Package/nut-client
$(call Package/nut/Default)
  TITLE+= (client)
  DEPENDS+= nut
endef

define Package/nut-logger
$(call Package/nut/Default)
  TITLE+= (logger)
  DEPENDS+= nut
endef

define Package/nut-monitor
$(call Package/nut/Default)
  TITLE+= (monitor)
  DEPENDS+= nut
endef

define Package/nut/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/etc/nut
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libupsclient.so* $(1)/usr/lib/
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/nut/nut.conf.sample $(1)/etc/nut/nut.conf
	ln -sf /var/run/ups.conf $(1)/etc/nut/ups.conf
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/*.pc $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib* $(1)/usr/lib
endef

define Package/nut/conffiles
/etc/nut/nut.conf
endef

define Package/nut-client/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/upsc $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/upsrw $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/upscmd $(1)/usr/bin
endef

define Package/nut-server/install
	$(INSTALL_DIR) $(1)/etc/nut
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/lib/nut
	$(INSTALL_DIR) $(1)/usr/share/nut
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/ups.init $(1)/etc/init.d/ups
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/upsd $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/lib/nut/upsdrvctl $(1)/lib/nut
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/nut/upsd.conf.sample $(1)/etc/nut/upsd.conf
	ln -sf /var/run/upsd.users $(1)/etc/nut/upsd.users
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/nut/cmdvartab $(1)/usr/share/nut/cmdvartab
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/nut/driver.list $(1)/usr/share/nut/driver.list
endef

define Package/nut-server/conffiles
/etc/nut/upsd.conf
endef

define Package/nut-logger/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/upslog $(1)/usr/bin
endef

define Package/nut-monitor/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/nut
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/upsmon.init $(1)/etc/init.d/upsmon
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/upsmon $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/upssched $(1)/usr/sbin
	ln -sf /var/run/upsmon.conf $(1)/etc/nut/upsmon.conf
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/nut/upssched.conf.sample $(1)/etc/nut/upssched.conf
endef

define Package/nut-monitor/conffiles
/etc/nut/upssched.conf
endef

define DriverPackage
  define Package/nut-driver-$(1)
    $(call Package/nut/Default)
    TITLE += ($(1) driver)
    DEPENDS += nut nut-server
    ifeq ($(1),$(filter $(1),$(USB_LIBUSB_DRIVERLIST)))
      DEPENDS+=libusb-compat
    endif
    ifeq ($(1),$(filter $(1),$(SNMP_DRIVERLIST)))
      DEPENDS+=libnetsnmp
    endif
  endef
  # Deliberately empty (well, some spaces) in order to trigger a build
  # failure. It should be overridden by the list below, and when updating
  # to a new version of nut we will need to provide descriptions for any
  # new drivers.
  define Package/nut-driver-$(1)/description
  
  endef
  define Package/nut-driver-$(1)/install
	$(INSTALL_DIR) $$(1)/lib/nut/
	$(INSTALL_BIN) $$(PKG_INSTALL_DIR)/lib/nut/$(1) $$(1)/lib/nut/
    ifeq ($(1),clone)
	# Bundle clone and clone-outlet together
	$(INSTALL_BIN) $$(PKG_INSTALL_DIR)/lib/nut/$(1)-outlet $$(1)/lib/nut/
    endif
  endef
endef

# These lists are lifted *directly* from drivers/Makefile.am in the nut
# source tree. This it to make it simpler to keep in sync when updating
# to a newer version of nut. Do not edit this manually.
#
# DO NOT EDIT (except to update with a fresh cut/paste)!
SERIAL_DRIVERLIST = bcmxcp belkin belkinunv bestfcom    \
 bestfortress bestuferrups bestups dummy-ups etapro everups     \
 gamatronic genericups isbmex liebert liebert-esp2 masterguard metasys  \
 oldmge-shut mge-utalk microdowell mge-shut oneac optiups powercom rhino        \
 safenet skel solis tripplite tripplitesu upscode2 victronups powerpanel \
 blazer_ser clone clone-outlet ivtscd apcsmart apcsmart-old
SNMP_DRIVERLIST = snmp-ups
USB_LIBUSB_DRIVERLIST = usbhid-ups bcmxcp_usb tripplite_usb \
 blazer_usb richcomm_usb
# END: DO NOT EDIT!

NUT_DRIVERS := $(filter-out skel clone-outlet,$(SERIAL_DRIVERLIST)) \
	$(USB_LIBUSB_DRIVERLIST) $(SNMP_DRIVERLIST)

$(foreach d,$(NUT_DRIVERS),$(eval $(call DriverPackage,$(d))))

define DriverDescription
  define Package/nut-driver-$(1)/description
    $(2)
  endef
endef

$(eval $(call DriverDescription,apcsmart,\
	Driver for American Power Conversion Smart Protocol UPS equipment))
$(eval $(call DriverDescription,apcsmart-old,\
	Driver for American Power Conversion Smart Protocol UPS equipment))
$(eval $(call DriverDescription,bcmxcp,\
	Driver for UPSes supporting the serial BCM/XCP protocol))
$(eval $(call DriverDescription,bcmxcp_usb,\
	Experimental driver for UPSes supporting the BCM/XCP protocol over USB))
$(eval $(call DriverDescription,belkin,\
	Driver for Belkin serial UPS equipment))
$(eval $(call DriverDescription,belkinunv,\
	Driver for Belkin "Universal UPS" and compatible))
$(eval $(call DriverDescription,bestfcom,\
	Driver for Best Power Fortress/Ferrups))
$(eval $(call DriverDescription,bestfortress,\
	Driver for old Best Fortress UPS equipment))
$(eval $(call DriverDescription,bestuferrups,\
	Driver for Best Power Micro-Ferrups))
$(eval $(call DriverDescription,bestups,\
	Driver for Best Power / SOLA (Phoenixtec protocol) UPS equipment))
$(eval $(call DriverDescription,blazer_ser,\
	Driver for Megatec/Q1 protocol serial))
$(eval $(call DriverDescription,blazer_usb,\
	Driver for Megatec/Q1 protocol USB))
$(eval $(call DriverDescription,clone,\
	UPS driver clone))
$(eval $(call DriverDescription,dummy-ups,\
	Driver for multi-purpose UPS emulation))
$(eval $(call DriverDescription,etapro,\
	Driver for ETA UPS equipment))
$(eval $(call DriverDescription,everups,\
	Driver for Ever UPS models))
$(eval $(call DriverDescription,gamatronic,\
	Driver for Gamatronic UPS equipment))
$(eval $(call DriverDescription,genericups,\
	Driver for contact-closure UPS equipment))
$(eval $(call DriverDescription,isbmex,\
	Driver for ISBMEX UPS equipment))
$(eval $(call DriverDescription,ivtscd,\
	driver for the IVT Solar Controller Device))
$(eval $(call DriverDescription,liebert,\
	Driver for Liebert contact-closure UPS equipment))
$(eval $(call DriverDescription,liebert-esp2,\
	Driver for Liebert UPS using the ESP-II protocol))
$(eval $(call DriverDescription,masterguard,\
	Driver for Masterguard UPS equipment))
$(eval $(call DriverDescription,metasys,\
	Driver for Meta System UPS equipment))
$(eval $(call DriverDescription,mge-shut,\
	Driver for SHUT Protocol UPS equipment))
$(eval $(call DriverDescription,mge-utalk,\
	Driver for MGE UPS SYSTEMS UTalk protocol equipment))
$(eval $(call DriverDescription,microdowell,\
	Driver for Microdowell Enterprise UPS series))
$(eval $(call DriverDescription,oldmge-shut,\
	Driver for SHUT Protocol UPS equipment))
$(eval $(call DriverDescription,oneac,\
	Driver for Oneac UPS equipment))
$(eval $(call DriverDescription,optiups,\
	Driver for Opti-UPS (Viewsonice) UPS and Zinto D (ONLINE-USV) equipment))
$(eval $(call DriverDescription,powercom,\
	UPS driver for Powercom/Trust/Advice UPS equipment))
$(eval $(call DriverDescription,powerpanel,\
	Driver for PowerPanel Plus compatible UPS equipment))
$(eval $(call DriverDescription,rhino,\
	Driver for Brazilian Microsol RHINO UPS equipment))
$(eval $(call DriverDescription,richcomm_usb,\
	Driver UPS equipment using Richcomm dry-contact to USB solution))
$(eval $(call DriverDescription,safenet,\
	Driver for SafeNet compatible UPS equipment))
$(eval $(call DriverDescription,solis,\
	Driver for Brazilian Microsol SOLIS UPS equipment))
$(eval $(call DriverDescription,tripplite,\
	Driver for Tripp-Lite SmartPro UPS equipment))
$(eval $(call DriverDescription,tripplitesu,\
	Driver for Tripp-Lite SmartOnline (SU) UPS equipment))
$(eval $(call DriverDescription,tripplite_usb,\
	Driver for older Tripp Lite USB UPSes (not PDC HID)))
$(eval $(call DriverDescription,upscode2,\
	Driver for UPScode II compatible UPS equipment))
$(eval $(call DriverDescription,usbhid-ups,\
	Driver for USB/HID UPS equipment))
$(eval $(call DriverDescription,victronups,\
	Driver for IMV/Victron UPS unit Match, Match Lite, NetUps))
$(eval $(call DriverDescription,snmp-ups,\
	Multi-MIB Driver for SNMP UPS equipment))

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS += \
  --without-ssl \
  --with-pidpath=/var/run \
  --with-statepath=/var/run \
  --with-altpidpath=/var/run \
  --sysconfdir=/etc/nut \
  --with-drvpath=/lib/nut \
  --datadir=/usr/share/nut \
  --with-user=root \
  --with-group=root \
  --with-usb \
  --with-snmp \
  --without-libltdl \
  --with-dev


$(eval $(call BuildPackage,nut))
$(eval $(call BuildPackage,nut-client))
$(eval $(call BuildPackage,nut-server))
$(eval $(call BuildPackage,nut-monitor))
$(eval $(call BuildPackage,nut-logger))
$(foreach d,$(NUT_DRIVERS),$(eval $(call BuildPackage,nut-driver-$(d))))
