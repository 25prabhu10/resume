TEX_DEBUG?=
ifeq ($(TEX_DEBUG),1)
    $(warning ***** starting Makefile for goal(s) "$(MAKECMDGOALS)")
    $(warning ***** $(shell date))
else
    MAKEFLAGS += -s
endif

MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --warn-undefined-variables

# source files
TEX_SRC_DIR ?= src
TEX_INPUT ?= resume.tex
TEX_SRC := $(TEX_SRC_DIR)/$(TEX_INPUT)
TEX_OUT_DIR ?= build
TEX_OUTPUT ?= resume.pdf
TEX_OUT := $(TEX_OUT_DIR)/$(TEX_OUTPUT)
TEX_BUILD_ARTIFACT := $(TEX_OUT_DIR)/resume.pdf

# resume variants
VARIANTS ?= resume-dev resume-mgmt

# tectonic options
TECTONIC_OPTIONS := --outfmt pdf --outdir $(TEX_OUT_DIR)

# Linting and formatting
CHKTEX_OPTIONS := -q -wall -n3 -n22
LATEXINDENT_OPTIONS := -w
TEX_FILES := $(shell fd . $(TEX_SRC_DIR) -t f -e tex)
TEX_STY_FILES := $(shell fd . $(TEX_SRC_DIR)/styles -t f -e sty)

ifeq ($(TEX_DEBUG),1)
	$(warning ***** Debug mode enabled - preserving intermediate files and logs)
	TECTONIC_OPTIONS += --keep-intermediates --keep-logs
endif

.PHONY: all
all: $(TEX_BUILD_ARTIFACT)
	@if [[ -f "$(TEX_BUILD_ARTIFACT)" && "$(TEX_BUILD_ARTIFACT)" != "$(TEX_OUT)" ]]; then \
		mv "$(TEX_BUILD_ARTIFACT)" "$(TEX_OUT)"; \
	fi
	@echo "PDF generated: \"$(TEX_OUT)\""

$(TEX_OUT_DIR):
	@mkdir -p $(TEX_OUT_DIR)

$(TEX_BUILD_ARTIFACT): $(TEX_SRC) | $(TEX_OUT_DIR)
	@if [ ! -f "$(TEX_SRC)" ]; then \
		echo "Error: Source file $(TEX_SRC) not found"; \
		exit 1; \
	fi
	@tectonic -X compile $(TEX_SRC) $(TECTONIC_OPTIONS)

.PHONY: all-variants
all-variants: $(VARIANTS)

.PHONY: $(VARIANTS)
$(VARIANTS):
	@if [ ! -f "src/$@.tex" ]; then \
		echo "Error: Variant source file src/$@.tex not found"; \
		exit 1; \
	fi
	@$(MAKE) TEX_INPUT=$@.tex TEX_OUTPUT=$@.pdf

.PHONY: lint
lint:
	@echo "Running chktex and latexindent on LaTeX files..."
	@chktex $(CHKTEX_OPTIONS) $(TEX_FILES) $(TEX_STY_FILES)

.PHONY: format
format:
	@echo "Formatting LaTeX files with latexindent..."
	@latexindent $(LATEXINDENT_OPTIONS) $(TEX_FILES)

.PHONY: check-format
check-format:
	@echo "Checking LaTeX file formatting..."
	@latexindent --checkmode $(TEX_FILES)

.PHONY: check
check: lint check-format

.PHONY: clean
clean:
	@rm -rf $(TEX_OUT_DIR)
