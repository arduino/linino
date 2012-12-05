#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rsnapshot
PKG_VERSION:=1.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.rsnapshot.org/downloads/
PKG_MD5SUM:=588f92995dcf60a6ea6df8d94a017e7e

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/rsnapshot
  SUBMENU:=backup
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=rsnapshot Backup
  URL:=http://www.rsnapshot.org/
  DEPENDS:=+rsync +perl \
		+perlbase-autoloader \
		+perlbase-class \
		+perlbase-cwd \
		+perlbase-dirhandle \
		+perlbase-essential \
		+perlbase-fcntl \
		+perlbase-file \
		+perlbase-getopt \
		+perlbase-io \
		+perlbase-posix \
		+perlbase-selectsaver \
		+perlbase-symbol \
		+perlbase-tie \
		+perlbase-xsloader
endef

define Package/rsnapshot/description
  rsnapshot is a filesystem snapshot utility for making backups of local and
  remote systems.

  Using rsync and hard links, it is possible to keep multiple, full backups
  instantly available. The disk space required is just a little more than the
  space of one full backup, plus incrementals.
endef

CONFIGURE_ARGS += --with-cp=/bin/cp \
		  --with-rsync=/usr/bin/rsync \
		  --with-rm=/bin/rm \
		  --with-ssh=/usr/bin/ssh \
		  --with-logger=/usr/bin/logger \
		  --with-du=/usr/bin/du

define Package/rsnapshot/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/$(PKG_NAME).conf.default $(1)/etc/$(PKG_NAME).conf
endef

define Package/rsnapshot/conffiles
/etc/$(PKG_NAME).conf
endef

$(eval $(call BuildPackage,rsnapshot))
