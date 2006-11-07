# $Id$

include $(TOPDIR)/rules.mk

PKG_OS:=$(shell uname -s)
PKG_CPU:=$(shell uname -m)

PKG_RELEASE:=1
SDK_NAME:=OpenWrt-SDK-$(PKG_OS)-$(PKG_CPU)-$(PKG_RELEASE)

SDK_BUILD_DIR:=$(BUILD_DIR)/$(SDK_NAME)
IB_BUILD_DIR:=$(BUILD_DIR)/$(IB_NAME)

all: compile

$(BIN_DIR)/$(SDK_NAME).tar.bz2:
	(cd $(STAGING_DIR); \
		rm -rf info man share; \
		cd usr; \
		rm -rf doc info man share; \
	)
	rm -rf $(SDK_BUILD_DIR)
	mkdir -p $(SDK_BUILD_DIR)/dl $(SDK_BUILD_DIR)/examples $(SDK_BUILD_DIR)/package
	$(CP) $(STAGING_DIR) $(SCRIPT_DIR) $(TOPDIR)/docs $(SDK_BUILD_DIR)/
	$(CP) $(TOPDIR)/package/strace $(TOPDIR)/package/iproute2 $(SDK_BUILD_DIR)/examples
	cp $(TOPDIR)/package/rules.mk $(SDK_BUILD_DIR)/package/
	-$(CP) ./files/* $(SDK_BUILD_DIR)/
	egrep '^BR2_(ARCH|WGET|STAGING|JLEVEL|LARGEFILE|TARGET_OPT)' $(TOPDIR)/.config > $(SDK_BUILD_DIR)/.config
	egrep '^BR2_(ARCH|WGET|STAGING|JLEVEL|LARGEFILE|TARGET_OPT)' $(TOPDIR)/.config | sed -e s,BR2_,CONFIG_,g >> $(SDK_BUILD_DIR)/.config
	find $(SDK_BUILD_DIR) -name .svn | xargs rm -rf 
	find $(SDK_BUILD_DIR) -name CVS | xargs rm -rf 
	(cd $(BUILD_DIR); \
		tar cfj $@ $(SDK_NAME); \
	)

source:
prepare:
compile: $(BIN_DIR)/$(SDK_NAME).tar.bz2
install:

clean:
	rm -rf $(SDK_BUILD_DIR) $(BIN_DIR)/$(SDK_NAME).tar.bz2
