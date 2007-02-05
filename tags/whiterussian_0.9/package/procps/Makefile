include $(TOPDIR)/rules.mk

PKG_NAME:=procps
PKG_VERSION:=3.2.7
PKG_RELEASE:=1
PKG_MD5SUM:=f490bca772b16472962c7b9f23b1e97d

PKG_SOURCE_URL:=http://procps.sourceforge.net/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(TOPDIR)/package/rules.mk

$(eval $(call PKG_template,PROCPS,$(PKG_NAME),$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

$(PKG_BUILD_DIR)/.configured: $(PKG_BUILD_DIR)/.prepared
	touch $@

APPS:=
DEPEND:=

ifneq ($(BR2_PACKAGE_PROCPS_PS),)
APPS += /bin/ps
endif
ifneq ($(BR2_PACKAGE_PROCPS_VMSTAT),)
APPS += /usr/bin/vmstat
endif
ifneq ($(BR2_PACKAGE_PROCPS_TOP),)
APPS += /usr/bin/top
DEPEND:=libncurses
endif
ifneq ($(BR2_PACKAGE_PROCPS_SLABTOP),)
APPS += /usr/bin/slabtop
DEPEND:=libncurses
endif
ifneq ($(BR2_PACKAGE_PROCPS_PMAP),)
APPS += /usr/bin/pmap
endif
ifneq ($(BR2_PACKAGE_PROCPS_PWDX),)
APPS += /usr/bin/pwdx
endif
ifneq ($(BR2_PACKAGE_PROCPS_W),)
APPS += /usr/bin/w
endif
ifneq ($(BR2_PACKAGE_PROCPS_KILL),)
APPS += /bin/kill
endif
ifneq ($(BR2_PACKAGE_PROCPS_SKILL),)
APPS += /usr/bin/skill
endif
ifneq ($(BR2_PACKAGE_PROCPS_PKILL),)
APPS += /usr/bin/pkill
endif
ifneq ($(BR2_PACKAGE_PROCPS_FREE),)
APPS += /usr/bin/free
endif
ifneq ($(BR2_PACKAGE_PROCPS_SNICE),)
APPS += /usr/bin/snice
endif
ifneq ($(BR2_PACKAGE_PROCPS_SYSCTL),)
APPS += /sbin/sysctl
endif
ifneq ($(BR2_PACKAGE_PROCPS_TLOAD),)
APPS += /usr/bin/tload
endif
ifneq ($(BR2_PACKAGE_PROCPS_WATCH),)
APPS += /usr/bin/watch
endif
ifneq ($(BR2_PACKAGE_PROCPS_PGREP),)
APPS += /usr/bin/pgrep
endif

$(PKG_BUILD_DIR)/.built:
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)/usr/bin
	mkdir -p $(PKG_INSTALL_DIR)/bin
	mkdir -p $(PKG_INSTALL_DIR)/lib
	mkdir -p $(PKG_INSTALL_DIR)/sbin
	#Note here that we pass cross-compiler as default compiler to use
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC=$(TARGET_CC) \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LD="$(TARGET_CC)" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		$(TARGET_CONFIGURE_OPTS) \
		prefix="$(PKG_INSTALL_DIR)/" \
		ps/ps $(notdir $(APPS))
	if [ -n "$(BR2_PACKAGE_PROCPS_PS)" ]; then cp -fpR $(PKG_BUILD_DIR)/ps/ps $(PKG_INSTALL_DIR)/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_VMSTAT)" ]; then cp -fpR $(PKG_BUILD_DIR)/vmstat $(PKG_INSTALL_DIR)/usr/bin; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_TOP)" ]; then cp -fpR $(PKG_BUILD_DIR)/top $(PKG_INSTALL_DIR)/usr/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_SLABTOP)" ]; then cp -fpR $(PKG_BUILD_DIR)/slabtop $(PKG_INSTALL_DIR)/usr/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_PMAP)" ]; then cp -fpR $(PKG_BUILD_DIR)/pmap $(PKG_INSTALL_DIR)/usr/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_PWDX)" ]; then cp -fpR $(PKG_BUILD_DIR)/pwdx $(PKG_INSTALL_DIR)/usr/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_W)" ]; then cp -fpR $(PKG_BUILD_DIR)/w $(PKG_INSTALL_DIR)/usr/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_KILL)" ]; then cp -fpR $(PKG_BUILD_DIR)/kill $(PKG_INSTALL_DIR)/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_SKILL)" ]; then cp -fpR $(PKG_BUILD_DIR)/skill $(PKG_INSTALL_DIR)/usr/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_FREE)" ]; then cp -fpR $(PKG_BUILD_DIR)/free $(PKG_INSTALL_DIR)/usr/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_SYSCTL)" ]; then cp -fpR $(PKG_BUILD_DIR)/sysctl $(PKG_INSTALL_DIR)/sbin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_TLOAD)" ]; then cp -fpR $(PKG_BUILD_DIR)/tload $(PKG_INSTALL_DIR)/usr/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_WATCH)" ]; then cp -fpR $(PKG_BUILD_DIR)/watch $(PKG_INSTALL_DIR)/usr/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_PGREP)" ]; then cp -fpR $(PKG_BUILD_DIR)/pgrep $(PKG_INSTALL_DIR)/usr/bin/; fi
	cp -fpR $(PKG_BUILD_DIR)/proc/libproc-$(PKG_VERSION).so $(PKG_INSTALL_DIR)/lib/
	touch $@

$(IPKG_PROCPS):
	install -d -m0755 $(IDIR_PROCPS)/usr/bin
	install -d -m0755 $(IDIR_PROCPS)/bin
	install -d -m0755 $(IDIR_PROCPS)/sbin
	install -d -m0755 $(IDIR_PROCPS)/lib
	cp -fpR $(PKG_INSTALL_DIR)/* $(IDIR_PROCPS)/
	grep -v -e ^BUILT -e /bin/sh $(IDIR_PROCPS)/CONTROL/preinst > $(IDIR_PROCPS)/CONTROL/preinst.tmp
	rm $(IDIR_PROCPS)/CONTROL/preinst
	echo -e "#!/bin/sh\nBUILT='$(APPS)'\n" > $(IDIR_PROCPS)/CONTROL/preinst
	cat $(IDIR_PROCPS)/CONTROL/preinst.tmp >> $(IDIR_PROCPS)/CONTROL/preinst
	rm $(IDIR_PROCPS)/CONTROL/preinst.tmp
	echo "Depends: $(DEPEND)" >> $(IDIR_PROCPS)/CONTROL/control
	echo "Description: /proc utilities: $(notdir $(APPS))" >>  $(IDIR_PROCPS)/CONTROL/control
	$(RSTRIP) $(IDIR_PROCPS)
	$(IPKG_BUILD) $(IDIR_PROCPS) $(PACKAGE_DIR)

mostlyclean:
	make -C $(PKG_BUILD_DIR) clean
	rm $(PKG_BUILD_DIR)/.built
