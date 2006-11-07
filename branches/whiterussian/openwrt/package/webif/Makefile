# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=webif
PKG_VERSION:=0.2
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

# for whiterussian only:
NVRAM_OPTS=-DNVRAM -lnvram -I$(STAGING_DIR)/usr/include -L$(STAGING_DIR)/usr/lib

include $(TOPDIR)/package/rules.mk

define PKG_mod_template

$$(IPKG_$(1)):
	[ -z "$(2)" ] || install -d -m0755 $$(IDIR_$(1))/usr/lib/webif/lang/$(2)
	$(CP) ./files/usr/lib/webif/lang/$(2)/common.txt $$(IDIR_$(1))/usr/lib/webif/lang/$(2)/
	$(RSTRIP) $$(IDIR_$(1))
	$(IPKG_BUILD) $$(IDIR_$(1)) $(PACKAGE_DIR)

endef

$(eval $(call PKG_template,WEBIF,webif,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_CA,webif-lang-ca,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_CZ,webif-lang-cz,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_DE,webif-lang-de,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_DK,webif-lang-dk,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_EE,webif-lang-ee,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_ES,webif-lang-es,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_FR,webif-lang-fr,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_HR,webif-lang-hr,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_HU,webif-lang-hu,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_IT,webif-lang-it,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_NL,webif-lang-nl,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_NO,webif-lang-no,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_PL,webif-lang-pl,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_PT,webif-lang-pt,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_RU,webif-lang-ru,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))
$(eval $(call PKG_template,WEBIF_LANG_SE,webif-lang-se,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

$(eval $(call PKG_mod_template,WEBIF_LANG_CA,ca))
$(eval $(call PKG_mod_template,WEBIF_LANG_CZ,cz))
$(eval $(call PKG_mod_template,WEBIF_LANG_DE,de))
$(eval $(call PKG_mod_template,WEBIF_LANG_DK,dk))
$(eval $(call PKG_mod_template,WEBIF_LANG_EE,ee))
$(eval $(call PKG_mod_template,WEBIF_LANG_ES,es))
$(eval $(call PKG_mod_template,WEBIF_LANG_FR,fr))
$(eval $(call PKG_mod_template,WEBIF_LANG_HR,hr))
$(eval $(call PKG_mod_template,WEBIF_LANG_HU,hu))
$(eval $(call PKG_mod_template,WEBIF_LANG_IT,it))
$(eval $(call PKG_mod_template,WEBIF_LANG_NL,nl))
$(eval $(call PKG_mod_template,WEBIF_LANG_NO,no))
$(eval $(call PKG_mod_template,WEBIF_LANG_PL,pl))
$(eval $(call PKG_mod_template,WEBIF_LANG_PT,pt))
$(eval $(call PKG_mod_template,WEBIF_LANG_RU,ru))
$(eval $(call PKG_mod_template,WEBIF_LANG_SE,se))

$(PKG_BUILD_DIR)/.prepared:
	mkdir -p $(PKG_BUILD_DIR)
	touch $@
	
$(PKG_BUILD_DIR)/.configured:
	touch $@

$(PKG_BUILD_DIR)/.built:
	$(TARGET_CC) $(TARGET_CFLAGS) $(NVRAM_OPTS) -o $(PKG_BUILD_DIR)/webif-page src/webif-page.c
	$(TARGET_CC) $(TARGET_CFLAGS) -o $(PKG_BUILD_DIR)/bstrip src/bstrip.c
	$(STRIP) $(PKG_BUILD_DIR)/webif-page $(PKG_BUILD_DIR)/bstrip
	touch $@

$(IPKG_WEBIF): 
	$(CP) ./files/* $(IDIR_WEBIF)/
	rm -rf $(IDIR_WEBIF)/usr/lib/webif/lang/
	install -d $(IDIR_WEBIF)/usr/bin
	install -m0755 $(PKG_BUILD_DIR)/webif-page $(IDIR_WEBIF)/usr/bin/webif-page
	install -m0755 $(PKG_BUILD_DIR)/bstrip $(IDIR_WEBIF)/usr/bin/bstrip
	ln -sf /www/index.html $(IDIR_WEBIF)/www/index.asp
	find $(IDIR_WEBIF) -name CVS | xargs rm -rf
	find $(IDIR_WEBIF) -name .svn | xargs rm -rf
	$(IPKG_BUILD) $(IDIR_WEBIF) $(PACKAGE_DIR)
