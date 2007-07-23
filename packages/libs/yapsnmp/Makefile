#
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yapsnmp
PKG_VERSION:=0.7.8
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=8a3e9a5b814388d7907c639105cb2365
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/yapsnmp
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Python SNMP module
  DEPENDS:=+libnetsnmp
  DESCRIPTION:=\
  	yapsnmp is a Python SNMP module based on the net-snmp (formerly known \\\
	as ucd-snmp) library. It's composed of a low level interface to the \\\
	library, created using SWIG, and a higher level python module \\\
	removing all the complexity out of dealing with SNMP.
  URL:=http://yapsnmp.sourceforge.net/
endef


define Build/Configure
	$(call Build/Configure/Default, \
		--includedir="$(STAGING_DIR)/usr/include" \
		--oldincludedir="$(STAGING_DIR)/usr/include" \
		--enable-shared \
		--enable-static \
	)
endef

define Build/Compile
	$(SED) 's#^oldincludedir.*#oldincludedir = $(STAGING_DIR)/usr/include#' \
		$(PKG_BUILD_DIR)/src/Makefile
	$(SED) 's#^sys_lib_search_path_spec.*#sys_lib_search_path_spec="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib"#' \
		$(PKG_BUILD_DIR)/libtool
	$(MAKE) -C $(PKG_BUILD_DIR) \
		SNMPINCDIR="$(STAGING_DIR)/usr/include/net-snmp/library" \
		includedir="$(STAGING_DIR)/usr/include" \
		DESTDIR=$(PKG_INSTALL_DIR) \
		all install
endef

pylibdir:=$(shell $(STAGING_DIR)/usr/bin/hostpython $(SCRIPT_DIR)/pylibdir.py)
define Package/yapsnmp/install
	$(INSTALL_DIR) $(1)$(pylibdir)
	$(CP) -a $(PKG_INSTALL_DIR)/* $(1)$(pylibdir)
endef

$(eval $(call BuildPackage,yapsnmp))
