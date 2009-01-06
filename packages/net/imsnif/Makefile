# 
# Copyright (C) 2008 OpenWrt.org
#
# $ Id:$

include $(TOPDIR)/rules.mk

PKG_NAME:=imsnif
PKG_VERSION:=0.04
PKG_RELEASE:=2
PKG_MD5SUM:=689c456f8edb77b9b4199a25514ac683

PKG_SOURCE_URL:=http://kent.dl.sourceforge.net/sourceforge/im-snif
PKG_SOURCE:=$(PKG_NAME)f_$(PKG_VERSION).tgz
PKG_CAT:=zcat

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL_DIR:=$(PKG_BUILD_DIR)/ipkg-install
PKG_UNPACK:=gzip -dc $(DL_DIR)/$(PKG_SOURCE) | $(TAR) -C $(PKG_BUILD_DIR) -xvf -

include $(INCLUDE_DIR)/package.mk

define Package/imsnif
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpcap +uclibcxx
  TITLE:=MSN Messenger sniffer
  URL:=http://sourceforge.net/projects/im-snif
endef

define Package/imsnif/description
  IMsnif is a simple program to log Instant Message activity
  on the network. It uses libpcap to capture packets and
  analyzes them, logging conversation, contact lists, etc.
endef

define Build/Compile
	$(TARGET_CROSS)g++ $(TARGET_CPPFLAGS) -fno-builtin -fno-rtti -nostdinc++ \
		-I$(STAGING_DIR)/usr/include/uClibc++ -I$(LINUX_DIR)/include \
		-o $(PKG_BUILD_DIR)/src/imsnif \
			$(PKG_BUILD_DIR)/src/imsniff.cpp \
			$(PKG_BUILD_DIR)/src/util.cpp \
			$(PKG_BUILD_DIR)/src/msn_conntrack.cpp \
			$(PKG_BUILD_DIR)/src/msn_handlers.cpp \
		-L$(STAGING_DIR)/usr/lib -nodefaultlibs -luClibc++ $(LIBGCC_S) -lpcap \
			$(PKG_BUILD_DIR)/src/pcap_stuff.cpp
endef

define Package/imsnif/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/docs/imsniff.conf.sample $(1)/etc/imsnif.conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/imsnif $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/imsnif $(1)/usr/bin
endef

$(eval $(call BuildPackage,imsnif))
