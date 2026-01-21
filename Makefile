TEX_DEBUG?=
ifeq ($(TEX_DEBUG),1)
    $(warning ***** starting Makefile for goal(s) "$(MAKECMDGOALS)")
    $(warning ***** $(shell date))
else
    MAKEFLAGS += -s
endif

MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --warn-undefined-variables

# Source files
TEX_SRC_DIR ?= src
TEX_INPUT ?= resume.tex
TEX_SRC := $(TEX_SRC_DIR)/$(TEX_INPUT)
TEX_OUT_DIR ?= build
TEX_OUTPUT ?= resume.pdf
TEX_OUT := $(TEX_OUT_DIR)/$(TEX_OUTPUT)
TEX_BUILD_ARTIFACT := $(TEX_OUT_DIR)/resume.pdf

# tectonic options
TECTONIC_OPTIONS := --outfmt pdf --outdir $(TEX_OUT_DIR)

ifeq ($(TEX_DEBUG),1)
	TECTONIC_OPTIONS += --keep-intermediates --keep-logs
endif

.PHONY: all
all: $(TEX_BUILD_ARTIFACT)
	@if [[ "$(TEX_BUILD_ARTIFACT)" != "$(TEX_OUT)" ]]; then \
		cp "$(TEX_BUILD_ARTIFACT)" "$(TEX_OUT)"; \
	fi
	@echo "PDF generated: $(TEX_OUT)"

$(TEX_OUT_DIR):
	@mkdir -p $(TEX_OUT_DIR)

$(TEX_BUILD_ARTIFACT): $(TEX_SRC) | $(TEX_OUT_DIR)
	@tectonic -X compile $(TEX_SRC) $(TECTONIC_OPTIONS)

.PHONY: clean
clean:
	@rm -rf $(TEX_OUT_DIR)
