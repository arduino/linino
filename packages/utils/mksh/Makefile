#
# Copyright (C) 2007-2011 OpenWrt.org
# Copyright (c) 2009 Thorsten Glaser <tg@mirbsd.org>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mksh
PKG_VERSION:=39
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-R$(PKG_VERSION).cpio.gz
PKG_SOURCE_URL:=http://www.mirbsd.org/MirOS/dist/mir/mksh
PKG_MD5SUM:=b2eeb4fe4ccac2704e1440e53cd2672c

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/mksh
  SECTION:=shells
  CATEGORY:=Base system
  TITLE:=MirBSD Korn Shell
  DEPENDS:=$(DEP)
  URL:=http://mirbsd.de/mksh
endef

define Package/mksh/description
mksh is the MirBSD enhanced version of the Public Domain Korn
shell (pdksh), a Bourne-compatible shell which is largely si-
milar to the original AT&T Korn shell; mksh is the only pdksh
derivate currently being actively developed.  It includes bug
fixes and feature improvements, in order to produce a modern,
robust shell good for interactive and especially script use.
mksh has UTF-8 support (e.g. in the emacs editing mode); R38c
corresponds to OpenBSD 4.5-current ksh (without GNU bash-like
$PS1 and fancy character classes).  The code has throughoutly
been cleaned up and simplified, bugs fixed, standards compli-
ance added, and several enhancements (for extended compatibi-
lity to other modern shells - as well as a couple of its own)
have been placed.
endef

define Build/Compile
	# -DMKSH_SMALL=1 ⇒ reduce functionality quite a lot
	# -DMKSH_ASSUME_UTF8=0 ⇒ never automatically enable
	#	UTF-8 mode, neither use setlocale/nl_langinfo
	#	nor look at $LC_* and $LANG (not recommended)
	# HAVE_CAN_FSTACKPROTECTORALL=0 ⇒ nuke libssp dependency
	# HAVE_REALPATH=x ⇒ add the realpath builtin, which was
	#	disabled by MKSH_SMALL, back if realpath() exists
	cd $(PKG_BUILD_DIR); \
		CC="$(TARGET_CC)" \
		TARGET_OS="$(shell uname -s)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="-DMKSH_SMALL=1 -DMKSH_ASSUME_UTF8=0" \
		HAVE_CAN_FSTACKPROTECTORALL=0 \
		HAVE_REALPATH=x \
		LDFLAGS="$(TARGET_LDFLAGS)" \
			$(BASH) Build.sh -Q -r
endef

define Package/mksh/postinst
#!/bin/sh
grep mksh $${IPKG_INSTROOT}/etc/shells || \
	echo "/bin/mksh" >> $${IPKG_INSTROOT}/etc/shells
endef

define Package/mksh/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/dot.mkshrc $(1)/etc/mkshrc
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mksh $(1)/bin/
endef

define Package/mksh/conffiles
/etc/mkshrc
endef

$(eval $(call BuildPackage,mksh))
