#
# Copyright (C) 2007-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=wget
PKG_VERSION:=1.11.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNU/$(PKG_NAME)
PKG_MD5SUM:=f5076a8c2ec2b7f334cb6e3059820f9c

include $(INCLUDE_DIR)/package.mk

define Package/wget/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Non-interactive network downloader
  URL:=http://www.gnu.org/software/wget/index.html
endef

define Package/wget/Default/description
 Wget is a network utility to retrieve files from the Web using http 
 and ftp, the two most widely used Internet	protocols. It works 
 non-interactively, so it will work in the background, after having 
 logged off. The program supports recursive retrieval of web-authoring 
 pages as well as ftp sites -- you can use wget to make mirrors of 
 archives and home pages or to travel the Web like a WWW robot.
endef

define Package/wget
$(call Package/wget/Default)
  DEPENDS+= +libopenssl
  TITLE+= (with SSL support)
endef

define Package/wget/description
$(call Package/wget/Default/description)
 This package is built with SSL support.
endef

define Package/wget-nossl
$(call Package/wget/Default)
  TITLE+= (without SSL support)
endef

define Package/wget-nossl/description
$(call Package/wget/Default/description)
 This package is built without SSL support.
endef


define Build/Template

$(STAMP_BUILT)-$(2): $(STAMP_PREPARED)
	-$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(call Build/Configure/Default,$(3))
	$(MAKE) -C $(PKG_BUILD_DIR)
	( cd $(PKG_BUILD_DIR)/src; mv -f wget wget-$(2) )
	touch $$@

$(STAMP_BUILT): $(STAMP_BUILT)-$(2)

define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/wget-$(2) $$(1)/usr/bin/wget
endef

# FIXME: check if busybox really provides a wget applet
define Package/wget/postrm
#!/bin/sh
ln -sf ../../bin/busybox $${IPKG_INSTROOT}/usr/bin/wget
endef

endef

CONFIGURE_ARGS += \
	--disable-rpath

ifneq ($(SDK)$(CONFIG_PACKAGE_wget),)
  define Build/with-ssl
	$(call Build/Template,wget,with-ssl, \
		--with-ssl \
		--with-libssl-prefix="$(STAGING_DIR)/usr" \
	)
  endef
endif
$(eval $(Build/with-ssl))

ifneq ($(SDK)$(CONFIG_PACKAGE_wget-nossl),)
  define Build/without-ssl
	$(call Build/Template,wget-nossl,without-ssl, \
		--without-ssl \
	)
  endef
endif
$(eval $(Build/without-ssl))

$(eval $(call BuildPackage,wget))
$(eval $(call BuildPackage,wget-nossl))
