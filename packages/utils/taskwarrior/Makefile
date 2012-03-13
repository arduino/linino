#
# This is free software, licensed under the GNU General Public License v2.
#

include $(TOPDIR)/rules.mk
PKG_NAME:=taskwarrior
PKG_VERSION:=1.9.4
PKG_SOURCE:=task-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.taskwarrior.org/download/
PKG_BUILD_DIR:=$(BUILD_DIR)/task-$(PKG_VERSION)

PKG_RELEASE:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/taskwarrior
	MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
	TITLE:=Taskwarrior - command line task manager
	SECTION:=utils
	CATEGORY:=Utilities
	DEPENDS:=+libncurses
	URL:=http://taskwarrior.org/projects/show/taskwarrior
endef

define Package/taskwarrior/description
	Taskwarrior is an ambitious project to supercharge task with an interactive interface, GTD features, color themes, data synch, dependencies,
	custom reports, charts, and Lua plugins, all while our international team provides excellent support!
endef

define Package/taskwarrior/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/task $(1)/usr/bin/
endef

$(eval $(call BuildPackage,taskwarrior))
