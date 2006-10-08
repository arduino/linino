# $Id: Makefile 3198 2006-02-09 03:21:01Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME := qos-scripts
PKG_RELEASE := 1
PKG_VERSION := 0.9.2

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/package/rules.mk

$(eval $(call PKG_template,QOS_SCRIPTS,$(PKG_NAME),$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

$(PKG_BUILD_DIR)/.prepared:
	mkdir -p $(PKG_BUILD_DIR)
	touch $@

$(PKG_BUILD_DIR)/.built:
	touch $@

$(IPKG_QOS_SCRIPTS): 
	mkdir -p $(IDIR_QOS_SCRIPTS)
	$(CP) ./* $(IDIR_QOS_SCRIPTS)/
	$(IPKG_BUILD) $(IDIR_QOS_SCRIPTS) $(PACKAGE_DIR)

