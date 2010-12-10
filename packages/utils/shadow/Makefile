#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=shadow
PKG_VERSION:=4.0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ftp.pld-linux.org/software/shadow
PKG_MD5SUM:=4fa404ebb4e29828232b3c9a2abddefd

PKG_FIXUP:=libtool

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

UTILS := \
	groupadd groupdel groupmod useradd userdel usermod

define Package/shadow
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=The PLD Linux shadow utilities
  URL:=http://ftp.pld-linux.org/software/shadow/
  DEPENDS:=$(foreach u,$(UTILS),+shadow-$(u))
endef

define Package/shadow/description
  Full versions of standard shadow utilities.  Normally, you would not
  use this package, since the functionality in BusyBox is more than
  sufficient and much smaller.
endef

define Package/shadow/install
	true
endef


define program
  define Package/shadow-$(1)
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=Utility $(1) from the PLD Linux shadow utilities
    URL:=http://ftp.pld-linux.org/software/shadow/
  endef

  define Package/shadow-$(1)/description
    Full version of standard $(1) utility. Normally, you would not use this
    package, since the functionality in BusyBox is more than sufficient.
  endef

  define Package/shadow-$(1)/install
	[ -x "$(PKG_INSTALL_DIR)/usr/sbin/$(1)" ] && { \
		$(INSTALL_DIR) $$(1)/usr/sbin; \
		$(CP) $(PKG_INSTALL_DIR)/usr/sbin/$(1) $$(1)/usr/sbin/; \
	} || { \
		$(INSTALL_DIR) $$(1)/usr/bin; \
		$(CP) $(PKG_INSTALL_DIR)/usr/bin/$(1) $$(1)/usr/bin/; \
	}
  endef

  $$(eval $$(call BuildPackage,shadow-$(1)))
endef

$(eval $(call BuildPackage,shadow))
$(foreach u,$(UTILS),$(eval $(call program,$(u))))
