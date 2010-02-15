#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tcpdump
PKG_VERSION:=4.0.0
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.tcpdump.org/release/ \
	http://ftp.gwdg.de/pub/misc/tcpdump/ \
	http://www.at.tcpdump.org/ \
	http://www.br.tcpdump.org/
PKG_MD5SUM:=b22ca72890df2301d922c9f2d17867f9

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/tcpdump/default
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap
  TITLE:=Network monitoring and data acquisition tool
  URL:=http://www.tcpdump.org/
endef

define Package/tcpdump
  $(Package/tcpdump/default)
  VARIANT:=full
endef

define Package/tcpdump-mini
  $(Package/tcpdump/default)
  TITLE+= (minimal version)
  VARIANT:=mini
endef

CONFIGURE_ARGS += --without-crypto

CONFIGURE_VARS += \
	BUILD_CC="$(TARGET_CC)" \
	HOSTCC="$(HOSTCC)" \
	td_cv_buggygetaddrinfo="no" \
	ac_cv_linux_vers=$(LINUX_VERSION)

MAKE_FLAGS := \
	CCOPT="$(TARGET_CFLAGS)" INCLS="-I. $(TARGET_CPPFLAGS)"

ifeq ($(BUILD_VARIANT),mini)
  TARGET_CFLAGS += -DTCPDUMP_MINI
  CONFIGURE_ARGS += --disable-smb
  MAKE_FLAGS += TCPDUMP_MINI=1
endif

define Package/tcpdump/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/tcpdump $(1)/usr/sbin/
endef

Package/tcpdump-mini/install = $(Package/tcpdump/install)

$(eval $(call BuildPackage,tcpdump))
$(eval $(call BuildPackage,tcpdump-mini))
