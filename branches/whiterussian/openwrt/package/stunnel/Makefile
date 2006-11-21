# $Id: Makefile 4782 2006-09-12 12:32:27Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=stunnel
PKG_VERSION:=4.16
PKG_RELEASE:=1
PKG_MD5SUM:=8ea5cae3eeaacc0271b766506b4b9d4a
PKG_SOURCE_URL:=http://www.stunnel.org/download/stunnel/src/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(TOPDIR)/package/rules.mk

$(eval $(call PKG_template,STUNNEL,stunnel,$(PKG_VERSION)-$(PKG_RELEASE),$(ARCH)))

$(PKG_BUILD_DIR)/.configured: $(PKG_BUILD_DIR)/.prepared
	(cd $(PKG_BUILD_DIR); rm -rf config.{cache,status} ; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		./configure \
		  --target=$(GNU_TARGET_NAME) \
		  --host=$(GNU_TARGET_NAME) \
		  --build=$(GNU_HOST_NAME) \
		  --program-prefix="" \
		  --program-suffix="" \
		  --prefix=/usr \
		  --exec-prefix=/usr \
		  --bindir=/usr/bin \
		  --datadir=/usr/share \
		  --includedir=/usr/include \
		  --infodir=/usr/share/info \
		  --libdir=/usr/lib \
		  --libexecdir=/usr/lib \
		  --localstatedir=/var \
		  --mandir=/usr/share/man \
		  --sbindir=/usr/sbin \
		  --sysconfdir=/etc \
		  --with-random=/dev/urandom \
		  --with-threads=fork \
	);
	touch $@

$(PKG_BUILD_DIR)/.built:
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)/etc/stunnel
	echo '#dummy' > $(PKG_INSTALL_DIR)/etc/stunnel/stunnel.pem
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	touch $@

$(IPKG_STUNNEL):
	install -d -m0755 $(IDIR_STUNNEL)/usr/sbin $(IDIR_STUNNEL)/usr/lib $(IDIR_STUNNEL)/usr/stunnel
	install -d -m0755 $(IDIR_STUNNEL)/etc/stunnel $(IDIR_STUNNEL)/etc/init.d
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/stunnel $(IDIR_STUNNEL)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libstunnel.so $(IDIR_STUNNEL)/usr/sbin/
	$(CP) ./files/stunnel.conf $(IDIR_STUNNEL)/etc/stunnel/stunnel.conf
	$(CP) ./files/stunnel.init $(IDIR_STUNNEL)/etc/init.d/S90stunnel

	$(RSTRIP) $(IDIR_STUNNEL)
	$(IPKG_BUILD) $(IDIR_STUNNEL) $(PACKAGE_DIR)
