#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

PYTHON_VERSION=2.5

PYTHON_DIR:=$(STAGING_DIR)/usr
PYTHON_BIN_DIR:=$(PYTHON_DIR)/bin
PYTHON_INC_DIR:=$(PYTHON_DIR)/include/python$(PYTHON_VERSION)
PYTHON_LIB_DIR:=$(PYTHON_DIR)/lib/python$(PYTHON_VERSION)

PYTHON:=python$(PYTHON_VERSION)

PYTHON_PKG_DIR:=/usr/lib/python$(PYTHON_VERSION)/site-packages

define PyPackage
  $(call shexport,PyPackage/$(1)/filespec)

  define Package/$(1)/install
	@getvar $$(call shvar,PyPackage/$(1)/filespec) | ( \
		IFS='|'; \
		while read fop fspec fperm; do \
		  if [ "$$$$$$$$fop" = "+" ]; then \
		    dpath=`dirname "$$$$$$$$fspec"`; \
		    if [ -n "$$$$$$$$fperm" ]; then \
		      dperm="-m$$$$$$$$fperm"; \
		    else \
		      dperm=`stat -c "%a" $(PKG_INSTALL_DIR)$$$$$$$$dpath`; \
		    fi; \
		    mkdir -p $$$$$$$$$dperm $$(1)$$$$$$$$dpath; \
		    echo "copying: '$$$$$$$$fspec'"; \
		    cp -fpR $(PKG_INSTALL_DIR)$$$$$$$$fspec $$(1)$$$$$$$$dpath/; \
		    if [ -n "$$$$$$$$fperm" ]; then \
		      chmod -R $$$$$$$$fperm $$(1)$$$$$$$$fspec; \
		    fi; \
		  elif [ "$$$$$$$$fop" = "-" ]; then \
		    echo "removing: '$$$$$$$$fspec'"; \
		    rm -fR $$(1)$$$$$$$$fspec; \
		  elif [ "$$$$$$$$fop" = "=" ]; then \
		    echo "setting permissions: '$$$$$$$$fperm' on '$$$$$$$$fspec'"; \
		    chmod -R $$$$$$$$fperm $$(1)$$$$$$$$fspec; \
		  fi; \
		done; \
	)
	$(call PyPackage/$(1)/install,$$(1))
  endef
endef

define Build/Compile/PyMod
	( cd $(PKG_BUILD_DIR)/$(1); \
		CFLAGS="$(TARGET_CFLAGS)" \
		CPPFLAGS="$(TARGET_CPPFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		$(3) \
		$(PYTHON) ./setup.py $(2); \
		find $(PKG_INSTALL_DIR) -name "*\.pyc" -o -name "*\.pyo" | xargs rm -f \
	);
endef
