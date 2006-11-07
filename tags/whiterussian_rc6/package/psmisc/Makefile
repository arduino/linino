include $(TOPDIR)/rules.mk

PKG_NAME:=psmisc
PKG_VERSION:=22.2
PKG_RELEASE:=1
PKG_MD5SUM:=77737c817a40ef2c160a7194b5b64337

PKG_SOURCE_URL:=@SF/psmisc
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(TOPDIR)/package/rules.mk

$(eval $(call PKG_template,PSMISC,$(PKG_NAME),$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

$(PKG_BUILD_DIR)/.configured: $(PKG_BUILD_DIR)/.prepared
	(cd $(PKG_BUILD_DIR); \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--prefix=$(PKG_INSTALL_DIR) \
			--without-libiconv-prefix \
			--without-libintl-prefix \
			--disable-nls \
			--disable-ipv6 \
			--disable-largefile\
	);

	touch $@
APPS:=
DEPEND:=

ifneq ($(BR2_PACKAGE_PSMISC_FUSER),)
APPS += /sbin/fuser
endif
ifneq ($(BR2_PACKAGE_PSMISC_KILLALL),)
APPS += /usr/bin/killall /bin/pidof
endif
ifneq ($(BR2_PACKAGE_PSMISC_PSTREE),)
APPS += /usr/bin/pstree
DEPEND:=libncurses
endif

$(PKG_BUILD_DIR)/.built:
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)/usr/bin
	mkdir -p $(PKG_INSTALL_DIR)/sbin
	mkdir -p $(PKG_INSTALL_DIR)/bin
	#Note here that we pass cross-compiler as default compiler to use
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LD="$(TARGET_CC)" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		$(TARGET_CONFIGURE_OPTS) \
		prefix="$(PKG_INSTALL_DIR)"
	[ -n "$(BR2_PACKAGE_PSMISC_KILLALL)" ] && $(CP) $(PKG_BUILD_DIR)/src/killall $(PKG_INSTALL_DIR)/usr/bin/
	[ -n "$(BR2_PACKAGE_PSMISC_FUSER)" ] && $(CP) $(PKG_BUILD_DIR)/src/fuser $(PKG_INSTALL_DIR)/sbin/
	[ -n "$(BR2_PACKAGE_PSMISC_PSTREE)" ] && $(CP) $(PKG_BUILD_DIR)/src/pstree $(PKG_INSTALL_DIR)/usr/bin/
	touch $@

$(IPKG_PSMISC):
	cp -fpR $(PKG_INSTALL_DIR)/* $(IDIR_PSMISC)/	
	grep -v -e ^BUILT -e /bin/sh $(IDIR_PSMISC)/CONTROL/preinst > $(IDIR_PSMISC)/CONTROL/preinst.tmp
	rm $(IDIR_PSMISC)/CONTROL/preinst
	echo -e "#!/bin/sh\nBUILT='$(APPS)'\n" > $(IDIR_PSMISC)/CONTROL/preinst
	cat $(IDIR_PSMISC)/CONTROL/preinst.tmp >> $(IDIR_PSMISC)/CONTROL/preinst
	rm $(IDIR_PSMISC)/CONTROL/preinst.tmp
	echo "Depends: $(DEPEND)" >> $(IDIR_PSMISC)/CONTROL/control
	echo "Description: Extra /proc utils: $(notdir $(APPS))" >>  $(IDIR_PSMISC)/CONTROL/control
	$(RSTRIP) $(IDIR_PSMISC)
	$(IPKG_BUILD) $(IDIR_PSMISC) $(PACKAGE_DIR)

mostlyclean:
	make -C $(PKG_BUILD_DIR) clean
	rm $(PKG_BUILD_DIR)/.built
