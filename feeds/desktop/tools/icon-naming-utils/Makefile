include $(TOPDIR)/rules.mk

PKG_NAME:=icon-naming-utils
PKG_VERSION:=0.8.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://tango.freedesktop.org/releases/
PKG_MD5SUM:=2bcd77b8b6361831a932a5e76e82b66d
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/icon-naming-utils
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Tool for generating icon themes
  URL:=http://tango.freedesktop.org/
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--libexecdir=/lib/icon-naming-utils \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(2)/lib/icon-naming-utils
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/lib/icon-naming-utils/icon-name-mapping \
		$(2)/lib/icon-naming-utils/
	$(SED) \
		's,/usr/share/icon-naming-utils,$(STAGING_DIR)/host/share/icon-naming-utils,g' \
		$(2)/lib/icon-naming-utils/icon-name-mapping

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/
	$(SED) \
		's,^program_path=,program_path=$(STAGING_DIR)/host,g' \
		$(1)/usr/lib/pkgconfig/icon-naming-utils.pc

	$(INSTALL_DIR) $(2)/share/icon-naming-utils/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/icon-naming-utils/* \
		$(2)/share/icon-naming-utils/
endef

define Package/icon-naming-utils/install
	true
endef

define Require/perl-xml-simple
  perl -e 'use XML::Simple;'
endef

$(eval $(call Require,perl-xml-simple, \
	Please install Perl XML::Simple \
))

$(eval $(call BuildPackage,icon-naming-utils))
