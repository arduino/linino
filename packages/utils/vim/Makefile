#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=vim
PKG_VERSION:=7.1
PKG_RELEASE:=3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=ftp://ftp.vim.org/pub/vim/unix/
PKG_MD5SUM:=44c6b4914f38d6f9aa959640b89da329

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)71

include $(INCLUDE_DIR)/package.mk

define Package/vim/Default
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libncurses
  TITLE:=Vi IMproved - enhanced vi editor
  URL:=http://www.vim.org/
  SUBMENU:=Editors
endef

define Package/vim
  $(call Package/vim/Default)
  TITLE+= (Tiny)
endef

define Package/vim-full
  $(call Package/vim/Default)
  TITLE+= (Normal)
endef

define Package/vim-runtime
  $(call Package/vim/Default)
  TITLE+= (runtime files)
endef

define Package/vim-help
  $(call Package/vim/Default)
  TITLE+= (help files)
endef

define Package/vim-full/conffiles
/usr/share/vim/vimrc
endef

define Package/vim/conffiles
/usr/share/vim/vimrc
endef

define Package/vim/description
	Vim is an almost compatible version of the UNIX editor Vi.
	(Tiny build)
endef

define Package/vim-full/description
	Vim is an almost compatible version of the UNIX editor Vi.
	(Normal build)
endef

define Package/vim-runtime/description
	Vim is an almost compatible version of the UNIX editor Vi.
	(Runtime files)
endef

define Package/vim-help/description
	Vim is an almost compatible version of the UNIX editor Vi.
	(Help files)
endef
	

CONFIGURE_ARGS += \
	--disable-gui \
	--disable-gtktest \
	--disable-xim \
	--without-x \
	--disable-multibyte \
	--disable-netbeans \
	--disable-cscope \
	--disable-gpm \
	--with-tlib=ncurses

ifneq ($(CONFIG_PACKAGE_vim),)
define Build/Compile/vim
	$(call Build/Configure/Default, \
	  --with-features=tiny \
	 )
	$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(MAKE) -C $(PKG_BUILD_DIR) \
	  DESTDIR="$(PKG_INSTALL_DIR)" \
	  all
	$(CP) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(PKG_BUILD_DIR)/vim_tiny
endef
endif

ifneq ($(CONFIG_PACKAGE_vim-full),)
define Build/Compile/vim-full
	$(call Build/Configure/Default, \
	  --with-features=normal \
	)
	$(MAKE) -C $(PKG_BUILD_DIR) clean
	$(MAKE) -C $(PKG_BUILD_DIR) \
	  DESTDIR="$(PKG_INSTALL_DIR)" \
	  all
	$(CP) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(PKG_BUILD_DIR)/vim_normal
endef
endif    

define Build/Compile/vim-runtime
	$(MAKE) -C $(PKG_BUILD_DIR)/src DESTDIR="$(PKG_INSTALL_DIR)" installrtbase
	tar -czf $(PKG_BUILD_DIR)/docs.tgz $(PKG_INSTALL_DIR)/usr/share/vim/vim*/doc 
	rm -rf $(PKG_INSTALL_DIR)/usr/share/vim/vim*/doc
	rm -rf $(PKG_INSTALL_DIR)/usr/man
endef

define Build/Configure
endef

define Build/Compile
$(call Build/Compile/vim)
$(call Build/Compile/vim-full)
$(call Build/Compile/vim-runtime)
endef

define Package/vim/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/vim_tiny $(1)/usr/bin/vim
	$(INSTALL_DIR) $(1)/usr/share/vim
	$(INSTALL_CONF) ./files/vimrc $(1)/usr/share/vim/
endef


define Package/vim-full/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/vim_normal $(1)/usr/bin/vim
	$(INSTALL_DIR) $(1)/usr/share/vim
	$(INSTALL_CONF) ./files/vimrc.full $(1)/usr/share/vim/vimrc
endef

define Package/vim-runtime/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
	rm -rf $(1)/usr/share/vim/vim*/doc
endef

define Package/vim-help/install
	tar -C $(1) -xzf $(PKG_BUILD_DIR)/docs.tgz 
endef

$(eval $(call BuildPackage,vim))
$(eval $(call BuildPackage,vim-full))
$(eval $(call BuildPackage,vim-runtime))
$(eval $(call BuildPackage,vim-help))

