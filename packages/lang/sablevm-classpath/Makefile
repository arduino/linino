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
PKG_MD5SUM:=9476bb7a0ad67c6cfa353d06f094cdce

PKG_SOURCE_URL:=http://sablevm.org/download/release/$(PKG_VERSION)/
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/libsablevm-classpath
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Essential native libraries for Java
  DESCRIPTION:=GNU Classpath, Essential Libraries for Java, is a GNU project to create\\\
	free core class libraries for use with virtual machines and compilers for\\\
	the java programming language.\\\
	This is a modified version for use with SableVM.\\\
  URL:=http://www.gnu.org/software/classpath/
endef

define Package/sablevm-classpath-full
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=libsablevm-classpath
  TITLE:=Full set
endef

define Package/sablevm-classpath-mini
  SECTION:=lang
  CATEGORY:=Languages
  DEPENDS:=libsablevm-classpath
  TITLE:=Minimal set
endef

define Build/Configure
$(call Build/Configure/Default,--enable-shared \
		  --disable-static \
		  --disable-gtk-peer \
		  --disable-gtk-cairo \
		  --without-x)
endef


define Build/Compile	
	rm -rf $(PKG_INSTAL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(CP) ./files/mini.classlist $(PKG_BUILD_DIR)/lib/
	cd $(PKG_BUILD_DIR)/lib ; fastjar -Mcf mini.jar -@ < mini.classlist
endef

define Package/libsablevm-classpath/install	
	install -d -m0755 $(IDIR_LIBSABLEVM_CLASSPATH)/usr/lib/sablevm-classpath
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/sablevm-classpath/libjava*.so $(IDIR_LIBSABLEVM_CLASSPATH)/usr/lib/sablevm-classpath/
	install -d -m0755 $(IDIR_LIBSABLEVM_CLASSPATH)/usr/lib/security
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/security/classpath.security $(IDIR_LIBSABLEVM_CLASSPATH)/usr/lib/security/
endef

define Package/sablevm-classpath-full/install	
	install -d -m0755 $(IDIR_SABLEVM_CLASSPATH_FULL)/usr/share/sablevm-classpath
	$(CP) $(PKG_INSTALL_DIR)/usr/share/sablevm-classpath/{libclasspath,resources}.jar \
		$(IDIR_SABLEVM_CLASSPATH_FULL)/usr/share/sablevm-classpath/
endef
	
define Package/sablevm-classpath-mini/install	
	install -d -m0755 $(IDIR_SABLEVM_CLASSPATH_MINI)/usr/share/sablevm-classpath
	install -m0755 $(PKG_BUILD_DIR)/lib/mini.jar \
		$(IDIR_SABLEVM_CLASSPATH_MINI)/usr/share/sablevm-classpath/libclasspath.jar
endef

$(eval $(call BuildPackage,libsablevm-classpath))
$(eval $(call BuildPackage,sablevm-classpath-full))
$(eval $(call BuildPackage,sablevm-classpath-mini))

$(eval $(call RequireCommand,gcj, \
        libsablevm-classpath require jikes to build. \
))
