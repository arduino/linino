#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=RSFile
PKG_VERSION:=1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/R/RSFile
PKG_MD5SUM:=06f53cbcc268039212a853703abcb85a

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-rsfile
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-rsfile
  URL:=http://pypi.python.org/pypi/RSFile/
  DEPENDS:=+python
  MAINTAINER:=Hamish Guthrie <hcg@openwrt.org>
endef

define Package/python-rsfile/description
  RockSolidTools' file I/O implementation
endef

define Build/Compile
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_BUILD_DIR)/rsfile \
       		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_BUILD_DIR)/rsbackends \
       		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)
endef

define Package/python-rsfile/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/rsfile \
		$(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_BUILD_DIR)/rsbackends \
       		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-rsfile))
