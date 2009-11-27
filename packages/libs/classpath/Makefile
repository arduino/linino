#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=classpath
PKG_VERSION:=0.98
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/classpath
PKG_MD5SUM:=90c6571b8b0309e372faa0f9f6255ea9

include $(INCLUDE_DIR)/package.mk

define Package/classpath
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=GNU Classpath
  URL:=http://www.gnu.org/software/classpath/
  MAINTAINER:=Roberto Riggio (roberto.riggio@create-net.org)
endef

define Package/classpath/Description 
	GNU Classpath, Essential Libraries for Java, is a GNU project 
	to create free core class libraries for use with virtual 
	machines and compilers for the java programming language.
endef 

CONFIGURE_ARGS+= \
	--with-javac \
	--enable-jni \
	--disable-gtk-peer \
	--disable-gconf-peer \
	--disable-plugin \

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR="$(PKG_INSTALL_DIR)" \
		CPPFLAGS="$(TARGET_CPPFLAGS)" \
		all install
endef

define Package/classpath/install
	$(INSTALL_DIR) $(1)/usr/share/classpath
	$(INSTALL_DIR) $(1)/usr/lib/classpath
	$(CP) $(PKG_INSTALL_DIR)/usr/share/classpath/glibj.zip $(1)/usr/share/classpath/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/classpath/* $(1)/usr/lib/classpath/
endef

$(eval $(call BuildPackage,classpath))
