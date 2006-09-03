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

ifneq ($(BR2_PACKAGE_PROCPS_PS),)
APPS += /bin/ps
endif
ifneq ($(BR2_PACKAGE_PROCPS_VMSTAT),)
APPS += /usr/bin/vmstat
endif
ifneq ($(BR2_PACKAGE_PROCPS_TOP),)
APPS += /usr/bin/top
endif
ifneq ($(BR2_PACKAGE_PROCPS_SLABTOP),)
APPS += /usr/bin/slabtop
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

	if [ -n "$(BR2_PACKAGE_PROCPS_PS)" ];then $(CP) $(PKG_BUILD_DIR)/ps/ps $(PKG_INSTALL_DIR)/bin/; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_VMSTAT)" ];then $(CP) $(PKG_BUILD_DIR)/vmstat $(PKG_INSTALL_DIR)/usr/bin; fi
	if [ -n "$(BR2_PACKAGE_PROCPS_TOP)" ];then $(CP) $(PKG_BUILD_DIR)/top $(PKG_INSTALL_DIR)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_SLABTOP)" ];then $(CP) $(PKG_BUILD_DIR)/slabtop $(PKG_INSTALL_DIR)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_PMAP)" ];then $(CP) $(PKG_BUILD_DIR)/pmap $(PKG_INSTALL_DIR)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_PWDX)" ];then $(CP) $(PKG_BUILD_DIR)/pwdx $(PKG_INSTALL_DIR)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_W)" ];then $(CP) $(PKG_BUILD_DIR)/w $(PKG_INSTALL_DIR)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_KILL)" ];then $(CP) $(PKG_BUILD_DIR)/kill $(PKG_INSTALL_DIR)/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_SKILL)" ];then $(CP) $(PKG_BUILD_DIR)/skill $(PKG_INSTALL_DIR)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_FREE)" ];then $(CP) $(PKG_BUILD_DIR)/free $(PKG_INSTALL_DIR)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_SYSCTL)" ];then $(CP) $(PKG_BUILD_DIR)/sysctl $(PKG_INSTALL_DIR)/sbin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_TLOAD)" ];then $(CP) $(PKG_BUILD_DIR)/tload $(PKG_INSTALL_DIR)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_WATCH)" ];then $(CP) $(PKG_BUILD_DIR)/watch $(PKG_INSTALL_DIR)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_PGREP)" ];then $(CP) $(PKG_BUILD_DIR)/pgrep $(PKG_INSTALL_DIR)/usr/bin;fi

	$(CP) $(PKG_BUILD_DIR)/proc/libproc-$(PKG_VERSION).so $(PKG_INSTALL_DIR)/lib

	touch $@

$(IPKG_PROCPS):
	install -d -m0755 $(IDIR_PROCPS)/usr/bin
	install -d -m0755 $(IDIR_PROCPS)/bin
	install -d -m0755 $(IDIR_PROCPS)/sbin
	install -d -m0755 $(IDIR_PROCPS)/lib
	
	if [ -n "$(BR2_PACKAGE_PROCPS_PS)" ];then $(CP) $(PKG_INSTALL_DIR)/bin/ps $(IDIR_PROCPS)/bin/;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_VMSTAT)" ];then $(CP) $(PKG_INSTALL_DIR)/usr/bin/vmstat $(IDIR_PROCPS)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_TOP)" ];then $(CP) $(PKG_INSTALL_DIR)/usr/bin/top $(IDIR_PROCPS)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_SLABTOP)" ];then $(CP) $(PKG_INSTALL_DIR)/usr/bin/slabtop $(IDIR_PROCPS)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_PMAP)" ];then $(CP) $(PKG_INSTALL_DIR)/usr/bin/pmap $(IDIR_PROCPS)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_PWDX)" ];then $(CP) $(PKG_INSTALL_DIR)/usr/bin/pwdx $(IDIR_PROCPS)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_W)" ];then $(CP) $(PKG_INSTALL_DIR)/usr/bin/w $(IDIR_PROCPS)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_KILL)" ];then $(CP) $(PKG_INSTALL_DIR)/bin/kill $(IDIR_PROCPS)/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_SKILL)" ];then $(CP) $(PKG_INSTALL_DIR)/usr/bin/skill $(IDIR_PROCPS)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_FREE)" ];then $(CP) $(PKG_INSTALL_DIR)/usr/bin/free $(IDIR_PROCPS)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_SYSCTL)" ];then $(CP) $(PKG_INSTALL_DIR)/sbin/sysctl $(IDIR_PROCPS)/sbin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_TLOAD)" ];then $(CP) $(PKG_INSTALL_DIR)/usr/bin/tload $(IDIR_PROCPS)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_WATCH)" ];then $(CP) $(PKG_INSTALL_DIR)/usr/bin/watch $(IDIR_PROCPS)/usr/bin;fi
	if [ -n "$(BR2_PACKAGE_PROCPS_PGREP)" ];then $(CP) $(PKG_INSTALL_DIR)/usr/bin/pgrep $(IDIR_PROCPS)/usr/bin;fi
	
	$(CP) $(PKG_INSTALL_DIR)/lib/libproc-$(PKG_VERSION).so $(IDIR_PROCPS)/lib
	$(RSTRIP) $(IDIR_PROCPS)
	
	# Insert BUILT variable into preinst script
	grep -v -e ^BUILT -e /bin/sh $(PKG_INSTALL_DIR)/../ipkg/$(PKG_NAME)/CONTROL/preinst > $(PKG_INSTALL_DIR)/../ipkg/$(PKG_NAME)/CONTROL/preinst.tmp
	rm $(PKG_INSTALL_DIR)/../ipkg/$(PKG_NAME)/CONTROL/preinst
	echo -e "#!/bin/sh\nBUILT='$(APPS)'\n" > $(PKG_INSTALL_DIR)/../ipkg/$(PKG_NAME)/CONTROL/preinst
	cat $(PKG_INSTALL_DIR)/../ipkg/$(PKG_NAME)/CONTROL/preinst.tmp >> $(PKG_INSTALL_DIR)/../ipkg/$(PKG_NAME)/CONTROL/preinst
	rm $(PKG_INSTALL_DIR)/../ipkg/$(PKG_NAME)/CONTROL/preinst.tmp

	# Insert ncurses dependancy if top or slabtop was selected
	if [ -n "$(BR2_PACKAGE_PROCPS_TOP)" ] || \
		[ -n "$(BR2_PACKAGE_PROCPS_SLABTOP)" ]; then\
	echo "Depends: libncurses" >> $(PKG_INSTALL_DIR)/../ipkg/$(PKG_NAME)/CONTROL/control; fi

	# Insert built apps to ipkg description
	echo "Description: /proc utilities: $(notdir $(APPS))" >>  $(PKG_INSTALL_DIR)/../ipkg/$(PKG_NAME)/CONTROL/control

	$(IPKG_BUILD) $(IDIR_PROCPS) $(PACKAGE_DIR)

mostlyclean:
	make -C $(PKG_BUILD_DIR) clean
	rm $(PKG_BUILD_DIR)/.built
