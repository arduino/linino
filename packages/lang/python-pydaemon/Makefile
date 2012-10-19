#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pydaemon
PKG_VERSION:=0.2.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://wookr.com/pydaemon/dl/
PKG_MD5SUM:=99f844f4d40c21c4d99a8659ecff000d

PKG_LICENSE:=BSD
PKG_LICENSE_FILES:=License.txt

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-pydaemon
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-pydaemon
  URL:=http://wookr.com/pydaemon
  DEPENDS:=+python +python-rsfile
  MAINTAINER:=Hamish Guthrie <hcg@openwrt.org>
endef

define Package/python-pydaemon/description
  Turn python scripts into Unix daemons
endef

define Build/Compile
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/pydaemon
	$(CP) \
		$(PKG_BUILD_DIR)/src/pydaemon \
       		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)
endef

define Package/python-pydaemon/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/pydaemon
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/pydaemon \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-pydaemon))
