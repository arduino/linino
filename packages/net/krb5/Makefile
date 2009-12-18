include $(TOPDIR)/rules.mk

PKG_NAME:=krb5
PKG_VERSION:=1.7
PKG_RELEASE:=1

PKG_SOURCE:=krb5-$(PKG_VERSION)-signed.tar
PKG_SOURCE_URL:=http://web.mit.edu/kerberos/dist/krb5/1.7/
PKG_MD5SUM:=9f7b3402b4731a7fa543db193bf1b564

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/krb5/Default
	SECTION:=net
	CATAGORY:=Network
	TITLE:=Kerberos
	URL:=http://web.mit.edu/kerberos/
endef

define Package/krb5-libs
	SECTION:=net
	CATAGORY:=Network
	TITLE:=Kerberos
	DEPENDS:=+libncurses
	TITLE:=Kerberos 5 Shared Libraries
	URL:=http://web.mit.edu/kerberos/
endef

define Package/krb5-server
	$(call Package/krb5/Default)
	DEPENDS:=+krb5-libs
	TITLE:=Kerberos 5 Server
endef

define Package/krb5-client
	$(call Package/krb5/Default)
	TITLE:=Kerberos 5 Client
endef

define Package/krb5-apps
	$(call Package/krb5/Default)
	TITLE:=Kerberized Network Applications
endef

define Package/krb5-daemons
	$(call Package/krb5/Default)
	TITLE:=Kerberized Network Daemons
endef

define Package/krb5/decription
	Kerberos
endef

define Build/Prepare
	# Krb5 tarball contains signature and a second tarball
	# containing source code.
	tar xf "$(DL_DIR)/$(PKG_SOURCE)" -C "$(BUILD_DIR)"
	tar xzf "$(BUILD_DIR)/krb5-$(PKG_VERSION).tar.gz" -C "$(BUILD_DIR)"
	patch -p1 -d "$(PKG_BUILD_DIR)" < "$(PATCH_DIR)/001-uclibc-symbol-collision-fix.patch"
endef

CONFIGURE_PATH = ./src

CONFIGURE_VARS += \
	cross_compiling=yes \
	krb5_cv_attr_constructor_destructor=yes,yes \
	ac_cv_func_regcomp=yes \
	ac_cv_printf_positional=yes \
	ac_cv_file__etc_environment=no \
	ac_cv_file__etc_TIMEZONE=no

CONFIGURE_ARGS += \
	--enable-thread-support \
	--without-krb4 \
	--without-tcl \
	--disable-ipv6

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	rm -rf "$(PKG_INSTALL_DIR)"
	mkdir -p "$(PKG_INSTALL_DIR)"
	$(MAKE) -C $(PKG_BUILD_DIR)/src \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		CC="$(TARGET_CC)" \
		all install
endef

define Package/krb5-libs/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/lib/krb5
	$(INSTALL_DIR) $(1)/usr/lib/krb5/plugins
	$(INSTALL_DIR) $(1)/usr/lib/krb5/plugins/kdb
	$(INSTALL_DIR) $(1)/usr/lib/krb5/plugins/libkrb5
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/krb5/plugins/kdb/db2.so $(1)/usr/lib/krb5/plugins/kdb
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so* $(1)/usr/lib
endef

define Package/krb5-client/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/kdestroy $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/kinit $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/klist $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/kpasswd $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ksu $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/kvno $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/krb5-send-pr $(1)/usr/sbin
endef

define Package/krb5-server/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/krb5kdc $(1)/etc/init.d/krb5kdc
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/sclient $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/kadmin.local $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/kadmind $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/kdb5_util $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/kdb5_util $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/kprop $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/kpropd $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/krb5kdc $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/sim_server $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/sserver $(1)/usr/sbin
endef

define Package/krb5-apps/install
	$(INSTALL_DIR) $(1)/usr/kerberos
	$(INSTALL_DIR) $(1)/usr/kerberos/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ftp $(1)/usr/kerberos/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/rcp $(1)/usr/kerberos/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/rlogin $(1)/usr/kerberos/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/rsh $(1)/usr/kerberos/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/telnet $(1)/usr/kerberos/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/uuclient $(1)/usr/kerberos/bin
endef

define Package/krb5-daemons/install
	$(INSTALL_DIR) $(1)/usr/kerberos/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/ftpd $(1)/usr/kerberos/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/klogind $(1)/usr/kerberos/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/login.krb5 $(1)/usr/kerberos/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/telnetd $(1)/usr/kerberos/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/uuserver $(1)/usr/kerberos/sbin
endef

$(eval $(call BuildPackage,krb5-libs))
$(eval $(call BuildPackage,krb5-server))
$(eval $(call BuildPackage,krb5-client))
$(eval $(call BuildPackage,krb5-apps))
$(eval $(call BuildPackage,krb5-daemons))
