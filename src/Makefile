bin := $(ROOT)/bin
lib := $(ROOT)/lib

tools := planner recorder streamer

define declare_tool
$(bin)/$(1): $(shell find $(1)/src -name *.rs)
	@echo "Installing $(1)..."
	@cd $(1) && $(CARGO) build --release
	@cp $(1)/target/release/$(1) $$@
	@find $(1)/target/release/build   \
		-name lib*.$(LIBRARY_SUFFIX)* \
		-exec cp -a {} $(lib)/ \;

install: $(bin)/$(1)
endef

$(foreach tool,$(tools),$(eval $(call declare_tool,$(tool))))

clean:
	@rm -rf $(addsuffix /target,$(tools))
	@rm -f $(bin)/* $(lib)/*

.PHONY: install clean
