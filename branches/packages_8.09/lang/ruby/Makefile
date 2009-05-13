#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ruby
PKG_VERSION:=1.8.6-p36
PKG_RELEASE:=1.1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.ruby-lang.org/pub/ruby/1.8/
PKG_MD5SUM:=eb7f25818cb6993839b38d1f21bd4ea1

include $(INCLUDE_DIR)/package.mk

define Package/ruby/Default
  SUBMENU:=Ruby
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Ruby scripting language
  URL:=http://www.ruby-lang.org/
endef

define Package/ruby/Default/description
 Ruby is the interpreted scripting language for quick and  easy 
 object-oriented programming.  It has many features to process text files 
 and to do system management tasks (as in perl).  It is simple, 
 straight-forward, and extensible.
endef

define Package/ruby
$(call Package/ruby/Default)
  TITLE+= (interpreter)
  DEPENDS:=+libruby
endef

define Package/ruby/description
$(call Package/ruby/Default/description)
endef

define Package/libruby
$(call Package/ruby/Default)
  SUBMENU:=
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (shared library)
endef

# Ongoing work to break up ruby's standard library into coherent pieces
# with minimal dependencies between them

define Package/ruby-core
$(call Package/ruby/Default)
  TITLE:=Ruby standard libraries
  DEPENDS:=ruby
endef

define Package/ruby-cgi
$(call Package/ruby/Default)
  TITLE:= Ruby CGI support toolkit
  DEPENDS:=ruby
endef

define Package/ruby-erb
$(call Package/ruby/Default)
  TITLE+= (embedded interpreter)
  DEPENDS:=ruby
endef

define Package/ruby-gdbm
$(call Package/ruby/Default)
  TITLE:=Ruby support for gdbm
  DEPENDS:=ruby +libgdbm
endef

define Package/ruby-irb
$(call Package/ruby/Default)
  TITLE+= (interactive shell)
  DEPENDS:=ruby +ruby-core
endef

define Package/ruby-ncurses
$(call Package/ruby/Default)
  TITLE:=Ruby support for ncurses
  DEPENDS:=ruby +libncurses
endef

define Package/ruby-nkf
$(call Package/ruby/Default)
  TITLE:=Ruby Network Kanji Filter
  DEPENDS:=ruby
endef

define Package/ruby-openssl
$(call Package/ruby/Default)
  TITLE:=Ruby support for openssl
  DEPENDS:=ruby +libopenssl
endef

define Package/ruby-rdoc
$(call Package/ruby/Default)
  TITLE+= (documentation generator)
  DEPENDS:=ruby
endef

define Package/ruby-readline
$(call Package/ruby/Default)
  TITLE:=Ruby support for readline
  DEPENDS:=ruby +libncurses +libreadline
endef

define Package/ruby-rexml
$(call Package/ruby/Default)
  TITLE:=Ruby XML toolkit
  DEPENDS:=ruby
endef

define Package/ruby-rss
$(call Package/ruby/Default)
  TITLE:=Ruby RSS toolkit
  DEPENDS:=ruby
endef

define Package/ruby-soap
$(call Package/ruby/Default)
  TITLE:=Ruby SOAP toolkit
  DEPENDS:=ruby
endef

define Package/ruby-unit
$(call Package/ruby/Default)
  TITLE:=Ruby unit testing toolkit
  DEPENDS:=ruby
endef

define Package/ruby-webrick
$(call Package/ruby/Default)
  TITLE:=Ruby Web server toolkit
  DEPENDS:=ruby
endef

define Package/ruby-wsdl
$(call Package/ruby/Default)
  TITLE:=Ruby WSDL 1.1 toolkit
  DEPENDS:=ruby
endef

define Package/ruby-xmlrpc
$(call Package/ruby/Default)
  TITLE:=Ruby XML-RPC toolkit
  DEPENDS:=ruby
endef

define Package/ruby-xsd
$(call Package/ruby/Default)
  TITLE:=Ruby XML Schema Datatypes toolkit
  DEPENDS:=ruby
endef

define Package/ruby-yaml
$(call Package/ruby/Default)
  TITLE:=Ruby YAML toolkit
  DEPENDS:=ruby
endef

define Package/ruby-zlib
$(call Package/ruby/Default)
  TITLE:=Ruby support for zlib
  DEPENDS:=ruby +zlib
endef


CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-rpath \
	--disable-ipv6 \

CONFIGURE_VARS += \
	ac_cv_func_setpgrp_void=yes

TARGET_LDFLAGS += -L$(PKG_BUILD_DIR)

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
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libruby.so.* $(1)/usr/lib/
endef

define Package/ruby-core/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby $(1)/usr/lib/
	rm -rf	\
		$(1)/usr/lib/ruby/1.8/*/curses.so \
		\
		$(1)/usr/lib/ruby/1.8/*/gdbm.so \
		\
		$(1)/usr/lib/ruby/1.8/kconv.rb \
		$(1)/usr/lib/ruby/1.8/*/nkf.so \
		\
		$(1)/usr/lib/ruby/1.8/digest \
		$(1)/usr/lib/ruby/1.8/digest.rb \
		$(1)/usr/lib/ruby/1.8/*/digest \
		$(1)/usr/lib/ruby/1.8/*/digest.so \
		$(1)/usr/lib/ruby/1.8/openssl \
		$(1)/usr/lib/ruby/1.8/openssl.rb \
		$(1)/usr/lib/ruby/1.8/*/openssl.so \
		$(1)/usr/lib/ruby/1.8/md5.rb \
		$(1)/usr/lib/ruby/1.8/rmd160.rb \
		$(1)/usr/lib/ruby/1.8/sha1.rb \
		$(1)/usr/lib/ruby/1.8/sha2.rb \
		$(1)/usr/lib/ruby/1.8/drb/ssl.rb \
		$(1)/usr/lib/ruby/1.8/net/ftptls.rb \
		$(1)/usr/lib/ruby/1.8/net/https.rb \
		$(1)/usr/lib/ruby/1.8/net/telnets.rb \
		$(1)/usr/lib/ruby/1.8/webrick/ssl.rb \
		\
		$(1)/usr/lib/ruby/1.8/*/readline.so \
		$(1)/usr/lib/ruby/1.8/irb/completion.rb \
		$(1)/usr/lib/ruby/1.8/irb/ext/save-history.rb \
		\
		$(1)/usr/lib/ruby/1.8/*/zlib.so \
		\
		$(1)/usr/lib/ruby/1.8/erb.rb \
		\
		$(1)/usr/lib/ruby/1.8/irb.rb \
		$(1)/usr/lib/ruby/1.8/irb \
		\
		$(1)/usr/lib/ruby/1.8/rdoc \
		\
		$(1)/usr/lib/ruby/1.8/cgi \
		$(1)/usr/lib/ruby/1.8/cgi.rb \
		$(1)/usr/lib/ruby/1.8/cgi-lib.rb \
		\
		$(1)/usr/lib/ruby/1.8/rexml \
		\
		$(1)/usr/lib/ruby/1.8/rss \
		$(1)/usr/lib/ruby/1.8/rss.rb \
		\
		$(1)/usr/lib/ruby/1.8/soap \
		\
		$(1)/usr/lib/ruby/1.8/rubyunit.rb \
		$(1)/usr/lib/ruby/1.8/runit \
		$(1)/usr/lib/ruby/1.8/test \
		\
		$(1)/usr/lib/ruby/1.8/webrick \
		$(1)/usr/lib/ruby/1.8/webrick.rb \
		\
		$(1)/usr/lib/ruby/1.8/wsdl \
		\
		$(1)/usr/lib/ruby/1.8/xmlrpc \
		\
		$(1)/usr/lib/ruby/1.8/xsd \
		\
		$(1)/usr/lib/ruby/1.8/yaml \
		$(1)/usr/lib/ruby/1.8/yaml.rb \
		$(1)/usr/lib/ruby/1.8/*/syck.so \
		
	find $(1) -name '*.h' | xargs rm -f
endef

define Package/ruby-cgi/install
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/cgi $(1)/usr/lib/ruby/1.8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/cgi.rb $(1)/usr/lib/ruby/1.8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/cgi-lib.rb $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-erb/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/erb $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/erb.rb $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-gdbm/install
	( cd $(PKG_INSTALL_DIR); $(TAR) -cf - \
		usr/lib/ruby/1.8/*/gdbm.so \
	) | ( cd $(1); $(TAR) -xf - )
endef

define Package/ruby-irb/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/irb $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/irb $(1)/usr/lib/ruby/1.8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/irb.rb $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-ncurses/install
	( cd $(PKG_INSTALL_DIR); $(TAR) -cf - \
		usr/lib/ruby/1.8/*/curses.so \
	) | ( cd $(1); $(TAR) -xf - )
endef

define Package/ruby-nkf/install
	( cd $(PKG_INSTALL_DIR); $(TAR) -cf - \
		usr/lib/ruby/1.8/kconv.rb \
		usr/lib/ruby/1.8/*/nkf.so \
	) | ( cd $(1); $(TAR) -xf - )
endef

define Package/ruby-openssl/install
	( cd $(PKG_INSTALL_DIR); $(TAR) -cf - \
		usr/lib/ruby/1.8/digest \
		usr/lib/ruby/1.8/digest.rb \
		usr/lib/ruby/1.8/*/digest.so \
		usr/lib/ruby/1.8/*/digest/*.so \
		usr/lib/ruby/1.8/openssl \
		usr/lib/ruby/1.8/openssl.rb \
		usr/lib/ruby/1.8/*/openssl.so \
		usr/lib/ruby/1.8/md5.rb \
		usr/lib/ruby/1.8/rmd160.rb \
		usr/lib/ruby/1.8/sha1.rb \
		usr/lib/ruby/1.8/sha2.rb \
		usr/lib/ruby/1.8/drb/ssl.rb \
		usr/lib/ruby/1.8/net/ftptls.rb \
		usr/lib/ruby/1.8/net/https.rb \
		usr/lib/ruby/1.8/net/telnets.rb \
		usr/lib/ruby/1.8/webrick/ssl.rb \
	) | ( cd $(1); $(TAR) -xf - )
endef

define Package/ruby-rdoc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/rdoc $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ri $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/rdoc $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-readline/install
	( cd $(PKG_INSTALL_DIR); $(TAR) -cf - \
		usr/lib/ruby/1.8/*/readline.so \
		usr/lib/ruby/1.8/irb/completion.rb \
		usr/lib/ruby/1.8/irb/ext/save-history.rb \
	) | ( cd $(1); $(TAR) -xf - )
endef

define Package/ruby-rexml/install
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/rexml $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-rss/install
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/rss $(1)/usr/lib/ruby/1.8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/rss.rb $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-soap/install
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/soap $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-unit/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/testrb $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/rubyunit.rb $(1)/usr/lib/ruby/1.8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/runit $(1)/usr/lib/ruby/1.8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/test $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-webrick/install
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/webrick $(1)/usr/lib/ruby/1.8/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/webrick.rb $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-wsdl/install
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/wsdl $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-xmlrpc/install
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/xmlrpc $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-xsd/install
	$(INSTALL_DIR) $(1)/usr/lib/ruby/1.8
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/ruby/1.8/xsd $(1)/usr/lib/ruby/1.8/
endef

define Package/ruby-yaml/install
	( cd $(PKG_INSTALL_DIR); $(TAR) -cf - \
		usr/lib/ruby/1.8/yaml \
		usr/lib/ruby/1.8/yaml.rb \
		usr/lib/ruby/1.8/*/syck.so \
	) | ( cd $(1); $(TAR) -xf - )
endef

define Package/ruby-zlib/install
	( cd $(PKG_INSTALL_DIR); $(TAR) -cf - \
		usr/lib/ruby/1.8/*/zlib.so \
	) | ( cd $(1); $(TAR) -xf - )
endef

$(eval $(call BuildPackage,ruby))
$(eval $(call BuildPackage,libruby))
$(eval $(call BuildPackage,ruby-core))
$(eval $(call BuildPackage,ruby-cgi))
$(eval $(call BuildPackage,ruby-erb))
$(eval $(call BuildPackage,ruby-gdbm))
$(eval $(call BuildPackage,ruby-irb))
$(eval $(call BuildPackage,ruby-ncurses))
$(eval $(call BuildPackage,ruby-nkf))
$(eval $(call BuildPackage,ruby-openssl))
$(eval $(call BuildPackage,ruby-rdoc))
$(eval $(call BuildPackage,ruby-readline))
$(eval $(call BuildPackage,ruby-rexml))
$(eval $(call BuildPackage,ruby-rss))
$(eval $(call BuildPackage,ruby-soap))
$(eval $(call BuildPackage,ruby-unit))
$(eval $(call BuildPackage,ruby-webrick))
$(eval $(call BuildPackage,ruby-wsdl))
$(eval $(call BuildPackage,ruby-xmlrpc))
$(eval $(call BuildPackage,ruby-xsd))
$(eval $(call BuildPackage,ruby-yaml))
$(eval $(call BuildPackage,ruby-zlib))

$(eval $(call RequireCommand,ruby, \
        $(PKG_NAME) requires ruby installed on the host-system. \
))

