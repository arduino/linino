include $(TOPDIR)/rules.mk

PKG_NAME:=l7-protocols
PKG_VERSION:=2007-10-10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/l7-filter
PKG_MD5SUM:=604cb6fc811c7fe80bdb2221db07bfe8

include $(INCLUDE_DIR)/package.mk

define Package/l7-protocols
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Protocols for layer7 filtering
  URL:=http://l7-filter.sourceforge.net/
endef

define Package/l7-protocols/description
	l7-filter classifies packets based on patterns in application 
	layer data. This allows correct classification of P2P traffic that 
	uses unpredictable ports as well as standard protocols running on 
	non-standard ports.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/l7-protocols/install
	$(INSTALL_DIR) $(1)/etc/l7-protocols
	$(CP) $(PKG_BUILD_DIR)/example_traffic \
		$(PKG_BUILD_DIR)/extra \
		$(PKG_BUILD_DIR)/file_types \
		$(PKG_BUILD_DIR)/groups.sh \
		$(PKG_BUILD_DIR)/malware \
		$(PKG_BUILD_DIR)/protocols \
		$(PKG_BUILD_DIR)/testing \
		$(1)/etc/l7-protocols
endef

$(eval $(call BuildPackage,l7-protocols))
