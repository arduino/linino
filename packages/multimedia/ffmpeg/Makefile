#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ffmpeg
PKG_VERSION:=0.8.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://ffmpeg.org/releases/
PKG_MD5SUM:=967d481c98161582d149aced6e3b2f31

FFMPEG_ENCODERS:= \
	ac3 \
	jpegls \
	mpeg1video \
	mpeg2video \
	mpeg4 \
	pcm_s16be \
	pcm_s16le \
	png \
	vorbis \
	zlib \

FFMPEG_DECODERS:= \
	aac \
	ac3 \
	atrac3 \
	flac \
	gif \
	h264 \
	jpegls \
	mp2 \
	mp3 \
	mpeg1video \
	mpeg2video \
	mpeg4 \
	mpegvideo \
	pcm_s16be \
	pcm_s16le \
	png \
	vorbis \
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
	ogg \
	rtp \

FFMPEG_DEMUXERS:= \
	aac \
	ac3 \
	avi \
	flac \
	ffm \
	h264 \
	matroska \
	mov \
	mp3 \
	mpegps \
	mpegts \
	mpegvideo \
	ogg \
	rm \
	rtsp \
	sdp \
	v4l2 \

FFMPEG_PARSERS:= \
	aac \
	ac3 \
	h264 \
	mpegaudio \
	mpeg4video \
	mpegvideo \

FFMPEG_PROTOCOLS:= \
	file http pipe rtp tcp udp

PKG_CONFIG_DEPENDS:= \
	$(patsubst %,CONFIG_FFMPEG_ENCODER_%,$(FFMPEG_ENCODERS)) \
	$(patsubst %,CONFIG_FFMPEG_DECODER_%,$(FFMPEG_DECODERS)) \
	$(patsubst %,CONFIG_FFMPEG_MUXER_%,$(FFMPEG_DEMUXERS)) \
	$(patsubst %,CONFIG_FFMPEG_DEMUXER_%,$(FFMPEG_DEMUXERS)) \
	$(patsubst %,CONFIG_FFMPEG_PARSER_%,$(FFMPEG_PARSERS)) \
	$(patsubst %,CONFIG_FFMPEG_PROTOCOL_%,$(FFMPEG_PROTOCOLS))

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
 DEPENDS+= +libpthread +libffmpeg +libpostproc +libswscale
endef

define Package/ffmpeg/description
$(call Package/ffmpeg/Default/description)
 .
 This package contains the FFmpeg command line tool.
endef

define Package/ffprobe
$(call Package/ffmpeg/Default)
 SECTION:=multimedia
 CATEGORY:=Multimedia
 TITLE+= CLI media identifier
 DEPENDS+= +libffmpeg
endef

define Package/ffprobe/description
$(call Package/ffmpeg/Default/description)
 .
 This package contains the FFprobe command line tool.
endef

define Package/ffserver
$(call Package/ffserver/Default)
 SECTION:=multimedia
 CATEGORY:=Multimedia
 TITLE+= streaming server
 DEPENDS+= +libpthread +libffmpeg +@FFMPEG_FFSERVER_SUPPORT
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
 DEPENDS+= +libpthread +zlib
 MENU:=1
endef

define Package/libffmpeg/config
source "$(SOURCE)/Config.in"
endef

define Package/libffmpeg/description
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

define Package/libswscale
 SECTION:=libs
 CATEGORY:=Libraries
 TITLE:=libswscale
 URL:=http://ffmpeg.mplayerhq.hu/
 DEPENDS:=+libffmpeg
endef

FILTER_CONFIG= \
	$(foreach c, $(3), \
		$(if $(CONFIG_FFMPEG_$(1)_$(c)),--enable-$(2)="$(c)") \
	)

FFMPEG_CONFIGURE_ENCODERS:=$(call FILTER_CONFIG,ENCODER,encoder,$(FFMPEG_ENCODERS))
FFMPEG_CONFIGURE_DECODERS:=$(call FILTER_CONFIG,DECODER,decoder,$(FFMPEG_DECODERS))
FFMPEG_CONFIGURE_MUXERS:=$(call FILTER_CONFIG,MUXER,muxer,$(FFMPEG_MUXERS))
FFMPEG_CONFIGURE_DEMUXERS:=$(call FILTER_CONFIG,DEMUXER,demuxer,$(FFMPEG_DEMUXERS))
FFMPEG_CONFIGURE_PARSERS:=$(call FILTER_CONFIG,PARSER,parser,$(FFMPEG_PARSERS))
FFMPEG_CONFIGURE_PROTOCOLS:=$(call FILTER_CONFIG,PROTOCOL,protocol,$(FFMPEG_PROTOCOLS))

ifneq ($(CONFIG_TARGET_x86),)
  TARGET_CFLAGS += -fomit-frame-pointer
endif

# XXX: add --disable-mmx & --disable-mmx2 to fix build failure on x86
# libpostproc/postprocess_template.c:2195: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'
# libpostproc/postprocess_template.c:3124: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'
# libpostproc/postprocess_template.c:3207: error: can't find a register in class 'GENERAL_REGS' while reloading 'asm'

define Build/Configure
	# this is *NOT* GNU configure
	( cd $(PKG_BUILD_DIR); \
		CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(FPIC)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		./configure \
		--enable-cross-compile \
		--cross-prefix="$(TARGET_CROSS)" \
		--arch="$(ARCH)" \
		--target-os=linux \
		--prefix="/usr" \
		--enable-shared \
		--enable-static \
		--disable-debug \
		\
		--enable-gpl \
		--enable-version3 \
		\
		--disable-doc \
		--disable-dxva2 \
		--disable-mmx \
		--disable-mmx2 \
		--enable-pthreads \
		--disable-optimizations \
		--enable-small \
		--disable-stripping \
		--enable-zlib \
		--enable-postproc \
		--enable-swscale \
		\
		--disable-bsfs \
		--disable-devices \
		--disable-filters \
		--disable-hwaccels \
		--disable-parsers \
		--disable-protocols \
		$(if $(CONFIG_FFMPEG_ENCODE),,--disable-encoders --disable-muxers) \
		$(if $(CONFIG_FFMPEG_DECODE),,--disable-decoders --disable-demuxers) \
		$(FFMPEG_CONFIGURE_ENCODERS) \
		$(FFMPEG_CONFIGURE_DECODERS) \
		$(FFMPEG_CONFIGURE_MUXERS) \
		$(FFMPEG_CONFIGURE_DEMUXERS) \
		$(FFMPEG_CONFIGURE_PARSERS) \
		$(FFMPEG_CONFIGURE_PROTOCOLS) \
		\
		$(if $(CONFIG_PACKAGE_ffmpeg),,--disable-ffmpeg) \
		--disable-ffplay \
		$(if $(CONFIG_PACKAGE_ffprobe),,--disable-ffprobe) \
		$(if $(CONFIG_PACKAGE_ffserver),,--disable-ffserver) \
		\
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
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libswscale.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libav{codec,device,format,util}.pc $(1)/usr/lib/pkgconfig/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libpostproc.pc $(1)/usr/lib/pkgconfig/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libswscale.pc $(1)/usr/lib/pkgconfig/
endef

define Package/ffmpeg/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ffmpeg $(1)/usr/bin/
endef

define Package/ffprobe/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/ffprobe $(1)/usr/bin/
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

define Package/libswscale/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libswscale.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,ffmpeg))
$(eval $(call BuildPackage,ffprobe))
$(eval $(call BuildPackage,ffserver))
$(eval $(call BuildPackage,libffmpeg))
$(eval $(call BuildPackage,libpostproc))
$(eval $(call BuildPackage,libswscale))
