#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-sip
PKG_VERSION:=4.10.5
PKG_RELEASE:=1

PKG_SOURCE:=sip-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.riverbankcomputing.co.uk/static/Downloads/sip4
PKG_MD5SUM:=0a591ef6e59aa16e56822d3eb9fe21b8
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1
HOST_BUILD_PARALLEL:=1
HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/sip-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/sip-$(PKG_VERSION)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)
-include $(if $(DUMP),,./files/python-sip-package.mk)

define Package/python-sip
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=Python SIP
  DEPENDS:=+python
  MAINTAINER:=Michael Buesch <mb@bu3sch.de>
  URL:=http://www.riverbankcomputing.co.uk/software/sip/download
endef


# ===> TARGET <===

EXTRA_CFLAGS:=\
	$(FPIC)

define Build/Configure
	$(INSTALL_DIR) "$(PYTHON_SIP_CONFIG_TEMPLATE_DIR)"; \
	$(CP) ./files/sipconfig.macros.template "$(PYTHON_SIP_CONFIG_TEMPLATE)"; \
	echo "CC			$(TARGET_CROSS)gcc" >> $(PYTHON_SIP_CONFIG_TEMPLATE); \
	echo "CFLAGS			$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" >> $(PYTHON_SIP_CONFIG_TEMPLATE); \
	echo "CXX			$(TARGET_CROSS)g++" >> $(PYTHON_SIP_CONFIG_TEMPLATE); \
	echo "CXXFLAGS			$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" >> $(PYTHON_SIP_CONFIG_TEMPLATE); \
	echo "LINK			$(TARGET_CROSS)g++" >> $(PYTHON_SIP_CONFIG_TEMPLATE); \
	echo "LINK_SHLIB		$(TARGET_CROSS)g++" >> $(PYTHON_SIP_CONFIG_TEMPLATE); \
	echo "LFLAGS			$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS)" >> $(PYTHON_SIP_CONFIG_TEMPLATE); \
	echo "AR			$(TARGET_CROSS)ar cqs" >> $(PYTHON_SIP_CONFIG_TEMPLATE); \
	echo "STRIP			$(STRIP)" >> $(PYTHON_SIP_CONFIG_TEMPLATE); \
	(	cd "$(PKG_BUILD_DIR)"; \
		export PYTHONDONTWRITEBYTECODE=1; \
		python -E ./configure.py \
			--bindir=$(PKG_INSTALL_DIR)/usr/bin \
			--destdir=$(PKG_INSTALL_DIR)/$(PYTHON_PKG_DIR) \
			--incdir=$(PKG_INSTALL_DIR)/usr/include \
			--sipdir=$(PKG_INSTALL_DIR)/usr/share/sip \
			--sipconfig-macros="$(PYTHON_SIP_CONFIG_TEMPLATE)" \
	)
endef

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CROSS)gcc" \
		CXX="$(TARGET_CROSS)g++" \
		LINK="$(TARGET_CROSS)g++" \
		CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
		CXXFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)"
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/mk
	$(INSTALL_DATA) ./files/python-sip-package.mk $(1)/mk/
endef

define Build/Install
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CROSS)gcc" \
		CXX="$(TARGET_CROSS)g++" \
		LINK="$(TARGET_CROSS)g++" \
		CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
		CXXFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
		DESTDIR="" \
		install
endef

define Package/python-sip/install
	# We only install the python module for now...
	$(INSTALL_DIR) $(1)/$(PYTHON_PKG_DIR)
	$(CP) $(PKG_INSTALL_DIR)/$(PYTHON_PKG_DIR)/* $(1)/$(PYTHON_PKG_DIR)
endef


# ===> HOST <===

define Host/Configure
	(	cd "$(HOST_BUILD_DIR)"; \
		export PYTHONDONTWRITEBYTECODE=1; \
		python -E ./configure.py \
			--bindir=$(STAGING_DIR_HOST)/usr/bin \
			--destdir=$(STAGING_DIR_HOST)/$(PYTHON_PKG_DIR) \
			--incdir=$(STAGING_DIR_HOST)/usr/include \
			--sipdir=$(STAGING_DIR_HOST)/usr/share/sip \
	)
endef

define Host/Compile
	$(MAKE) $(HOST_JOBS) -C $(HOST_BUILD_DIR) \
		CC="$(HOSTCC)" \
		CXX="g++" \
		LINK="g++" \
		CFLAGS="$(HOST_CFLAGS)" \
		CXXFLAGS="$(HOST_CFLAGS)"
endef

define Host/Install
	$(MAKE) -C $(HOST_BUILD_DIR) \
		CC="$(HOSTCC)" \
		CXX="g++" \
		LINK="g++" \
		CFLAGS="$(HOST_CFLAGS)" \
		CXXFLAGS="$(HOST_CFLAGS)" \
		install
endef

define Require/python2-dev
  [ -e /usr/include/Python.h ] || \
  [ -e /usr/include/python/Python.h ] || \
  [ -e /usr/include/python2.5/Python.h ] || \
  [ -e /usr/include/python2.6/Python.h ]
endef

$(eval $(call Require,python2-dev, \
	Please install Python 2.x headers (python-dev) \
))

$(eval $(call RequireCommand,python, \
	Please install Python 2.x \
))

$(eval $(call HostBuild))
$(eval $(call BuildPackage,python-sip))
