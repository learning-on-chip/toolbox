export ROOT := $(shell pwd)

ifeq ($(shell uname),Darwin)
export LIBRARY_VARIABLE = DYLD_LIBRARY_PATH
export LIBRARY_SUFFIC = dylib
else
export LIBRARY_VARIABLE = LD_LIBRARY_PATH
export LIBRARY_SUFFIC = so
endif

export CARGO ?= $(shell which cargo)
ifeq ($(CARGO),)
$(error Failed to find Cargo)
endif

export RUST_PATH ?= $(subst /bin/rustc,,$(shell which rustc))
ifeq ($(RUST_PATH),)
$(error Failed to find Rust)
endif

all: install
	@hash tput && tput setaf 2
	@echo 'Well done! Set your environment variables as follows:'
	@hash tput && tput sgr0
	@echo
	@echo 'export PATH="$(ROOT)/bin:$$PATH"'
	@echo 'export $(LIBRARY_VARIABLE)="$(ROOT)/lib:$$$(LIBRARY_VARIABLE)"'
	@echo
	@hash tput && tput setaf 2
	@echo 'Make sure that the native Rust libraries are accessible as well:'
	@hash tput && tput sgr0
	@echo
	@echo 'export $(LIBRARY_VARIABLE)="$(RUST_PATH)/lib:$$$(LIBRARY_VARIABLE)"'

clean install:
	@$(MAKE) -C src $@

update:
	git submodule init
	git submodule foreach git checkout master
	git submodule foreach git pull

.PHONY: all clean install update
