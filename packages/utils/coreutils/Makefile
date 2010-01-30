#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=coreutils
PKG_VERSION:=7.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/coreutils
PKG_MD5SUM:=427c2914d3eab956f317c9ec6a45e62a

include $(INCLUDE_DIR)/package.mk

define Package/coreutils
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=The GNU core utilities
  URL:=http://www.gnu.org/software/coreutils/
endef
	
define Package/coreutils/description
	Full versions of standard GNU utilities.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
        sufficient and much smaller.
endef

CONFIGURE_VARS += \
	gl_cv_func_mbrtowc_incomplete_state=yes \
	gl_cv_func_mbrtowc_retval=yes \
	gl_cv_func_wcrtomb_retval=yes

CONFIGURE_ARGS += \
	--enable-install-program=su

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		SHELL="/bin/bash" \
		all install install-root
endef

define Package/coreutils/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef

define Package/coreutils-base64
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility base64 from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-base64/description
	Full version of standard GNU base64 utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-base64/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/base64 $(1)/usr/bin/
endef

define Package/coreutils-basename
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility basename from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-basename/description
	Full version of standard GNU basename utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-basename/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/basename $(1)/usr/bin/
endef

define Package/coreutils-cat
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility cat from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-cat/description
	Full version of standard GNU cat utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-cat/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/cat $(1)/usr/bin/
endef

define Package/coreutils-chcon
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility chcon from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-chcon/description
	Full version of standard GNU chcon utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-chcon/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/chcon $(1)/usr/bin/
endef

define Package/coreutils-chgrp
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility chgrp from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-chgrp/description
	Full version of standard GNU chgrp utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-chgrp/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/chgrp $(1)/usr/bin/
endef

define Package/coreutils-chmod
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility chmod from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-chmod/description
	Full version of standard GNU chmod utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-chmod/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/chmod $(1)/usr/bin/
endef

define Package/coreutils-chown
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility chown from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-chown/description
	Full version of standard GNU chown utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-chown/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/chown $(1)/usr/bin/
endef

define Package/coreutils-chroot
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility chroot from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-chroot/description
	Full version of standard GNU chroot utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-chroot/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/chroot $(1)/usr/bin/
endef

define Package/coreutils-cksum
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility cksum from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-cksum/description
	Full version of standard GNU cksum utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-cksum/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/cksum $(1)/usr/bin/
endef

define Package/coreutils-comm
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility comm from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-comm/description
	Full version of standard GNU comm utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-comm/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/comm $(1)/usr/bin/
endef

define Package/coreutils-cp
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility cp from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-cp/description
	Full version of standard GNU cp utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-cp/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/cp $(1)/usr/bin/
endef

define Package/coreutils-csplit
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility csplit from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-csplit/description
	Full version of standard GNU csplit utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-csplit/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/csplit $(1)/usr/bin/
endef

define Package/coreutils-cut
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility cut from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-cut/description
	Full version of standard GNU cut utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-cut/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/cut $(1)/usr/bin/
endef

define Package/coreutils-date
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility date from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-date/description
	Full version of standard GNU date utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-date/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/date $(1)/usr/bin/
endef

define Package/coreutils-dd
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility dd from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-dd/description
	Full version of standard GNU dd utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-dd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/dd $(1)/usr/bin/
endef

define Package/coreutils-dir
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility dir from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-dir/description
	Full version of standard GNU dir utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-dir/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/dir $(1)/usr/bin/
endef

define Package/coreutils-dircolors
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility dircolors from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-dircolors/description
	Full version of standard GNU dircolors utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-dircolors/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/dircolors $(1)/usr/bin/
endef

define Package/coreutils-dirname
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility dirname from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-dirname/description
	Full version of standard GNU dirname utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-dirname/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/dirname $(1)/usr/bin/
endef

define Package/coreutils-du
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility du from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-du/description
	Full version of standard GNU du utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-du/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/du $(1)/usr/bin/
endef

define Package/coreutils-echo
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility echo from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-echo/description
	Full version of standard GNU echo utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-echo/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/echo $(1)/usr/bin/
endef

define Package/coreutils-env
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility env from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-env/description
	Full version of standard GNU env utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-env/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/env $(1)/usr/bin/
endef

define Package/coreutils-expand
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility expand from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-expand/description
	Full version of standard GNU expand utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-expand/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/expand $(1)/usr/bin/
endef

define Package/coreutils-expr
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility expr from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-expr/description
	Full version of standard GNU expr utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-expr/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/expr $(1)/usr/bin/
endef

define Package/coreutils-factor
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility factor from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-factor/description
	Full version of standard GNU factor utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-factor/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/factor $(1)/usr/bin/
endef

define Package/coreutils-false
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility false from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-false/description
	Full version of standard GNU false utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-false/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/false $(1)/usr/bin/
endef

define Package/coreutils-fmt
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility fmt from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-fmt/description
	Full version of standard GNU fmt utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-fmt/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/fmt $(1)/usr/bin/
endef

define Package/coreutils-fold
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility fold from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-fold/description
	Full version of standard GNU fold utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-fold/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/fold $(1)/usr/bin/
endef

define Package/coreutils-groups
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility groups from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-groups/description
	Full version of standard GNU groups utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-groups/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/groups $(1)/usr/bin/
endef

define Package/coreutils-head
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility head from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-head/description
	Full version of standard GNU head utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-head/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/head $(1)/usr/bin/
endef

define Package/coreutils-hostid
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility hostid from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-hostid/description
	Full version of standard GNU hostid utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-hostid/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/hostid $(1)/usr/bin/
endef

define Package/coreutils-id
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility id from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-id/description
	Full version of standard GNU id utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-id/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/id $(1)/usr/bin/
endef

define Package/coreutils-install
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility install from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-install/description
	Full version of standard GNU install utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-install/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/install $(1)/usr/bin/
endef

define Package/coreutils-join
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility join from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-join/description
	Full version of standard GNU join utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-join/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/join $(1)/usr/bin/
endef

define Package/coreutils-kill
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility kill from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-kill/description
	Full version of standard GNU kill utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-kill/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/kill $(1)/usr/bin/
endef

define Package/coreutils-link
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility link from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-link/description
	Full version of standard GNU link utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-link/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/link $(1)/usr/bin/
endef

define Package/coreutils-ln
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility ln from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-ln/description
	Full version of standard GNU ln utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-ln/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ln $(1)/usr/bin/
endef

define Package/coreutils-logname
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility logname from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-logname/description
	Full version of standard GNU logname utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-logname/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/logname $(1)/usr/bin/
endef

define Package/coreutils-ls
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility ls from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-ls/description
	Full version of standard GNU ls utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-ls/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ls $(1)/usr/bin/
endef

define Package/coreutils-md5sum
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility md5sum from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-md5sum/description
	Full version of standard GNU md5sum utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-md5sum/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/md5sum $(1)/usr/bin/
endef

define Package/coreutils-mkdir
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility mkdir from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-mkdir/description
	Full version of standard GNU mkdir utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-mkdir/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mkdir $(1)/usr/bin/
endef

define Package/coreutils-mkfifo
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility mkfifo from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-mkfifo/description
	Full version of standard GNU mkfifo utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-mkfifo/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mkfifo $(1)/usr/bin/
endef

define Package/coreutils-mknod
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility mknod from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-mknod/description
	Full version of standard GNU mknod utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-mknod/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mknod $(1)/usr/bin/
endef

define Package/coreutils-mktemp
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility mktemp from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-mktemp/description
	Full version of standard GNU mktemp utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-mktemp/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mktemp $(1)/usr/bin/
endef

define Package/coreutils-mv
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility mv from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-mv/description
	Full version of standard GNU mv utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-mv/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/mv $(1)/usr/bin/
endef

define Package/coreutils-nice
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility nice from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-nice/description
	Full version of standard GNU nice utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-nice/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nice $(1)/usr/bin/
endef

define Package/coreutils-nl
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility nl from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-nl/description
	Full version of standard GNU nl utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-nl/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nl $(1)/usr/bin/
endef

define Package/coreutils-nohup
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility nohup from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-nohup/description
	Full version of standard GNU nohup utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-nohup/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/nohup $(1)/usr/bin/
endef

define Package/coreutils-od
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility od from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-od/description
	Full version of standard GNU od utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-od/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/od $(1)/usr/bin/
endef

define Package/coreutils-paste
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility paste from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-paste/description
	Full version of standard GNU paste utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-paste/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/paste $(1)/usr/bin/
endef

define Package/coreutils-pathchk
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility pathchk from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-pathchk/description
	Full version of standard GNU pathchk utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-pathchk/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/pathchk $(1)/usr/bin/
endef

define Package/coreutils-pinky
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility pinky from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-pinky/description
	Full version of standard GNU pinky utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-pinky/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/pinky $(1)/usr/bin/
endef

define Package/coreutils-pr
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility pr from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-pr/description
	Full version of standard GNU pr utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-pr/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/pr $(1)/usr/bin/
endef

define Package/coreutils-printenv
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility printenv from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-printenv/description
	Full version of standard GNU printenv utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-printenv/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/printenv $(1)/usr/bin/
endef

define Package/coreutils-printf
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility printf from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-printf/description
	Full version of standard GNU printf utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-printf/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/printf $(1)/usr/bin/
endef

define Package/coreutils-ptx
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility ptx from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-ptx/description
	Full version of standard GNU ptx utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-ptx/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ptx $(1)/usr/bin/
endef

define Package/coreutils-pwd
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility pwd from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-pwd/description
	Full version of standard GNU pwd utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-pwd/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/pwd $(1)/usr/bin/
endef

define Package/coreutils-readlink
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility readlink from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-readlink/description
	Full version of standard GNU readlink utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-readlink/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/readlink $(1)/usr/bin/
endef

define Package/coreutils-rm
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility rm from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-rm/description
	Full version of standard GNU rm utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-rm/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/rm $(1)/usr/bin/
endef

define Package/coreutils-rmdir
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility rmdir from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-rmdir/description
	Full version of standard GNU rmdir utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-rmdir/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/rmdir $(1)/usr/bin/
endef

define Package/coreutils-runcon
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility runcon from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-runcon/description
	Full version of standard GNU runcon utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-runcon/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/runcon $(1)/usr/bin/
endef

define Package/coreutils-seq
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility seq from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-seq/description
	Full version of standard GNU seq utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-seq/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/seq $(1)/usr/bin/
endef

define Package/coreutils-sha1sum
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility sha1sum from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-sha1sum/description
	Full version of standard GNU sha1sum utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-sha1sum/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sha1sum $(1)/usr/bin/
endef

define Package/coreutils-sha224sum
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility sha224sum from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-sha224sum/description
	Full version of standard GNU sha224sum utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-sha224sum/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sha224sum $(1)/usr/bin/
endef

define Package/coreutils-sha256sum
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility sha256sum from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-sha256sum/description
	Full version of standard GNU sha256sum utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-sha256sum/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sha256sum $(1)/usr/bin/
endef

define Package/coreutils-sha384sum
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility sha384sum from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-sha384sum/description
	Full version of standard GNU sha384sum utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-sha384sum/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sha384sum $(1)/usr/bin/
endef

define Package/coreutils-sha512sum
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility sha512sum from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-sha512sum/description
	Full version of standard GNU sha512sum utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-sha512sum/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sha512sum $(1)/usr/bin/
endef

define Package/coreutils-shred
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility shred from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-shred/description
	Full version of standard GNU shred utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-shred/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/shred $(1)/usr/bin/
endef

define Package/coreutils-shuf
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility shuf from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-shuf/description
	Full version of standard GNU shuf utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-shuf/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/shuf $(1)/usr/bin/
endef

define Package/coreutils-sleep
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility sleep from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-sleep/description
	Full version of standard GNU sleep utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-sleep/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sleep $(1)/usr/bin/
endef

define Package/coreutils-sort
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility sort from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-sort/description
	Full version of standard GNU sort utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-sort/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sort $(1)/usr/bin/
endef

define Package/coreutils-split
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility split from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-split/description
	Full version of standard GNU split utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-split/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/split $(1)/usr/bin/
endef

define Package/coreutils-stat
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility stat from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-stat/description
	Full version of standard GNU stat utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-stat/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/stat $(1)/usr/bin/
endef

define Package/coreutils-stty
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility stty from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-stty/description
	Full version of standard GNU stty utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-stty/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/stty $(1)/usr/bin/
endef

define Package/coreutils-su
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility su from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-su/description
	Full version of standard GNU su utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-su/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/su $(1)/usr/bin/
endef

define Package/coreutils-sum
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility sum from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-sum/description
	Full version of standard GNU sum utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-sum/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sum $(1)/usr/bin/
endef

define Package/coreutils-sync
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility sync from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-sync/description
	Full version of standard GNU sync utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-sync/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/sync $(1)/usr/bin/
endef

define Package/coreutils-tac
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility tac from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-tac/description
	Full version of standard GNU tac utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-tac/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/tac $(1)/usr/bin/
endef

define Package/coreutils-tail
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility tail from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-tail/description
	Full version of standard GNU tail utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-tail/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/tail $(1)/usr/bin/
endef

define Package/coreutils-tee
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility tee from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-tee/description
	Full version of standard GNU tee utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-tee/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/tee $(1)/usr/bin/
endef

define Package/coreutils-test
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility test from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-test/description
	Full version of standard GNU test utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-test/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/test $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/[ $(1)/usr/bin/
endef

define Package/coreutils-timeout
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility timeout from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-timeout/description
	Full version of standard GNU timeout utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-timeout/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/timeout $(1)/usr/bin/
endef

define Package/coreutils-touch
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility touch from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-touch/description
	Full version of standard GNU touch utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-touch/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/touch $(1)/usr/bin/
endef

define Package/coreutils-tr
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility tr from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-tr/description
	Full version of standard GNU tr utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-tr/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/tr $(1)/usr/bin/
endef

define Package/coreutils-true
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility true from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-true/description
	Full version of standard GNU true utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-true/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/true $(1)/usr/bin/
endef

define Package/coreutils-truncate
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility truncate from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-truncate/description
	Full version of standard GNU truncate utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-truncate/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/truncate $(1)/usr/bin/
endef

define Package/coreutils-tsort
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility tsort from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-tsort/description
	Full version of standard GNU tsort utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-tsort/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/tsort $(1)/usr/bin/
endef

define Package/coreutils-tty
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility tty from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-tty/description
	Full version of standard GNU tty utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-tty/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/tty $(1)/usr/bin/
endef

define Package/coreutils-uname
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility uname from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-uname/description
	Full version of standard GNU uname utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-uname/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/uname $(1)/usr/bin/
endef

define Package/coreutils-unexpand
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility unexpand from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-unexpand/description
	Full version of standard GNU unexpand utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-unexpand/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/unexpand $(1)/usr/bin/
endef

define Package/coreutils-uniq
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility uniq from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-uniq/description
	Full version of standard GNU uniq utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-uniq/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/uniq $(1)/usr/bin/
endef

define Package/coreutils-unlink
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility unlink from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-unlink/description
	Full version of standard GNU unlink utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-unlink/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/unlink $(1)/usr/bin/
endef

define Package/coreutils-uptime
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility uptime from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-uptime/description
	Full version of standard GNU uptime utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-uptime/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/uptime $(1)/usr/bin/
endef

define Package/coreutils-users
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility users from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-users/description
	Full version of standard GNU users utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-users/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/users $(1)/usr/bin/
endef

define Package/coreutils-vdir
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility vdir from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-vdir/description
	Full version of standard GNU vdir utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-vdir/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/vdir $(1)/usr/bin/
endef

define Package/coreutils-wc
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility wc from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-wc/description
	Full version of standard GNU wc utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-wc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/wc $(1)/usr/bin/
endef

define Package/coreutils-who
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility who from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-who/description
	Full version of standard GNU who utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-who/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/who $(1)/usr/bin/
endef

define Package/coreutils-whoami
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility whoami from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-whoami/description
	Full version of standard GNU whoami utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-whoami/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/whoami $(1)/usr/bin/
endef

define Package/coreutils-yes
  SECTION:utils
  CATEGORY:=Utilities
  TITLE:=Utility yes from the GNU core utilites
  URL:=http://www.gnu.org/software/coreutils/
endef

define Package/coreutils-yes/description
	Full version of standard GNU yes utility.  Normally, you would not
	use this package, since the functionality in BusyBox is more than
	sufficient.
endef

define Package/coreutils-yes/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/yes $(1)/usr/bin/
endef

$(eval $(call BuildPackage,coreutils))
$(eval $(call BuildPackage,coreutils-base64))
$(eval $(call BuildPackage,coreutils-basename))
$(eval $(call BuildPackage,coreutils-cat))
$(eval $(call BuildPackage,coreutils-chcon))
$(eval $(call BuildPackage,coreutils-chgrp))
$(eval $(call BuildPackage,coreutils-chmod))
$(eval $(call BuildPackage,coreutils-chown))
$(eval $(call BuildPackage,coreutils-chroot))
$(eval $(call BuildPackage,coreutils-cksum))
$(eval $(call BuildPackage,coreutils-comm))
$(eval $(call BuildPackage,coreutils-cp))
$(eval $(call BuildPackage,coreutils-csplit))
$(eval $(call BuildPackage,coreutils-cut))
$(eval $(call BuildPackage,coreutils-date))
$(eval $(call BuildPackage,coreutils-dd))
$(eval $(call BuildPackage,coreutils-dir))
$(eval $(call BuildPackage,coreutils-dircolors))
$(eval $(call BuildPackage,coreutils-dirname))
$(eval $(call BuildPackage,coreutils-du))
$(eval $(call BuildPackage,coreutils-echo))
$(eval $(call BuildPackage,coreutils-env))
$(eval $(call BuildPackage,coreutils-expand))
$(eval $(call BuildPackage,coreutils-expr))
$(eval $(call BuildPackage,coreutils-factor))
$(eval $(call BuildPackage,coreutils-false))
$(eval $(call BuildPackage,coreutils-fmt))
$(eval $(call BuildPackage,coreutils-fold))
$(eval $(call BuildPackage,coreutils-groups))
$(eval $(call BuildPackage,coreutils-head))
$(eval $(call BuildPackage,coreutils-hostid))
$(eval $(call BuildPackage,coreutils-id))
$(eval $(call BuildPackage,coreutils-install))
$(eval $(call BuildPackage,coreutils-join))
$(eval $(call BuildPackage,coreutils-kill))
$(eval $(call BuildPackage,coreutils-link))
$(eval $(call BuildPackage,coreutils-ln))
$(eval $(call BuildPackage,coreutils-logname))
$(eval $(call BuildPackage,coreutils-ls))
$(eval $(call BuildPackage,coreutils-md5sum))
$(eval $(call BuildPackage,coreutils-mkdir))
$(eval $(call BuildPackage,coreutils-mkfifo))
$(eval $(call BuildPackage,coreutils-mknod))
$(eval $(call BuildPackage,coreutils-mktemp))
$(eval $(call BuildPackage,coreutils-mv))
$(eval $(call BuildPackage,coreutils-nice))
$(eval $(call BuildPackage,coreutils-nl))
$(eval $(call BuildPackage,coreutils-nohup))
$(eval $(call BuildPackage,coreutils-od))
$(eval $(call BuildPackage,coreutils-paste))
$(eval $(call BuildPackage,coreutils-pathchk))
$(eval $(call BuildPackage,coreutils-pinky))
$(eval $(call BuildPackage,coreutils-pr))
$(eval $(call BuildPackage,coreutils-printenv))
$(eval $(call BuildPackage,coreutils-printf))
$(eval $(call BuildPackage,coreutils-ptx))
$(eval $(call BuildPackage,coreutils-pwd))
$(eval $(call BuildPackage,coreutils-readlink))
$(eval $(call BuildPackage,coreutils-rm))
$(eval $(call BuildPackage,coreutils-rmdir))
$(eval $(call BuildPackage,coreutils-runcon))
$(eval $(call BuildPackage,coreutils-seq))
$(eval $(call BuildPackage,coreutils-sha1sum))
$(eval $(call BuildPackage,coreutils-sha224sum))
$(eval $(call BuildPackage,coreutils-sha256sum))
$(eval $(call BuildPackage,coreutils-sha384sum))
$(eval $(call BuildPackage,coreutils-sha512sum))
$(eval $(call BuildPackage,coreutils-shred))
$(eval $(call BuildPackage,coreutils-shuf))
$(eval $(call BuildPackage,coreutils-sleep))
$(eval $(call BuildPackage,coreutils-sort))
$(eval $(call BuildPackage,coreutils-split))
$(eval $(call BuildPackage,coreutils-stat))
$(eval $(call BuildPackage,coreutils-stty))
$(eval $(call BuildPackage,coreutils-su))
$(eval $(call BuildPackage,coreutils-sum))
$(eval $(call BuildPackage,coreutils-sync))
$(eval $(call BuildPackage,coreutils-tac))
$(eval $(call BuildPackage,coreutils-tail))
$(eval $(call BuildPackage,coreutils-tee))
$(eval $(call BuildPackage,coreutils-test))
$(eval $(call BuildPackage,coreutils-timeout))
$(eval $(call BuildPackage,coreutils-touch))
$(eval $(call BuildPackage,coreutils-tr))
$(eval $(call BuildPackage,coreutils-true))
$(eval $(call BuildPackage,coreutils-truncate))
$(eval $(call BuildPackage,coreutils-tsort))
$(eval $(call BuildPackage,coreutils-tty))
$(eval $(call BuildPackage,coreutils-uname))
$(eval $(call BuildPackage,coreutils-unexpand))
$(eval $(call BuildPackage,coreutils-uniq))
$(eval $(call BuildPackage,coreutils-unlink))
$(eval $(call BuildPackage,coreutils-uptime))
$(eval $(call BuildPackage,coreutils-users))
$(eval $(call BuildPackage,coreutils-vdir))
$(eval $(call BuildPackage,coreutils-wc))
$(eval $(call BuildPackage,coreutils-who))
$(eval $(call BuildPackage,coreutils-whoami))
$(eval $(call BuildPackage,coreutils-yes))
