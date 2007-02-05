# $Id: $

include $(TOPDIR)/rules.mk

PKG_NAME:=dsl_qos_queue
PKG_VERSION:=0.9.3
PKG_RELEASE:=1
PKG_MD5SUM:=ccbe8d28c3508c67f669fe98532533be

PKG_SOURCE_URL:=http://www.sonicspike.net/software/download/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/package/rules.mk

$(eval $(call PKG_template,DSL_QOS_QUEUE,dsl-qos-queue,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

$(PKG_BUILD_DIR)/.configured:
	touch $@

$(PKG_BUILD_DIR)/.built:
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		install_prefix="$(PKG_INSTALL_DIR)" \
		all
	touch $@

$(IPKG_DSL_QOS_QUEUE):
	install -d -m0755 $(IDIR_DSL_QOS_QUEUE)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/$(PKG_NAME) $(IDIR_DSL_QOS_QUEUE)/usr/sbin/
	install -m0755 $(PKG_BUILD_DIR)/dsl_qos_train $(IDIR_DSL_QOS_QUEUE)/usr/sbin
	install -m0755 $(PKG_BUILD_DIR)/ipt_rules $(IDIR_DSL_QOS_QUEUE)/usr/sbin
	$(RSTRIP) $(IDIR_DSL_QOS_QUEUE)
	$(IPKG_BUILD) $(IDIR_DSL_QOS_QUEUE) $(PACKAGE_DIR)

mostlyclean:
	make -C $(PKG_BUILD_DIR) clean
	rm $(PKG_BUILD_DIR)/.built
