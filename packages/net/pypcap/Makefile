include $(TOPDIR)/rules.mk

PKG_NAME:=pypcap
PKG_VERSION:=1.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pypcap.googlecode.com/files
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/pypcap
  DEPENDS:=+python +libpcap
  SECTION:=net
  CATEGORY:=Network
  TITLE:=pypcap
  DESCRIPTION:=\
  	pypcap
  URL:=http://www
endef

define Build/Compile
	$(call Build/Compile/PyMod,\
		PCAP_HOME=$(STAGING_DIR)/usr \
		,\
		install \
	)
endef

define Package/pypcap/install
	cd $(PKG_BUILD_DIR); \
	$(STAGING_DIR)/usr/bin/hostpython ./setup.py install \
		--no-compile --prefix $(PKG_INSTALL_DIR)/usr
	cp -a $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,pypcap))
