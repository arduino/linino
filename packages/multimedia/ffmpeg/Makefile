#
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=ffmpeg
PKG_VERSION:=20080419
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-export-snapshot-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://downloads.openwrt.org/sources/
PKG_MD5SUM:=63aeb859941b96ed3ef7b0c7a643bf4d

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-export-2008-04-19

include $(INCLUDE_DIR)/package.mk

define Package/ffmpeg/Default
 TITLE:=FFmpeg
 URL:=http://ffmpeg.mplayerhq.hu/
endef

define Package/ffmpeg/Default/description
 FFmpeg is a a software package that can record, convert and stream digital 
 audio and video in numerous formats.
endef

define Package/ffmpeg
$(call Package/ffmpeg/Default)
 SECTION:=multimedia
 CATEGORY:=Multimedia
 TITLE+= program
 DEPENDS+= +libpthread +libffmpeg
endef

define Package/ffmpeg/description
$(call Package/ffmpeg/Default/description)
 .
 This package contains the FFmpeg command line tool.
endef

define Package/ffserver
$(call Package/ffserver/Default)
 SECTION:=multimedia
 CATEGORY:=Multimedia
 TITLE+= streaming server
 DEPENDS+= +libpthread +libffmpeg
endef

define Package/ffserver/description
$(call Package/ffmpeg/Default/description)
 .
 This package contains the FFmpeg streaming server.
endef

define Package/libffmpeg
$(call Package/ffmpeg/Default)
 SECTION:=libs
 CATEGORY:=Libraries
 TITLE+= libraries
 DEPENDS+= +libpthread +libfaad2 +zlib
 MENU:=1
endef

define Package/libffmpeg/config
		menu "Configuration"
				depends on PACKAGE_libffmpeg
		source "$(SOURCE)/Config.in"
		endmenu
endef

define Package/libffmeg/description
$(call Package/ffmpeg/Default/description)
 .
 This package contains FFmpeg shared libraries.
endef

define Package/libpostproc
 SECTION:=libs
 CATEGORY:=Libraries
 TITLE:=libpostproc
 URL:=http://ffmpeg.mplayerhq.hu/
 DEPENDS:=+libffmpeg
endef

FFMPEG_ENCODERS:= \
	ac3 \
	jpegls \
	mpeg1video \
	mpeg2video \
	mpeg4 \
	png \
	zlib \

FFMPEG_DECODERS:= \
	ac3 \
	atrac3 \
	gif \
	h264 \
	jpegls \
	mp3 \
	mpeg1video \
	mpeg2video \
	mpeg4 \
	mpeg4aac \
	mpegvideo \
	png \
	wmav1 \
	wmav2 \
	zlib \

FFMPEG_MUXERS:= \
	ac3 \
	ffm \
	h264 \
	mp3 \
	mp4 \
	mpeg1video \
	mpeg2video \
	mpegts \
	rtp \

FFMPEG_DEMUXERS:= \
	ac3 \
	ffm \
	h264 \
	mp3 \
	mpegps \
	mpegts \
	mpegvideo \
	rtsp \
	sdp \
	v4l2 \

FFMPEG_PARSERS:= \
	ac3 \
	h264 \
	mpegaudio \
	mpegvideo \
	mpeg4video \

FFMPEG_PROTOCOLS:= \
	file http pipe rtp tcp udp \

FFMPEG_CONFIGURE_ENCODERS:= \
	$(foreach c, $(FFMPEG_ENCODERS), \
		$(if $(CONFIG_FFMPEG_ENCODER_$(c)),--enable-encoder="$(c)") \
	)

FFMPEG_CONFIGURE_DECODERS:= \
	$(foreach c, $(FFMPEG_DECODERS), \
		$(if $(CONFIG_FFMPEG_DECODER_$(c)),--enable-decoder="$(c)") \
	)

FFMPEG_CONFIGURE_MUXERS:= \
	$(foreach c, $(FFMPEG_MUXERS), \
		$(if $(CONFIG_FFMPEG_MUXER_$(c)),--enable-muxer="$(c)") \
	)

FFMPEG_CONFIGURE_DEMUXERS:= \
	$(foreach c, $(FFMPEG_DEMUXERS), \
		$(if $(CONFIG_FFMPEG_DEMUXER_$(c)),--enable-demuxer="$(c)") \
	)

FFMPEG_CONFIGURE_PARSERS:= \
	$(foreach c, $(FFMPEG_PARSERS), \
		$(if $(CONFIG_FFMPEG_PARSER_$(c)),--enable-parser="$(c)") \
	)

FFMPEG_CONFIGURE_PROTOCOLS:= \
	$(foreach c, $(FFMPEG_PROTOCOLS), \
		$(if $(CONFIG_FFMPEG_PROTOCOL_$(c)),--enable-protocol="$(c)") \
	)

define Build/Configure
	# this is *NOT* GNU configure
	( cd $(PKG_BUILD_DIR); \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
		./configure \
		--enable-cross-compile \
		--cross-prefix="$(TARGET_CROSS)" \
		--arch="$(ARCH)" \
		--prefix="/usr" \
		--enable-shared \
		--enable-static \
		--disable-debug \
		--enable-ffmpeg \
		--enable-ffserver \
		--enable-gpl \
		--disable-ipv6 \
		--enable-libfaad \
		--enable-pthreads \
		--disable-optimizations \
		--enable-small \
		--disable-stripping \
		--disable-vhook \
		--enable-zlib \
		--enable-postproc \
		\
		--disable-encoders \
		$(FFMPEG_CONFIGURE_ENCODERS) \
		--disable-decoders \
		$(FFMPEG_CONFIGURE_DECODERS) \
		--disable-muxers \
		$(FFMPEG_CONFIGURE_MUXERS) \
		--disable-demuxers \
		$(FFMPEG_CONFIGURE_DEMUXERS) \
		--disable-parsers \
		$(FFMPEG_CONFIGURE_PARSERS) \
		--disable-bsfs \
		--disable-protocols \
		$(FFMPEG_CONFIGURE_PROTOCOLS) \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libav{codec,device,format,util} $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/libpostproc $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libav{codec,device,format,util}.{a,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpostproc.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libav{codec,device,format,util}.pc $(1)/usr/lib/pkgconfig/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libpostproc.pc $(1)/usr/lib/pkgconfig/
endef

define Package/ffmpeg/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ffmpeg $(1)/usr/bin/
endef

define Package/ffserver/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ffserver $(1)/usr/bin/
endef

define Package/libffmpeg/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libav{codec,device,format,util}.so.* $(1)/usr/lib/
endef

define Package/libpostproc/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpostproc.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,ffmpeg))
$(eval $(call BuildPackage,ffserver))
$(eval $(call BuildPackage,libffmpeg))
$(eval $(call BuildPackage,libpostproc))
