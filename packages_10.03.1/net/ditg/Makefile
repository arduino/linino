#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ditg
PKG_VERSION:=2.7.0
PKG_RELEASE:=Beta2

PKG_SOURCE:=D-ITG-${PKG_VERSION}-${PKG_RELEASE}.zip
PKG_SOURCE_URL:=http://www.grid.unina.it/software/ITG/codice/
PKG_MD5SUM:=6cf5f1a16283cff8297521ec4093df7f

PKG_BUILD_DIR:=$(BUILD_DIR)/D-ITG-${PKG_VERSION}-${PKG_RELEASE}

include $(INCLUDE_DIR)/package.mk

define Package/ditg/Default
  TITLE:=D-ITG (Distributed Internet Traffic Generator)
  SECTION:=net
  CATEGORY:=Network
  URL:=http://www.grid.unina.it/software/ITG/
  MAINTAINER:=Giovanni Di Stasi <giovanni.distasi@unina.it>
  DEPENDS:= +libpcap +libstdcpp
endef

define Package/ditg/Default/description
  D-ITG (Distributed Internet Traffic Generator) is a platform capable
  to produce traffic at packet level accurately replicating appropriate
  stochastic processes for both IDT (Inter Departure Time) and PS
  (Packet Size) random variables (exponential, uniform, cauchy, normal,
  pareto, ...). D-ITG supports both IPv4 and IPv6 traffic generation and
  it is capable to generate traffic at network, transport, and
  application layer. We believe that D-ITG shows interesting properties
  when compared to other traffic generators.
endef

define Package/ditg
  $(call Package/ditg/Default)
endef

# uncomment for arm targets
#EXTRA_FLAGS=" arm=on "

define Build/Compile
	$(MAKE) \
		CXX="$(TARGET_CXX)" \
		CXXOPT="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
		-C $(PKG_BUILD_DIR)/src $(EXTRA_CFLAGS)
endef

define Package/ditg/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/{ITGSend,ITGRecv,ITGLog,ITGDec}  \
		       $(1)/usr/bin
endef

$(eval $(call BuildPackage,ditg))
