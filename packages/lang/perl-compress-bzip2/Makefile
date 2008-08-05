# $Id: Makefile 4033 2006-06-21 02:32:39Z nbd $

include $(TOPDIR)/rules.mk

PKG_NAME:=perl-compress-bzip2
PKG_VERSION:=2.09
PKG_RELEASE:=2
PKG_MD5SUM:=1699fde3e86f2a036f135ae606d456bf

PKG_SOURCE_URL:=http://search.cpan.org/CPAN/authors/id/A/AR/ARJAY
PKG_SOURCE:=Compress-Bzip2-$(PKG_VERSION).tar.gz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/perl/Compress-Bzip2-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include ../perl/perlmod.mk

define Package/perl-compress-bzip2
  SUBMENU:=Perl
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Perl interface to bzip2 compression library
  URL:=http://search.cpan.org/~arjay/Compress-Bzip2-2.09/
  DEPENDS:=perl +bzip2
endef

define Build/Configure
	$(call perlmod/Configure,,BUILD_BZLIB=0)
endef

define Build/Compile
	$(call perlmod/Compile,,)
endef

define Package/perl-compress-bzip2/install
	$(call perlmod/Install,$(1),Compress auto/Compress)
endef


$(eval $(call BuildPackage,perl-compress-bzip2))
