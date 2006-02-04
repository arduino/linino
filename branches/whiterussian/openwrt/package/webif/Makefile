# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=webif
PKG_VERSION:=0.2
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(TOPDIR)/package/rules.mk

$(eval $(call PKG_template,WEBIF,webif,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

$(PKG_BUILD_DIR)/.prepared:
	mkdir -p $(PKG_BUILD_DIR)
	touch $@
	
$(PKG_BUILD_DIR)/.configured:
	touch $@

$(PKG_BUILD_DIR)/.built:
	touch $@

$(IPKG_WEBIF): 
	cp -a ./files/* $(IDIR_WEBIF)/
	find $(IDIR_WEBIF) -name CVS | xargs rm -rf
	find $(IDIR_WEBIF) -name .svn | xargs rm -rf
	$(IPKG_BUILD) $(IDIR_WEBIF) $(PACKAGE_DIR)
