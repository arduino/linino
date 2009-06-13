#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=coreutils
PKG_VERSION:=7.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/coreutils
PKG_MD5SUM:=427c2914d3eab956f317c9ec6a45e62a

include $(INCLUDE_DIR)/package.mk

define Package/coreutils
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=The GNU core utilities
  URL:=http://www.gnu.org/software/coreutils/
endef
	
define Package/coreutils/description
	Full versions of standard GNU utilities.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
        sufficient and much smaller.
endef

CONFIGURE_ARGS += \
	--enable-install-program=su

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		SHELL="/bin/bash" \
		all install install-root
endef

define Package/coreutils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,coreutils))
