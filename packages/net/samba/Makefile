#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=samba
PKG_VERSION:=2.0.10
PKG_RELEASE:=7

PKG_SOURCE_URL:=ftp://ftp.samba.org/pub/samba/old-versions
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MD5SUM:=54870482fe036b7e69dd48c90661eec6

include $(INCLUDE_DIR)/package.mk

define Package/samba
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Filesystem
  TITLE:=samba - NetBIOS/SMB implementation
  URL:=http://www.samba.org/
endef  

define Package/samba/description
The Samba software suite is a collection of programs that implements the
	SMB protocol for unix systems, allowing you to serve files and printers to
	Windows, NT, OS/2 and DOS clients. This protocol is sometimes also referred
	to as the LanManager or Netbios protocol.
endef

define Package/samba2-common
  $(call Package/samba)
  MENU:=1
  TITLE:=NetBIOS/SMB server and client shared files
  DEPENDS:=+libgcc
endef

define Package/samba2-server
  $(call Package/samba)
  TITLE:=NetBIOS/SMB file and print server
  DEPENDS:=samba2-common
endef

define Package/samba2-client
  $(call Package/samba)
  TITLE:=NetBIOS/SMB simple client
  DEPENDS:=samba2-common
endef

TARGET_CFLAGS += $(FPIC)

define Build/Compile	
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	(cd $(PKG_BUILD_DIR)/source ; rm -rf config.{cache,status} ; \
		./configure \
			$(HOST_CONFIGURE_VARS) \
			$(HOST_CONFIGURE_ARGS) \
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
			--localstatedir=/var/log/samba \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc/samba \
			$(DISABLE_NLS) \
			--with-lockdir=/var/run/samba \
			--with-privatedir=/etc/samba \
	);
	$(MAKE) -C $(PKG_BUILD_DIR)/source \
		bin/make_smbcodepage bin/make_unicodemap
	(cd $(PKG_BUILD_DIR)/source/bin ; \
		mv -f make_smbcodepage make_smbcodepage.old ; \
		mv -f make_unicodemap make_unicodemap.old ; \
	);
	$(MAKE) -C $(PKG_BUILD_DIR)/source \
		clean
	(cd $(PKG_BUILD_DIR)/source; rm -rf config.{cache,status}; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE -DNDEBUG -DSHMEM_SIZE=524288 -Dfcntl=fcntl64" \
		CPPFLAGS="$(TARGET_CPPFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS) $(LIBGCC_S)" \
		ac_cv_lib_cups_httpConnect=no \
		samba_cv_FTRUNCATE_NEEDS_ROOT=no \
		samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no \
		samba_cv_HAVE_BROKEN_GETGROUPS=no \
		samba_cv_HAVE_BROKEN_READDIR=no \
		samba_cv_HAVE_FCNTL_LOCK=yes \
		samba_cv_HAVE_FNMATCH=yes \
		samba_cv_HAVE_FTRUNCATE_EXTEND=no \
		samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
		samba_cv_HAVE_IFACE_AIX=no \
		samba_cv_HAVE_IFACE_IFCONF=yes \
		samba_cv_HAVE_IFACE_IFREQ=yes \
		samba_cv_HAVE_INO64_T=yes \
		samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=no \
		samba_cv_HAVE_OFF64_T=yes \
		samba_cv_HAVE_ROOT=yes \
		samba_cv_HAVE_SECURE_MKSTEMP=yes \
		samba_cv_HAVE_SHARED_MMAP=yes \
		samba_cv_HAVE_STRUCT_FLOCK64=yes \
		samba_cv_HAVE_SYSV_IPC=no \
		samba_cv_HAVE_TRUNCATED_SALT=no \
		samba_cv_HAVE_UNION_SEMUN=no \
		samba_cv_HAVE_UNSIGNED_CHAR=yes \
		samba_cv_NEED_SGI_SEMUN_HACK=no \
		samba_cv_REPLACE_INET_NTOA=no \
		samba_cv_SIZEOF_INO_T=4 \
		samba_cv_SIZEOF_OFF_T=4 \
		samba_cv_SYSCONF_SC_NGROUPS_MAX=yes \
		samba_cv_USE_SETEUID=yes \
		samba_cv_USE_SETRESUID=no \
		samba_cv_USE_SETREUID=yes \
		samba_cv_USE_SETUIDX=no \
		samba_cv_have_longlong=yes \
		samba_cv_have_setresgid=no \
		samba_cv_have_setresuid=no \
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
			--localstatedir=/var/log/samba \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc/samba \
			$(DISABLE_NLS) \
			--with-lockdir=/var/run/samba \
			--with-privatedir=/etc/samba \
			--with-syslog \
	);
	$(MAKE) -C $(PKG_BUILD_DIR)/source \
		$(TARGET_CONFIGURE_OPTS) \
		CODEPAGEDIR="/usr/share/samba" \
		all shared
	(cd $(PKG_BUILD_DIR)/source/bin ; \
		mv -f make_smbcodepage.old make_smbcodepage ; touch make_smbcodepage ; \
		mv -f make_unicodemap.old make_unicodemap ; touch make_unicodemap ; \
	);
	mkdir -p $(PKG_INSTALL_DIR)/usr/share/samba
	mkdir -p $(PKG_INSTALL_DIR)/var/log
	$(MAKE) -C $(PKG_BUILD_DIR)/source \
		BASEDIR="$(PKG_INSTALL_DIR)/usr" \
		BINDIR="$(PKG_INSTALL_DIR)/usr/bin" \
		SBINDIR="$(PKG_INSTALL_DIR)/usr/bin" \
		LIBDIR="$(PKG_INSTALL_DIR)/usr/lib" \
		VARDIR="$(PKG_INSTALL_DIR)/var/log/samba" \
		MANDIR="$(PKG_INSTALL_DIR)/usr/share/man" \
		CONFIGDIR="$(PKG_INSTALL_DIR)/etc/samba" \
		PRIVATEDIR="$(PKG_INSTALL_DIR)/etc/samba" \
		SWATDIR="$(PKG_INSTALL_DIR)/usr/swat" \
		LOCKDIR="$(PKG_INSTALL_DIR)/var/run/samba" \
		SAMBABOOK="$(PKG_INSTALL_DIR)/usr/swat/using_samba" \
		CODEPAGEDIR="$(PKG_INSTALL_DIR)/usr/share/samba" \
		install
endef

define Package/samba2-common/install
	$(INSTALL_DIR) $(1)/etc/samba
	$(INSTALL_DATA) ./files/smb.conf $(1)/etc/samba/smb.conf
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/bin/smbpasswd.shared $(1)/usr/bin/smbpasswd
	$(INSTALL_DIR) $(1)/usr/share/samba
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/samba/codepage.{437,850} $(1)/usr/share/samba/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/samba/unicode_map.{437,850,ISO8859-1,ISO8859-15} $(1)/usr/share/samba/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/samba/codepage.852 $(1)/usr/share/samba/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/samba/unicode_map.{852,ISO8859-2} $(1)/usr/share/samba/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/samba/codepage.{866,1251} $(1)/usr/share/samba/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/samba/unicode_map.{866,ISO8859-5,KOI8-R,1251} $(1)/usr/share/samba/
endef

define Package/samba2-common/conffiles
/etc/samba/smb.conf
endef

define Package/samba2-server/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/samba.init $(1)/etc/init.d/samba
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/bin/libsmb.so $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/bin/nmbd.shared $(1)/usr/sbin/nmbd
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/bin/smbd.shared $(1)/usr/sbin/smbd
endef

define Package/samba2-client/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/smbclient $(1)/usr/bin/
endef

$(eval $(call BuildPackage,samba2-common))
$(eval $(call BuildPackage,samba2-server))
$(eval $(call BuildPackage,samba2-client))
