#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ruby
PKG_VERSION:=1.8.6
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.ruby-lang.org/pub/ruby/1.8/
PKG_MD5SUM:=e558a0e00ae318d43bf6ff9af452bad2

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install

include $(INCLUDE_DIR)/package.mk

define Package/ruby/Default
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Ruby object-oriented scripting language interpreter
  DESCRIPTION:=\
	Ruby is the interpreted scripting language for quick and \\\
	easy object-oriented programming.  It has many features to \\\
	process text files and to do system management tasks (as in \\\
	perl).  It is simple, straight-forward, and extensible.
  URL:=http://www.ruby-lang.org/
endef

define Package/ruby
  $(call Package/ruby/Default)
  DEPENDS:=+libruby
  DESCRIPTION+=\\\
  		\\\
  		The ruby master.
  MENU:=1
endef

define Package/libruby
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Libraries necessary to run Ruby
  URL:=http://www.ruby-lang.org/
endef

# NOTE: it would be a *lot* of work to attempt to break down Ruby's
# standard library bundle into coherent pieces, and work out the dependencies
# between them. This could be useful, e.g. if you don't want to do any XML or
# YAML handling, why carry all that code? However, squashfs does a good
# job of fitting it all into flash.
define Package/rubylibs
  $(call Package/ruby/Default)
  DEPENDS:=ruby
  TITLE:=Ruby standard libraries
  URL:=http://www.ruby-lang.org/
endef

# But this one is a quarter of a meg by itself
define Package/rubylib-nkf
  $(call Package/ruby/Default)
  DEPENDS:=ruby
  TITLE:=Ruby Network Kanji Filter
  URL:=http://www.ruby-lang.org/
endef

# erb appears to depend only on strscan.so. Separate it?
define Package/ruby-erb
  $(call Package/ruby/Default)
  DEPENDS:=ruby +libruby +rubylibs
  TITLE:=Embedded Ruby interpreter
  URL:=http://www.ruby-lang.org/
endef

define Package/ruby-irb
  $(call Package/ruby/Default)
  DEPENDS:=ruby +libruby +rubylibs
  TITLE:=Interactive Ruby shell
  URL:=http://www.ruby-lang.org/
endef

define Package/ruby-rdoc
  $(call Package/ruby/Default)
  DEPENDS:=ruby +libruby +rubylibs
  TITLE:=Ruby documentation generator
  URL:=http://www.ruby-lang.org/
endef

define Package/ruby-testrb
  $(call Package/ruby/Default)
  DEPENDS:=ruby +libruby +rubylibs
  TITLE:=Ruby unit testing
  URL:=http://www.ruby-lang.org/
endef

CONFIGURE_ARGS += \
	--enable-shared \
	--disable-ipv6 \
	, \
	ac_cv_func_setpgrp_void=yes

MAKE_FLAGS += \
	DESTDIR="$(PKG_INSTALL_DIR)" \
	SHELL="/bin/bash" \
	all install

define Package/ruby/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ruby $(1)/usr/bin/
endef

define Package/libruby/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libruby.so* $(1)/usr/lib/
endef

define Package/rubylibs/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby $(1)/usr/lib/
	rm -f $(1)/usr/lib/ruby/1.8/erb.rb
	rm -f $(1)/usr/lib/ruby/1.8/irb.rb
	rm -rf $(1)/usr/lib/ruby/1.8/irb
	rm -rf $(1)/usr/lib/ruby/1.8/rdoc
	rm -rf $(1)/usr/lib/ruby/1.8/test
	rm -rf $(1)/usr/lib/ruby/1.8/runit
	rm -f $(1)/usr/lib/ruby/1.8/irb.rb
	find $(1) -name '*.h' | xargs rm -f
	find $(1) -name 'nkf.so' | xargs rm -f
endef

define Package/rubylib-nkf/install
	( cd $(PKG_INSTALL_DIR); $(TAR) -cf - usr/lib/ruby/1.8/*/nkf.so ) | \
	( cd $(1); $(TAR) -xf - )
endef

define Package/ruby-erb/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/erb $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/erb.rb $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-irb/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/irb $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/irb.rb $(1)/usr/lib/ruby/1.8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/irb $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-rdoc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/rdoc $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ri $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/rdoc $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-testrb/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/testrb $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/test $(1)/usr/lib/ruby/1.8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/runit $(1)/usr/lib/ruby/1.8/
endef

$(eval $(call BuildPackage,ruby))
$(eval $(call BuildPackage,libruby))
$(eval $(call BuildPackage,rubylibs))
$(eval $(call BuildPackage,rubylib-nkf))
$(eval $(call BuildPackage,ruby-erb))
$(eval $(call BuildPackage,ruby-irb))
$(eval $(call BuildPackage,ruby-rdoc))
$(eval $(call BuildPackage,ruby-testrb))

$(eval $(call RequireCommand,ruby, \
        $(PKG_NAME) requires ruby installed on the host-system. \
))
