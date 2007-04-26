include $(TOPDIR)/rules.mk

PKG_NAME:=egenix-mx
PKG_VERSION:=2.0.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-base-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.egenix.com/files/python/
PKG_MD5SUM:=66841151728a06f92d0b8dd2ed317a29
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-base-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/egenix-mx
 SECTION:=libs
 CATEGORY:=Libraries
 DEPENDS:=+python
 TITLE:=Egenix-mx
 MAINTAINER:=jjones@pavlovmedia.com
 DESCRIPTION:=\
  required library for psycopg (a PostgreSQL database adapter for the Python programming language).
 URL=http://www.initd.org/
endef

define Build/Compile
	cd $(PKG_BUILD_DIR); \
	CFLAGS='$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include' \
	LDFLAGS='$(TARGET_LDFLAGS)' \
	$(STAGING_DIR)/usr/bin/hostpython ./setup.py build \
	--build-lib=foo
endef

MX_SOURCE=$(PKG_BUILD_DIR)/mx
MX_INSTALL_DIR=/usr/lib/python2.5/site-packages/mx
define Package/egenix-mx/install
	# distutils insists on compiling, so we need to do an install by hand
	$(INSTALL_DIR) $(1)/usr/lib/python2.5/site-packages
	$(CP) -R $(PKG_BUILD_DIR)/foo/mx $(1)/usr/lib/python2.5/site-packages
	$(CP) $(1)$(MX_INSTALL_DIR)/BeeBase/ExitFunctions.py \
		$(1)$(MX_INSTALL_DIR)/Misc/ExitFunctions.py

	$(CP) \
		$(MX_SOURCE)/BeeBase/mxBeeBase/btr.h \
		$(MX_SOURCE)/BeeBase/mxBeeBase/mxBeeBase.h \
		$(MX_SOURCE)/BeeBase/mxBeeBase/mxh.h \
		$(1)$(MX_INSTALL_DIR)/BeeBase/mxBeeBase/
	$(CP) \
		$(MX_SOURCE)/DateTime/mxDateTime/mxDateTime.h \
		$(MX_SOURCE)/DateTime/mxDateTime/mxh.h \
		$(1)$(MX_INSTALL_DIR)/DateTime/mxDateTime/
	$(CP) \
		$(MX_SOURCE)/Proxy/mxProxy/mxh.h \
		$(MX_SOURCE)/Proxy/mxProxy/mxProxy.h \
		$(1)$(MX_INSTALL_DIR)/Proxy/mxProxy/
	$(CP) \
		$(MX_SOURCE)/Queue/mxQueue/mxh.h \
		$(MX_SOURCE)/Queue/mxQueue/mxQueue.h \
		$(1)$(MX_INSTALL_DIR)/Queue/mxQueue/
	$(CP) \
		$(MX_SOURCE)/TextTools/mxTextTools/mxbmse.h \
		$(MX_SOURCE)/TextTools/mxTextTools/mxh.h \
		$(MX_SOURCE)/TextTools/mxTextTools/mxte.h \
		$(MX_SOURCE)/TextTools/mxTextTools/mxTextTools.h \
		$(1)$(MX_INSTALL_DIR)/TextTools/mxTextTools/
	$(CP) \
		$(MX_SOURCE)/Tools/mxTools/mxh.h \
		$(MX_SOURCE)/Tools/mxTools/mxTools.h \
		$(1)$(MX_INSTALL_DIR)/Tools/mxTools/

	chmod -R a+r $(1)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR)$(MX_INSTALL_DIR)/BeeBase/mxBeeBase
	$(INSTALL_DIR) $(STAGING_DIR)$(MX_INSTALL_DIR)/DateTime/mxDateTime
	$(INSTALL_DIR) $(STAGING_DIR)$(MX_INSTALL_DIR)/Proxy/mxProxy
	$(INSTALL_DIR) $(STAGING_DIR)$(MX_INSTALL_DIR)/Queue/mxQueue
	$(INSTALL_DIR) $(STAGING_DIR)$(MX_INSTALL_DIR)/TextTools/mxTextTools
	$(INSTALL_DIR) $(STAGING_DIR)$(MX_INSTALL_DIR)/Tools/mxTools

	$(CP) \
		$(MX_SOURCE)/BeeBase/mxBeeBase/btr.h \
		$(MX_SOURCE)/BeeBase/mxBeeBase/mxBeeBase.h \
		$(MX_SOURCE)/BeeBase/mxBeeBase/mxh.h \
		$(STAGING_DIR)$(MX_INSTALL_DIR)/BeeBase/mxBeeBase/
	$(CP) \
		$(MX_SOURCE)/DateTime/mxDateTime/mxDateTime.h \
		$(MX_SOURCE)/DateTime/mxDateTime/mxh.h \
		$(STAGING_DIR)$(MX_INSTALL_DIR)/DateTime/mxDateTime/
	$(CP) \
		$(MX_SOURCE)/Proxy/mxProxy/mxh.h \
		$(MX_SOURCE)/Proxy/mxProxy/mxProxy.h \
		$(STAGING_DIR)$(MX_INSTALL_DIR)/Proxy/mxProxy/
	$(CP) \
		$(MX_SOURCE)/Queue/mxQueue/mxh.h \
		$(MX_SOURCE)/Queue/mxQueue/mxQueue.h \
		$(STAGING_DIR)$(MX_INSTALL_DIR)/Queue/mxQueue/
	$(CP) \
		$(MX_SOURCE)/TextTools/mxTextTools/mxbmse.h \
		$(MX_SOURCE)/TextTools/mxTextTools/mxh.h \
		$(MX_SOURCE)/TextTools/mxTextTools/mxte.h \
		$(MX_SOURCE)/TextTools/mxTextTools/mxTextTools.h \
		$(STAGING_DIR)$(MX_INSTALL_DIR)/TextTools/mxTextTools/
	$(CP) \
		$(MX_SOURCE)/Tools/mxTools/mxh.h \
		$(MX_SOURCE)/Tools/mxTools/mxTools.h \
		$(STAGING_DIR)$(MX_INSTALL_DIR)/Tools/mxTools/
endef

$(eval $(call BuildPackage,egenix-mx))
