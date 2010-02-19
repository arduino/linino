# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=curlftpfs
PKG_VERSION:=0.9.2
PKG_RELEASE:=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/curlftpfs
PKG_MD5SUM:=b452123f755114cd4461d56c648d9f12

PKG_BUILD_DEPENDS:=libiconv
PKG_FIXUP:=libtool

include $(INCLUDE_DIR)/package.mk

define Package/curlftpfs
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libcurl +libfuse +glib2
  TITLE:=CurlFtpFS
endef

define Package/curlftpfs/description
  CurlFtpFS is a filesystem for accessing FTP hosts
  based on FUSE and libcurl.
endef

EXTRA_CFLAGS += -I$(STAGING_DIR)/usr/lib/libiconv/include -DICONV_CONST=const

define Package/curlftpfs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/curlftpfs $(1)/usr/bin/
endef

$(eval $(call BuildPackage,curlftpfs))

