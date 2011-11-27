#
# Copyright (C) 2008-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=samba3
PKG_VERSION:=3.0.37
PKG_RELEASE:=1

PKG_MD5SUM:=11ed2bfef4090bd5736b194b43f67289

PKG_SOURCE_URL:=ftp://ftp.samba.org/pub/samba/old-versions/
PKG_SOURCE:=samba-$(PKG_VERSION).tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/samba-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/samba3/Default
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Filesystem
  URL:=http://www.samba.org/
endef

define Package/samba3
$(call Package/samba3/Default)
  TITLE:=SMB server for file and printer sharing
  DEPENDS:=+libpthread +libpopt $(ICONV_DEPENDS)
endef

define Package/samba3-nmbd
$(call Package/samba3/Default)
  TITLE:=NetBIOS name server
  DEPENDS:=+samba3
endef

define Package/samba3-mountcifs
$(call Package/samba3/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Mount utility for samba shares
endef

define Package/samba3/description
SMB server for file and printer sharing
Also contains a SMB password utility (smbpasswd)

Made small with patches taken from AVM GPL releases and freetz 
endef

define Package/samba3-nmbd/description
NetBIOS name server

Made small with patches taken from AVM GPL releases and freetz 
endef

define Package/cifsmount/description
An user space helper utility for mounting remote CIFS shares.
endef

define Package/samba3/conffiles
/etc/config/samba
/etc/samba/smb.conf.template
endef

define Package/samba3/config
	source "$(SOURCE)/Config.in"
endef

TARGET_CFLAGS+=$(if $(CONFIG_SAMBA3_CONFIG_DEBUG),-DSAMBA_DEBUG,-DMAX_DEBUG_LEVEL=2)
TARGET_CFLAGS+=$(if $(CONFIG_SAMBA3_CONFIG_SMALLER),-DAVM_SMALLER)
TARGET_CFLAGS+=$(if $(CONFIG_SAMBA3_CONFIG_NO_PRINTING),-DAVM_NO_PRINTING)
CONFIGURE_PATH:=source
CONFIGURE_ARGS+= \
	$(if $(CONFIG_SAMBA3_CONFIG_DEBUG),--enable-debug) \
	--without-krb5 \
	--without-ads \
	--without-ldap \
	--enable-largefile \
	--with-configdir=/etc/samba \
	--with-libiconv=$(ICONV_PREFIX) \
	--with-privatedir=/etc/samba

# Make sure we tell the configure script that we support negative enum values and want to use setresuid
CONFIGURE_VARS+= \
	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
	samba_cv_USE_SETEUID=no \
	samba_cv_have_setresuid=yes \
	samba_cv_USE_SETRESUID=yes \
	samba_cv_HAVE_C99_VSNPRINTF=yes \
	samba_cv_have_longlong=yes \
	ac_cv_type_long_long=yes \

MAKE_PATH=source
MAKE_FLAGS += \
	$(if $(CONFIG_SAMBA3_CONFIG_NO_PRINTING),OWRT_NO_PRINTING=1) \
	$(if $(CONFIG_SAMBA3_CONFIG_SMALLER),OWRT_SMALLER=1)

define Build/Compile
	# Ugly fix for parallel building (without this some generated files will be missing upon clean build)
	$(call Build/Compile/Default, proto_exists)
	$(call Build/Compile/Default, \
		$(if $(CONFIG_PACKAGE_samba3),bin/smbd bin/smbpasswd) \
		$(if $(CONFIG_PACKAGE_samba3-nmbd),bin/nmbd) \
		$(if $(CONFIG_PACKAGE_samba3-mountcifs),bin/mount.cifs bin/umount.cifs) \
	)
endef

define Package/samba3/install
	$(INSTALL_DIR) $(1)/etc/{samba,init.d,config}
	$(INSTALL_BIN) ./files/samba.init $(1)/etc/init.d/samba
	$(INSTALL_DATA) ./files/samba.config $(1)/etc/config/samba
	$(INSTALL_DATA) ./files/smb.conf.template $(1)/etc/samba/
	touch $(1)/etc/samba/smbpasswd
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/bin/smbpasswd $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/bin/smbd $(1)/usr/sbin/
endef

define Package/samba3-nmbd/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/samba-nmbd.init $(1)/etc/init.d/samba-nmbd
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/bin/nmbd $(1)/usr/sbin/
endef

define Package/samba3-mountcifs/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/bin/mount.cifs $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/source/bin/umount.cifs $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,samba3))
$(eval $(call BuildPackage,samba3-nmbd))
$(eval $(call BuildPackage,samba3-mountcifs))
