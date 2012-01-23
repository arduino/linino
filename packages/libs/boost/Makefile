#
# Copyright (C) 2009-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# Dude, this "boost" is really one of the most crude stuff I ported yet.

include $(TOPDIR)/rules.mk

PKG_NAME:=boost
PKG_VERSION:=1_46_0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/boost
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)_$(PKG_VERSION)
HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)_$(PKG_VERSION)
PKG_MD5SUM:=820393d5746553c192db7b81ba0e53fe

PKG_BUILD_DEPENDS:=boost/host
PKG_BUILD_PARALLEL:=1

PKG_CONFIG_DEPENDS := \
	CONFIG_PACKAGE_boost-date_time \
	CONFIG_PACKAGE_boost-filesystem \
	CONFIG_PACKAGE_boost-graph \
	CONFIG_PACKAGE_boost-iostreams \
	CONFIG_PACKAGE_boost-math \
	CONFIG_PACKAGE_boost-program_options \
	CONFIG_PACKAGE_boost-python \
	CONFIG_PACKAGE_boost-regex \
	CONFIG_PACKAGE_boost-serialization \
	CONFIG_PACKAGE_boost-signals \
	CONFIG_PACKAGE_boost-system \
	CONFIG_PACKAGE_boost-test \
	CONFIG_PACKAGE_boost-thread \
	CONFIG_PACKAGE_boost-wave \

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/boost/Default
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Boost C++ source libraries
  URL:=http://www.boost.org
  DEPENDS:=+libstdcpp
endef

define Package/boost/Default/description
  Boost provides free peer-reviewed portable C++ source libraries
endef

define Package/boost-date_time
  $(call Package/boost/Default)
  TITLE+= (date_time)
endef

define Package/boost-filesystem
  $(call Package/boost/Default)
  TITLE+= (filesystem)
endef

define Package/boost-graph
  $(call Package/boost/Default)
  TITLE+= (graph)
endef

define Package/boost-iostreams
  $(call Package/boost/Default)
  TITLE+= (iostreams)
  DEPENDS+= +zlib
endef

define Package/boost-math
  $(call Package/boost/Default)
  TITLE+= (math)
endef

#define Package/boost-mpi
#  $(call Package/boost/Default)
#  TITLE+= (mpi)
#endef

define Package/boost-program_options
  $(call Package/boost/Default)
  TITLE+= (program_options)
endef

define Package/boost-python
  $(call Package/boost/Default)
  TITLE+= (python)
  DEPENDS+= +python
endef

define Package/boost-regex
  $(call Package/boost/Default)
  TITLE+= (regex)
endef

define Package/boost-serialization
  $(call Package/boost/Default)
  TITLE+= (serialization)
endef

define Package/boost-signals
  $(call Package/boost/Default)
  TITLE+= (signals)
endef

define Package/boost-system
  $(call Package/boost/Default)
  TITLE+= (system)
endef

define Package/boost-test
  $(call Package/boost/Default)
  TITLE+= (test)
endef

define Package/boost-thread
  $(call Package/boost/Default)
  TITLE+= (thread)
endef

define Package/boost-wave
  $(call Package/boost/Default)
  TITLE+= (wave)
endef

define Package/boost
  $(call Package/boost/Default)
  TITLE+= (header-only)
  BUILDONLY:=1
endef

define Build/Configure
endef

define Host/Compile
	# bjam does not provide a configure-script nor a Makefile
	( cd $(HOST_BUILD_DIR)/tools/build/v2/engine/src ; ./build.sh gcc )
endef

CONFIGURE_PREFIX:=$(PKG_INSTALL_DIR)
TARGET_LDFLAGS += -pthreads -lrt

define Build/Compile
	( cd $(PKG_BUILD_DIR) ; \
		echo "using gcc : : $(GNU_TARGET_NAME)-gcc : <compileflags>\"$(TARGET_CFLAGS)\" <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > tools/build/v2/site-config.jam ; \
		$(if $(CONFIG_PACKAGE_boost-python), \
			echo "using python : : $(STAGING_DIR_ROOT)/usr/bin/python :	$(STAGING_DIR)/usr/include/python2.6/ ;" >> \
				tools/build/v2/site-config.jam; \
		) \
		bjam \
			'-sBUILD=release <optimization>space <inlining>on <debug-symbols>off' \
			$(filter -j%,$(PKG_JOBS)) \
			--toolset=gcc --build-type=minimal --layout=system \
			--disable-long-double \
			$(CONFIGURE_ARGS) \
			$(if $(CONFIG_PACKAGE_boost-date_time),--with-date_time) \
			$(if $(CONFIG_PACKAGE_boost-filesystem),--with-filesystem) \
			$(if $(CONFIG_PACKAGE_boost-graph),--with-graph) \
			$(if $(CONFIG_PACKAGE_boost-iostreams),--with-iostreams) \
			$(if $(CONFIG_PACKAGE_boost-math),--with-math) \
			$(if $(CONFIG_PACKAGE_boost-mpi),--with-mpi) \
			$(if $(CONFIG_PACKAGE_boost-program_options),--with-program_options) \
			$(if $(CONFIG_PACKAGE_boost-python),--with-python) \
			$(if $(CONFIG_PACKAGE_boost-regex),--with-regex) \
			$(if $(CONFIG_PACKAGE_boost-serialization),--with-serialization) \
			$(if $(CONFIG_PACKAGE_boost-signals),--with-signals) \
			$(if $(CONFIG_PACKAGE_boost-system),--with-system) \
			$(if $(CONFIG_PACKAGE_boost-test),--with-test) \
			$(if $(CONFIG_PACKAGE_boost-thread),--with-thread) \
			$(if $(CONFIG_PACKAGE_boost-wave),--with-wave) \
			\
			$(if $(CONFIG_PACKAGE_boost-iostreams),-sNO_BZIP2=1 -sZLIB_INCLUDE=$(STAGING_DIR)/usr/include \
				-sZLIB_LIBPATH=$(STAGING_DIR)/usr/lib) \
			install \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/boost/
	$(CP) $(PKG_INSTALL_DIR)/include/boost/* $(1)/usr/include/boost/ # copies _all_ header files - independent of <--with-library>-argument above

	if [ -d $(PKG_INSTALL_DIR)/lib ]; then \
		$(INSTALL_DIR) $(1)/usr/lib; \
		$(CP) $(PKG_INSTALL_DIR)/lib/*.a $(1)/usr/lib/; \
		$(CP) $(PKG_INSTALL_DIR)/lib/*.so* $(1)/usr/lib/; \
	fi
endef

define Host/Install
	$(INSTALL_DIR) $(STAGING_DIR_HOST)/bin
	$(CP) $(HOST_BUILD_DIR)/tools/build/v2/engine/src/bin.*/bjam $(STAGING_DIR_HOST)/bin/
endef

define Package/boost/Default/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/lib/libboost_$(2)*.so* $(1)/usr/lib/
endef

define Package/boost-date_time/install
  $(call Package/boost/Default/install,$(1),date_time)
endef

define Package/boost-filesystem/install
  $(call Package/boost/Default/install,$(1),filesystem)
endef

define Package/boost-graph/install
  $(call Package/boost/Default/install,$(1),graph)
endef

define Package/boost-iostreams/install
  $(call Package/boost/Default/install,$(1),iostreams)
endef

define Package/boost-math/install
  $(call Package/boost/Default/install,$(1),math)
endef

#define Package/boost-mpi/install
#  $(call Package/boost/Default/install,$(1),mpi)
#endef

define Package/boost-program_options/install
  $(call Package/boost/Default/install,$(1),program_options)
endef

define Package/boost-python/install
  $(call Package/boost/Default/install,$(1),python)
endef

define Package/boost-regex/install
  $(call Package/boost/Default/install,$(1),regex)
endef

define Package/boost-serialization/install
  $(call Package/boost/Default/install,$(1),serialization)
endef

define Package/boost-signals/install
  $(call Package/boost/Default/install,$(1),signals)
endef

define Package/boost-system/install
  $(call Package/boost/Default/install,$(1),system)
endef

define Package/boost-test/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/lib/libboost_unit_test_framework*.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/lib/libboost_prg_exec_monitor*.so* $(1)/usr/lib/
endef

define Package/boost-thread/install
  $(call Package/boost/Default/install,$(1),thread)
endef

define Package/boost-wave/install
  $(call Package/boost/Default/install,$(1),wave)
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,boost))
$(eval $(call BuildPackage,boost-date_time))
$(eval $(call BuildPackage,boost-filesystem))
$(eval $(call BuildPackage,boost-graph))
$(eval $(call BuildPackage,boost-iostreams))
$(eval $(call BuildPackage,boost-math))
#$(eval $(call BuildPackage,boost-mpi))
$(eval $(call BuildPackage,boost-program_options))
$(eval $(call BuildPackage,boost-python))
$(eval $(call BuildPackage,boost-regex))
$(eval $(call BuildPackage,boost-serialization))
$(eval $(call BuildPackage,boost-signals))
$(eval $(call BuildPackage,boost-system))
$(eval $(call BuildPackage,boost-test))
$(eval $(call BuildPackage,boost-thread))
$(eval $(call BuildPackage,boost-wave))
