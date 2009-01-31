#
# Copyright (C) 2006,2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=sablevm-sdk
PKG_VERSION:=1.13
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/sablevm
PKG_MD5SUM:=18a7c1a92b0748a206f9767a76a6b3bb

include $(INCLUDE_DIR)/package.mk

define Package/sablevm/Default
  SUBMENU:=Java
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=A Java Virtual Machine (JVM) implementation
  URL:=http://sablevm.org/
  DEPENDS:=+libltdl +libpopt +libpthread +zlib @!TARGET_avr32
endef

define Package/sablevm/Default/description
 SableVM is a robust, extremely portable, efficient, and specifications-
 -compliant Java virtual machine that aims to be easy to maintain and to 
 extend. It features a state-of-the-art and efficient interpreter engine.
 Its source code is very accessible and easy to understand. It also has 
 many robustness features that have been the object of careful design.
endef

define Package/sablevm
$(call Package/sablevm/Default)
  TITLE+= (full)
endef

define Package/sablevm/description
$(call Package/sablevm/Default/description)
 .
 This package contains the full set of Java classes.
endef

define Package/sablevm-mini
$(call Package/sablevm/Default)
  TITLE+= (minimal)
endef

define Package/sablevm-mini/description
$(call Package/sablevm/Default/description)
 .
 This package contains only the minimal set of Java classes needed to 
 run a simple "HelloWorld" program (included in this package).
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--disable-cp-tools \
		--disable-gjdoc \
	)
	$(call Build/Configure/Default, \
		--srcdir="./../sablevm" \
		--with-fastjar=/usr/bin/fastjar \
		--with-jikes=/usr/bin/jikes \
		--with-internal-libffi=yes \
		--with-internal-libpopt=no \
		,\
		LIBS=" -lltdl -lpopt -lz " \
		,sablevm,\
	)
	$(call Build/Configure/Default, \
		--srcdir=./../sablevm-classpath \
		--with-fastjar=/usr/bin/fastjar \
		--with-jikes=/usr/bin/jikes \
		--disable-gtk-peer \
		--disable-gtk-cairo \
		--without-x \
		,\
		,sablevm-classpath,\
	)
endef

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		EARLY_CONFIGURE= \
		EXTRA_CONFIGURE= \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(CP) ./files/mini.classlist $(PKG_BUILD_DIR)/sablevm-classpath/lib/
	( cd $(PKG_BUILD_DIR)/sablevm-classpath/lib; \
		fastjar -Mcf mini.jar -@ < mini.classlist; \
	)
	mkdir -p $(PKG_INSTALL_DIR)/usr/share/sablevm/examples
	$(CP) ./files/*.java $(PKG_INSTALL_DIR)/usr/share/sablevm/examples/
	( cd $(PKG_INSTALL_DIR)/usr/share/sablevm/examples; \
		jikes -bootclasspath "../../sablevm-classpath:../../sablevm-classpath/libclasspath.jar:../../sablevm-classpath/resources.jar" *.java; \
	)
endef

define Package/sablevm/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/{java-,}sablevm $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsablevm-*.so $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/sablevm-classpath
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/sablevm-classpath/libjava*.so $(1)/usr/lib/sablevm-classpath/
	$(INSTALL_DIR) $(1)/usr/lib/security
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/security/classpath.security $(1)/usr/lib/security/
	$(INSTALL_DIR) $(1)/usr/share/sablevm-classpath
	$(CP) $(PKG_INSTALL_DIR)/usr/share/sablevm-classpath/{libclasspath,resources}.jar \
		$(1)/usr/share/sablevm-classpath/
endef

define Package/sablevm-mini/install
  $(call Package/sablevm/install,$(1))
	rm -f $(1)/usr/lib/security/classpath.security
	rm -f $(1)/usr/share/sablevm-classpath/resources.jar
	$(CP) $(PKG_BUILD_DIR)/sablevm-classpath/lib/mini.jar \
		$(1)/usr/share/sablevm-classpath/libclasspath.jar
	$(INSTALL_DIR) $(1)/usr/share/sablevm/examples
	$(CP) $(PKG_INSTALL_DIR)/usr/share/sablevm/examples/* \
		$(1)/usr/share/sablevm/examples/
endef

$(eval $(call BuildPackage,sablevm))
$(eval $(call BuildPackage,sablevm-mini))

$(foreach command, jikes fastjar, \
  $(eval $(call RequireCommand,$(command), \
   $(PKG_NAME) requires $(command). \
  )) \
)

