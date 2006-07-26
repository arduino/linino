# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=rrdtool1
PKG_VERSION:=1.0.50
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/rrdtool-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://people.ee.ethz.ch/~oetiker/webtools/rrdtool/pub/rrdtool-1.0.x
PKG_MD5SUM:=c466e2e7df95fa8e318e46437da87686
PKG_CAT:=zcat

PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/librrd1
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib
  TITLE:=Round Robin Database (RRD) management library
  DESCRIPTION:=Round Robin Database (RRD) management library.\\\
    RRD is the Acronym for Round Robin Database. RRD is a system to store and \\\
    display time-series data (i.e. network bandwidth, machine-room temperature, \\\
    server load average). It stores the data in a very compact way that will \\\
    not expand over time, and it presents useful graphs by processing the data \\\
    to enforce a certain data density. It can be used either via simple wrapper \\\
    scripts (from shell or Perl) or via frontends that poll network devices and \\\
    put friendly user interface on it.\\\
    \\\
    This is version 1.0.x with cgilib-0.4, gd1.3 and libpng-1.0.9 linked into \\\
    librrd.so. The library is much smaller compared to the 1.2.x version with \\\
    separate dynamic linked libraries.\\\
    \\\
    This package contains a shared library, used by other programs.
  URL:=http://people.ee.ethz.ch/~oetiker/webtools/rrdtool/
endef

define Package/rrdcgi1
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+librrd1
  TITLE:=Round Robin Database (RRD) CGI graphing tool
  DESCRIPTION:=Round Robin Database (RRD) CGI graphing tool.\\\
    RRD is the Acronym for Round Robin Database. RRD is a system to store and \\\
    display time-series data (i.e. network bandwidth, machine-room temperature, \\\
    server load average). It stores the data in a very compact way that will \\\
    not expand over time, and it presents useful graphs by processing the data \\\
    to enforce a certain data density. It can be used either via simple wrapper \\\
    scripts (from shell or Perl) or via frontends that poll network devices and \\\
    put friendly user interface on it.\\\
    \\\
    This is version 1.0.x with cgilib-0.4, gd1.3 and libpng-1.0.9 linked into \\\
    librrd.so. The library is much smaller compared to the 1.2.x version with \\\
    separate dynamic linked libraries.\\\
    \\\
    This package contains the rrdcgi tool used to create web pages containing \\\
    RRD graphs based on templates.
  URL:=http://people.ee.ethz.ch/~oetiker/webtools/rrdtool/
endef

define Package/rrdtool1
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+librrd1
  TITLE:=Round Robin Database (RRD) management tools
  DESCRIPTION:=Round Robin Database (RRD) management tools.\\\
    RRD is the Acronym for Round Robin Database. RRD is a system to store and \\\
    display time-series data (i.e. network bandwidth, machine-room temperature, \\\
    server load average). It stores the data in a very compact way that will \\\
    not expand over time, and it presents useful graphs by processing the data \\\
    to enforce a certain data density. It can be used either via simple wrapper \\\
    scripts (from shell or Perl) or via frontends that poll network devices and \\\
    put friendly user interface on it.\\\
    \\\
    This is version 1.0.x with cgilib-0.4, gd1.3 and libpng-1.0.9 linked into \\\
    librrd.so. The library is much smaller compared to the 1.2.x version with \\\
    separate dynamic linked libraries.\\\
    \\\
    This package contains command line tools used to manage RRDs.
  URL:=http://people.ee.ethz.ch/~oetiker/webtools/rrdtool/
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR); rm -rf config.{status,cache} ; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
		ac_cv_path_PERL=no \
		rd_cv_ieee_works=yes \
		shrext_cmds=".so" \
		./configure \
			--target=$(GNU_TARGET_NAME) \
			--host=$(GNU_TARGET_NAME) \
			--build=$(GNU_HOST_NAME) \
			--program-prefix="" \
			--program-suffix="" \
			--prefix=/usr \
			--exec-prefix=/usr \
			--bindir=/usr/bin \
			--datadir=/usr/share \
			--includedir=/usr/include \
			--infodir=/usr/share/info \
			--libdir=/usr/lib \
			--libexecdir=/usr/lib \
			--localstatedir=/var \
			--mandir=/usr/share/man \
			--sbindir=/usr/sbin \
			--sysconfdir=/etc \
			$(DISABLE_LARGEFILE) \
			$(DISABLE_NLS) \
			--enable-shared=yes \
			--enable-static=yes \
			--disable-rpath \
			--with-gnu-ld \
			--enable-local-zlib \
	);
endef

define Build/Compile
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		shrext_cmds=".so" \
		all install
endef

define Package/rrdtool1/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/rrd{tool,update} $(1)/usr/bin/
endef

define Package/rrdcgi1/install
	install -d -m0755 $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/rrdcgi $(1)/usr/bin/
endef

define Package/librrd1/install
	install -d -m0755 $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librrd.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	mkdir -p $(STAGING_DIR)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/rrd.h $(STAGING_DIR)/usr/include/
	mkdir -p $(STAGING_DIR)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librrd.{a,so*} $(STAGING_DIR)/usr/lib/
endef

define Build/UninstallDev
	rm -rf \
		$(STAGING_DIR)/usr/include/rrd.h \
		$(STAGING_DIR)/usr/lib/librrd.{a,so*}
endef

$(eval $(call BuildPackage,librrd1))
$(eval $(call BuildPackage,rrdcgi1))
$(eval $(call BuildPackage,rrdtool1))
