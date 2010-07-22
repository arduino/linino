#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=diffutils
PKG_VERSION:=3.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/diffutils
PKG_MD5SUM:=684aaba1baab743a2a90e52162ff07da

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/diffutils
  SECTION:=devel
  CATEGORY:=Development
  TITLE:=diffutils
  URL:=http://www.gnu.org/software/diffutils/
endef

define Package/diffutils/description
  The Diffutils package contains programs that show the differences between
  files or directories.
endef

CONFIGURE_VARS += \
	ac_cv_func_mempcpy=n \

define Package/diffutils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/{sdiff,diff3,diff,cmp} $(1)/usr/bin/
endef

define Package/diffutils/preinst
#!/bin/sh
if [ -e $${IPKG_INSTROOT}/usr/bin/diff ]; then
  rm $${IPKG_INSTROOT}/usr/bin/diff;
fi
endef

define Package/diffutils/postrm
#!/bin/sh
ln -sf ../../bin/busybox $${IPKG_INSTROOT}/usr/bin/diff
$${IPKG_INSTROOT}/usr/bin/diff 2>&1 | grep 'applet not found' > /dev/null 2>&1 && rm $${IPKG_INSTROOT}/usr/bin/diff
exit 0
endef

$(eval $(call BuildPackage,diffutils))
