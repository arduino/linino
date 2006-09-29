# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=openssh
PKG_VERSION:=4.4p1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/ \
		ftp://openbsd.wiretapped.net/pub/OpenBSD/OpenSSH/portable/ \
	 	ftp://ftp.belnet.be/packages/openbsd/OpenSSH/portable/ \
	   	ftp://ftp.de.openbsd.org/pub/unix/OpenBSD/OpenSSH/portable/
PKG_MD5SUM:=793a709a8de695c22f523024d7e9bf07
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install
PKG_BUILDDEP:=libopenssl

include $(INCLUDE_DIR)/package.mk

define Package/openssh-client
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +zlib
  TITLE:=OpenSSH client
  DESCRIPTION:=OpenSSH client.
  URL:=http://www.openssh.com/
endef

define Package/openssh-client/conffiles
/etc/ssh/ssh_config
endef

define Package/openssh-client-utils
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=openssh-client
  TITLE:=OpenSSH client utilities
  DESCRIPTION:=OpenSSH client utilities.
  URL:=http://www.openssh.com/
endef

define Package/openssh-server
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +zlib
  TITLE:=OpenSSH server
  DESCRIPTION:=OpenSSH server.
  URL:=http://www.openssh.com/
endef

define Package/openssh-server/conffiles
/etc/ssh/sshd_config
endef

define Package/openssh-sftp-client
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +zlib
  TITLE:=OpenSSH SFTP client
  DESCRIPTION:=OpenSSH SFTP client.
  URL:=http://www.openssh.com/
endef

define Package/openssh-sftp-server
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +zlib
  TITLE:=OpenSSH SFTP server
  DESCRIPTION:=OpenSSH SFTP server.
  URL:=http://www.openssh.com/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -f config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
		LD="$(TARGET_CC)" \
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
			--sysconfdir=/etc/ssh \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-shared \
			--disable-static \
			--disable-debug \
			--disable-strip \
			--disable-etc-default-login \
			--disable-lastlog \
			--disable-utmp \
			--disable-utmpx \
			--disable-wtmp \
			--disable-wtmpx \
			--without-bsd-auth \
			--without-kerberos5 \
			--without-pam \
			--without-x \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/openssh-client/install
	install -m0755 -d $(1)/etc/ssh
	chmod 0700 $(1)/etc/ssh
	$(CP) $(PKG_INSTALL_DIR)/etc/ssh/ssh_config $(1)/etc/ssh/
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ssh $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/scp $(1)/usr/bin/
endef

define Package/openssh-client-utils/install
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ssh-add $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ssh-agent $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ssh-keyscan $(1)/usr/bin/
endef

define Package/openssh-server/install
	install -m0755 -d $(1)/etc/ssh
	chmod 0700 $(1)/etc/ssh
	$(CP) $(PKG_INSTALL_DIR)/etc/ssh/sshd_config $(1)/etc/ssh/
	install -m0755 -d $(1)/etc/init.d
	install -m0755 ./files/S50sshd $(1)/etc/init.d/
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ssh-keygen $(1)/usr/bin/
	install -m0755 -d $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/sshd $(1)/usr/sbin/
endef

define Package/openssh-sftp-client/install
	install -m0755 -d $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sftp $(1)/usr/bin/
endef

define Package/openssh-sftp-server/install
	install -m0755 -d $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/sftp-server $(1)/usr/lib/
	install -m0755 -d $(1)/usr/libexec
	ln -sf ../lib/sftp-server $(1)/usr/libexec/sftp-server
endef

$(eval $(call BuildPackage,openssh-client))
$(eval $(call BuildPackage,openssh-client-utils))
$(eval $(call BuildPackage,openssh-server))
$(eval $(call BuildPackage,openssh-sftp-client))
$(eval $(call BuildPackage,openssh-sftp-server))
