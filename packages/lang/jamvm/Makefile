#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jamvm
PKG_VERSION:=1.5.4
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/jamvm
PKG_MD5SUM:=7654e9657691f5f09c4f481ed4686176

PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/jamvm
  SUBMENU:=Java
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=A compact Java Virtual Machine
  URL:=http://sourceforge.net/projects/jamvm
  DEPENDS:=+libffi +zlib +libpthread @!avr32 @!mips
endef

define Package/jamvm/description
 JamVM is a new Java Virtual Machine which conforms to the JVM 
 specification version (blue book). In comparison to most other VM's (free 
 and commercial) it is extremely small.However, unlike other small VMs 
 (e.g. KVM) it is designed to support the full specification, and includes 
 support for object finalisation, Soft/Weak/Phantom References, the Java 
 Native Interface (JNI) and the Reflection API.
endef

CONFIGURE_ARGS+= \
	--with-classpath-install-dir=/usr \
	--disable-tls \
	--enable-ffi \
	--disable-int-threading \

define Build/Compile	
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CPPFLAGS="$(TARGET_CPPFLAGS)" \
		all
endef

ifneq ($(ARCH),mips)
  define Package/jamvm/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/jamvm $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/jamvm
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/lib/classes.zip $(1)/usr/share/jamvm/
  endef
endif

$(eval $(call BuildPackage,jamvm))

