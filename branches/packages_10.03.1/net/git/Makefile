#
# Copyright (C) 2009-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=git
PKG_VERSION:=1.7.5.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@KERNEL/software/scm/git
PKG_MD5SUM:=f79ab8fe79b35346b499f131cbf381a4

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/git
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Version Control Systems
  DEPENDS:=+libopenssl +libpthread
  TITLE:=The fast version control system
  URL:=http://git-scm.com
  MAINTAINER:=Luka Perkov <openwrt@lukaperkov.net>
endef

define Package/git/description
 Git is a free & open source, distributed version control system
 designed to handle everything from small to very large projects
 with speed and efficiency.
endef

MAKE_FLAGS := \
	CC="$(TARGET_CC)" \
	LD="$(TARGET_CC)" \
	CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
	CPPFLAGS="$(TARGET_CPPFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
	NO_PERL="YesPlease" \
	NO_EXPAT="YesPlease" \
	NO_WISH="YesPlease" \
	NO_ICONV="YesPlease" \
	NO_NSEC="YesPlease" \
	NO_CURL="YesPlease" \
	NO_TCLTK="YesPlease" \
	NO_MKSTEMPS="YesPlease" \
	NO_PYTHON="YesPlease" \

define Build/Configure
	$(MAKE) -C $(PKG_BUILD_DIR) \
		configure

	( cd $(PKG_BUILD_DIR); \
		./configure --prefix=/usr \
	);
endef

define Package/git/install
	$(INSTALL_DIR) $(1)
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,git))
