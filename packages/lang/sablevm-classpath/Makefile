#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sablevm-classpath
PKG_VERSION:=1.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://sablevm.org/download/release/$(PKG_VERSION)/
PKG_MD5SUM:=9476bb7a0ad67c6cfa353d06f094cdce
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/sablevm-classpath/Default
  SECTION:=lang
  CATEGORY:=Languages
  URL:=http://www.gnu.org/software/classpath/
endef

define Package/libsablevm-classpath
  $(call Package/sablevm-classpath/Default)
  TITLE:=Essential native libraries for Java
  DESCRIPTION:=\
	GNU Classpath, Essential Libraries for Java, is a GNU project to create \\\
	free core class libraries for use with virtual machines and compilers for \\\
	the java programming language.\\\
	This is a modified version for use with SableVM.
endef

define Package/sablevm-classpath-full
  $(call Package/sablevm-classpath/Default)
  DEPENDS:=+libsablevm-classpath
  TITLE+= (full)
endef

define Package/sablevm-classpath-mini
  $(call Package/sablevm-classpath/Default)
  DEPENDS:=+libsablevm-classpath
  TITLE+= (minimal)
endef

define Build/Configure
	$(call Build/Configure/Default, \
		  --disable-gtk-peer \
		  --disable-gtk-cairo \
		  --with-jikes \
		  --without-x \
	)
endef


define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(CP) ./files/mini.classlist $(PKG_BUILD_DIR)/lib/
	cd $(PKG_BUILD_DIR)/lib ; fastjar -Mcf mini.jar -@ < mini.classlist
endef

define Package/libsablevm-classpath/install	
	$(INSTALL_DIR) $(1)/usr/lib/sablevm-classpath
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/sablevm-classpath/libjava*.so $(1)/usr/lib/sablevm-classpath/
	$(INSTALL_DIR) $(1)/usr/lib/security
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/security/classpath.security $(1)/usr/lib/security/
endef

define Package/sablevm-classpath-full/install	
	$(INSTALL_DIR) $(1)/usr/share/sablevm-classpath
	$(CP) $(PKG_INSTALL_DIR)/usr/share/sablevm-classpath/{libclasspath,resources}.jar \
		$(1)/usr/share/sablevm-classpath/
endef
	
define Package/sablevm-classpath-mini/install	
	$(INSTALL_DIR) $(1)/usr/share/sablevm-classpath
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lib/mini.jar \
		$(1)/usr/share/sablevm-classpath/libclasspath.jar
endef

$(eval $(call BuildPackage,libsablevm-classpath))
$(eval $(call BuildPackage,sablevm-classpath-full))
$(eval $(call BuildPackage,sablevm-classpath-mini))

$(foreach command, jikes fastjar, \
  $(eval $(call RequireCommand,$(command), \
   $(PKG_NAME) requires $(command). \
  )) \
)
