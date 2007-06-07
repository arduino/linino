# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=twisted
PKG_VERSION:=2.5.0
PKG_RELEASE:=1

PKG_SOURCE:=Twisted-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://tmrc.mit.edu/mirror/twisted/Twisted/2.5
PKG_MD5SUM:=56df2ae66db57932515a491c03bf514f
PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(BUILD_DIR)/Twisted-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

TWISTED_SUPPROJECTS:=core

ZOPE_IF_VER=3.3.0

define Package/twisted/default
  SECTION:=libs
  CATEGORY:=Libraries
  URL:=http://twistedmatrix.com
  TITLE:=A networking engine written in Python
  DESCRIPTION:=\
	Twisted is a networking engine written in Python, supporting \\\
	numerous protocols. It contains a web server, numerous chat \\\
	clients, chat servers, mail servers, and more.
endef

define Package/twisted
  $(call Package/twisted/default)
  DEPENDS:=+python +zope-interface
  TITLE:=A networking engine written in Python
  DESCRIPTION:=\
	Twisted is a networking engine written in Python, supporting \\\
	numerous protocols. It contains a web server, numerous chat \\\
	clients, chat servers, mail servers, and more.
  URL:=http://twistedmatrix.com
  MENU:=1
endef

define Package/zope-interface
  $(call Package/twisted/default)
  TITLE:=zope-interface
  DESCRIPTION:=zope-interface
endef

define Package/twisted-conch
  $(call Package/twisted/default)
  DEPENDS:=twisted
  TITLE:=TwistedConch
endef

define Package/twisted-lore
  $(call Package/twisted/default)
  DEPENDS:=twisted
  TITLE:=TwistedLore
endef

define Package/twisted-mail
  $(call Package/twisted/default)
  DEPENDS:=twisted
  TITLE:=TwistedMail
endef

define Package/twisted-names
  $(call Package/twisted/default)
  DEPENDS:=twisted
  TITLE:=TwistedNames
endef

define Package/twisted-news
  $(call Package/twisted/default)
  DEPENDS:=twisted
  TITLE:=TwistedNews
endef

define Package/twisted-runner
  $(call Package/twisted/default)
  DEPENDS:=twisted
  TITLE:=TwistedRunner
endef

define Package/twisted-web
  $(call Package/twisted/default)
  DEPENDS:=twisted
  TITLE:=TwistedWeb
endef

define Package/twisted-words
  $(call Package/twisted/default)
  DEPENDS:=twisted
  TITLE:=TwistedWords
endef

ifneq ($(CONFIG_PACKAGE_twisted-words),)
  TWISTED_SUBPROJECTS+=words
endif
ifneq ($(CONFIG_PACKAGE_twisted-conch),)
  TWISTED_SUBPROJECTS+=conch
endif
ifneq ($(CONFIG_PACKAGE_twisted-lore),)
  TWISTED_SUBPROJECTS+=lore
endif
ifneq ($(CONFIG_PACKAGE_twisted-mail),)
  TWISTED_SUBPROJECTS+=mail
endif
ifneq ($(CONFIG_PACKAGE_twisted-names),)
  TWISTED_SUBPROJECTS+=names
endif
ifneq ($(CONFIG_PACKAGE_twisted-news),)
  TWISTED_SUBPROJECTS+=news
endif
ifneq ($(CONFIG_PACKAGE_twisted-runner),)
  TWISTED_SUBPROJECTS+=runner
endif
ifneq ($(CONFIG_PACKAGE_twisted-web),)
  TWISTED_SUBPROJECTS+=web
endif


define Build/Configure
endef


define Build/Compile
	cd $(PKG_BUILD_DIR)/zope.interface-$(ZOPE_IF_VER); \
		$(STAGING_DIR)/usr/bin/hostpython ./setup.py \
		install --prefix=$(PKG_INSTALL_DIR)/usr --no-compile;

	cd $(PKG_BUILD_DIR)/; \
		TWISTED_SUBPROJECTS="$(TWISTED_SUBPROJECTS)" \
		PYTHONPATH="$(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages" \
		$(STAGING_DIR)/usr/bin/hostpython \
		./setup.py install --prefix=$(PKG_INSTALL_DIR)/usr --no-compile;
endef

define Package/zope-interface/install
	$(INSTALL_DIR) $(1)/usr/lib/python2.5/site-packages
	$(CP) -a $(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/zope \
		$(1)/usr/lib/python2.5/site-packages/
endef

TWISTED_DIR=/usr/lib/python2.5/site-packages/twisted
define Package/twisted/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(SED) 's@#!$(STAGING_DIR)/usr/bin/hostpython@#!/usr/bin/python@' $(PKG_INSTALL_DIR)/usr/bin/mktap
	$(SED) 's@#!$(STAGING_DIR)/usr/bin/hostpython@#!/usr/bin/python@' $(PKG_INSTALL_DIR)/usr/bin/twistd
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/mktap \
		$(PKG_INSTALL_DIR)/usr/bin/twistd \
		$(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib/python2.5/site-packages/twisted/plugins
	cd $(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/twisted; \
	$(CP) -a application copyright.py cred enterprise im.py __init__.py \
		internet manhole persisted plugin.py protocols \
		python scripts spread tap test trial _version.py \
		$(1)/usr/lib/python2.5/site-packages/twisted
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/dropin.cache \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/__init__.py \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/notestplugin.py \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/testplugin.py \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/twisted_ftp.py \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/twisted_inet.py \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/twisted_manhole.py \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/twisted_portforward.py \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/twisted_reactors.py \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/twisted_socks.py \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/twisted_telnet.py \
		$(PKG_INSTALL_DIR)/$(TWISTED_DIR)/plugins/twisted_trial.py \
		$(1)/$(TWISTED_DIR)/plugins/
endef	

define BuildSubmodule
  define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/usr/lib/python2.5/site-packages/twisted/plugins
	$(CP) -a \
		$(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/twisted/$(2) \
		$$(1)/usr/lib/python2.5/site-packages/twisted/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/twisted/plugins/twisted_$(2).py $$(1)/usr/lib/python2.5/site-packages/twisted/plugins/
  endef

  $$(eval $$(call BuildPackage,$(1)))
endef

define Package/twisted-runner/install
	$(INSTALL_DIR) $(1)/usr/lib/python2.5/site-packages/twisted
	$(CP) -a \
		$(PKG_INSTALL_DIR)/usr/lib/python2.5/site-packages/twisted/runner $(1)/usr/lib/python2.5/site-packages/twisted/
endef

$(eval $(call BuildPackage,zope-interface))
$(eval $(call BuildPackage,twisted))
$(eval $(call BuildSubmodule,twisted-words,words))
$(eval $(call BuildSubmodule,twisted-conch,conch))
$(eval $(call BuildSubmodule,twisted-lore,lore))
$(eval $(call BuildSubmodule,twisted-mail,mail))
$(eval $(call BuildSubmodule,twisted-names,names))
$(eval $(call BuildSubmodule,twisted-news,news))
$(eval $(call BuildPackage,twisted-runner))
$(eval $(call BuildSubmodule,twisted-web,web))
