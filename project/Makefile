.PHONY := help
.DEFAULT_GOAL := help

# Directory structure
BINDIR := bin
LIBDIR := lib
MANDIR := man
WIKIDIR := wiki

# List scripts and libraries
ifneq ($(wildcard $(BINDIR)/),)
SCRIPTS := $(sort $(shell find $(BINDIR) -type f -executable 2>/dev/null | sed "s/^$(BINDIR)\///"))
endif
ifneq ($(wildcard $(LIBDIR)/),)
LIBRARIES := $(sort $(shell find $(LIBDIR) -name '*.sh' 2>/dev/null | sed "s/^$(LIBDIR)\///"))
endif

# Deduce manpages names from scripts and libraries
MANPAGES := $(addprefix $(MANDIR)/,$(addsuffix .1,$(SCRIPTS)) $(addsuffix .3,$(LIBRARIES)))


all: check test ## Run quality and unit tests.

$(MANDIR)/%.1: $(BINDIR)/%
	shellman -tmanpage $< -o $@

$(MANDIR)/%.sh.3: $(LIBDIR)/%.sh
	shellman -tmanpage $< -o $@

man: $(MANPAGES) ## Generate man pages.

doc: man ## Generate man pages.

readme: templates/readme*  ## Generate the README.
	jinja2 templates/readme.md cookiecutterrc.yml > README.md 2>/dev/null

check-quality: ## Run the style tests.
	bats tests/quality/test_shellcheck.bats

check-docs: ## Run the documentation tests.
	bats tests/quality/test_shellman.bats

check: ## Run the quality tests.
	bats tests/quality/*.bats

test: ## Run the unit tests.
	cover $(shell type bats | cut -d' ' -f3-) tests/*.bats

help: ## Print this help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort
