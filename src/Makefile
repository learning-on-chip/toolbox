bin := $(ROOT)/bin
lib := $(ROOT)/lib

tools := $(patsubst ./%,%,$(shell find . -maxdepth 1 ! -path . -type d))

install: $(tools)

$(tools): %: $(bin)/%

define declare_tool
$(bin)/$(1): $(shell find $(1)/src -name *.rs)
	@echo "Installing $(1)..."
	@mkdir -p $(bin)
	@mkdir -p $(lib)
	@cd $(1) && $(LIBRARY_VARIABLE)="$(LIBRARY_VARIABLE):$(RUST_PATH)/lib" $(CARGO) build --release
	@cp $(1)/target/release/$(1) $(bin)/
	@find $(1)/target/release/build -name lib*.$(LIBRARY_SUFFIC)* -exec cp {} $(lib)/ \;
endef

$(foreach tool,$(tools),$(eval $(call declare_tool,$(tool))))

clean:
	@rm -rf $(addsuffix /target,$(tools))
	@rm -f $(bin)/* $(lib)/*

.PHONY: install clean $(tools)
