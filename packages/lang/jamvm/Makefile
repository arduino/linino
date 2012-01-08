#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jamvm
PKG_VERSION:=1.6.0-git
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://git.berlios.de/jamvm
PKG_SOURCE_VERSION:=4617da717ecb05654ea5bb9572338061106a414d
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MIRROR_MD5SUM:=fd546a48f9e248d21d879664240892a1

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/jamvm
  SUBMENU:=Java
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=A compact Java Virtual Machine
  URL:=http://sourceforge.net/projects/jamvm
  DEPENDS:=+zlib +libpthread +librt +classpath @!avr32
endef

define Package/jamvm/description
 JamVM is a new Java Virtual Machine which conforms to the JVM 
 specification version (blue book). In comparison to most other VM's (free 
 and commercial) it is extremely small.However, unlike other small VMs 
 (e.g. KVM) it is designed to support the full specification, and includes 
 support for object finalisation, Soft/Weak/Phantom References, the Java 
 Native Interface (JNI) and the Reflection API.
endef

CONFIGURE_ARGS += \
	--with-java-runtime-library=gnuclasspath \
	--with-classpath-install-dir=/usr \
	--disable-int-inlining

MAKE_FLAGS += \
	GLIBJ_ZIP=$(STAGING_DIR)/usr/share/classpath/glibj.zip

define Package/jamvm/install
	$(INSTALL_DIR) $(1)/usr
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/bin \
		$(PKG_INSTALL_DIR)/usr/lib \
		$(PKG_INSTALL_DIR)/usr/share \
		$(1)/usr/
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,jamvm))

