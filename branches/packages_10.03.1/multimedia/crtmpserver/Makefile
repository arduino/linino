# 
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=crtmpserver
PKG_REV:=346
PKG_VERSION:=r$(PKG_REV)
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=--username=anonymous --password= https://svn.rtmpd.com/crtmpserver/trunk
PKG_SOURCE_SUBDIR:=crtmpserver-$(PKG_VERSION)
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE_PROTO:=svn

include $(INCLUDE_DIR)/package.mk

define Package/crtmpserver
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libopenssl +libstdcpp
  TITLE:=C++ RTMP Server
  URL:=http://www.rtmpd.com/
endef

define Package/crtmpserver/description
C++ RTMP Server it is a high performance streaming server able to
stream (live or recorded) in the following technologies:
 * To and from Flash (RTMP,RTMPE, RTMPS, RTMPT, RTMPTE)
 * To and from embedded devices: iPhone, Android
 * From surveillance cameras
 * IP-TV using MPEG-TS and RTSP/RTCP/RTP protocols
                
Also, crtmpserver can be used as a high performance rendes-vous
server. For example, it enables you to do:
 * Audio/Video conferencing
 * Online gaming
 * Online collaboration
 * Simple/complex chat applications
endef

# XXX: this hack handles the usr/bin vs bin difference of backfire and trunk
TS_BASE:=$(wildcard $(TOOLCHAIN_DIR)/bin/$(TARGET_CC))
TS_BASE:=$(dir $(if $(TS_BASE),$(TS_BASE),$(wildcard $(TOOLCHAIN_DIR)/usr/bin/$(TARGET_CC))))

define Build/Configure
	(cd $(PKG_BUILD_DIR)/builders/make; \
		cp linux.mk linux-openwrt-uclibc.mk; \
		$(SED) 's,^TOOLCHAIN_BASE[[:space:]]*=.*,TOOLCHAIN_BASE=$(TS_BASE),' \
			-e 's,^TOOLCHAIN_PREFIX[[:space:]]*=.*,TOOLCHAIN_PREFIX=$(TARGET_CROSS),' \
			-e 's,^OPTIMIZATIONS[[:space:]]*=.*,OPTIMIZATIONS=-O2,' \
			-e 's,^SSL_BASE[[:space:]]*=.*,SSL_BASE=$(STAGING_DIR)/usr,' \
			linux-openwrt-uclibc.mk)
endef

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR)/builders/make \
		PLATFORM=linux-openwrt-uclibc
endef

define Package/crtmpserver/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/builders/make/output/dynamic/rtmpserver $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/rtmpserver
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/builders/make/output/dynamic/*.so $(1)/usr/lib/rtmpserver/
	$(foreach app,flvplayback samplefactory admin stresstest appselector vptests applestreamingclient proxypublish, \
		$(INSTALL_DIR) $(1)/usr/lib/rtmpserver/$(app); \
		$(INSTALL_BIN) $(PKG_BUILD_DIR)/builders/make/output/dynamic/applications/$(app)/lib$(app).so \
			$(1)/usr/lib/rtmpserver/$(app)/; \
	)
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/builders/make/output/dynamic/rtmpserver.lua $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/share/rtmpserver/appselector
	$(INSTALL_DIR) $(1)/usr/share/rtmpserver/media
endef

$(eval $(call BuildPackage,crtmpserver))

