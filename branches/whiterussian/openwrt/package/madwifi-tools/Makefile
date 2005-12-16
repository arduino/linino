# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=madwifi
PKG_VERSION:=r1208-20051209
PKG_RELEASE:=1
PKG_MD5SUM:=276f3961c3174617b9dd0ec8db9779d7

PKG_SOURCE_URL:=http://snapshots.madwifi.org/madwifi-old
PKG_SOURCE:=$(PKG_NAME)-old-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-old-$(PKG_VERSION)

include $(TOPDIR)/package/rules.mk

$(eval $(call PKG_template,MADWIFI_TOOLS,madwifi-tools,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH),kmod-madwifi))

$(PKG_BUILD_DIR)/.configured:
	touch $@

$(PKG_BUILD_DIR)/.built:
	$(MAKE) -C $(PKG_BUILD_DIR)/tools \
		$(TARGET_CONFIGURE_OPTS)
	touch $@

$(IPKG_MADWIFI_TOOLS):
	mkdir -p $(IDIR_MADWIFI_TOOLS)/usr/sbin
	cp -fpR $(PKG_BUILD_DIR)/tools/athstats \
		$(PKG_BUILD_DIR)/tools/athdebug \
		$(PKG_BUILD_DIR)/tools/80211stats \
		$(PKG_BUILD_DIR)/tools/80211debug \
		$(PKG_BUILD_DIR)/tools/athctrl \
		$(PKG_BUILD_DIR)/tools/athkey \
		$(IDIR_MADWIFI_TOOLS)/usr/sbin
	$(RSTRIP) $(IDIR_MADWIFI_TOOLS)
	$(IPKG_BUILD) $(IDIR_MADWIFI_TOOLS) $(PACKAGE_DIR)
