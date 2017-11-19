BINDIR := bin
LIBDIR := lib
MANDIR := man
WIKIDIR := wiki

MANPAGES := $(addprefix $(MANDIR)/,{{cookiecutter.package_name}}.1 {{cookiecutter.package_name.replace('shellm-', '').replace('-', '_')}}.3)
WIKIPAGES := $(addprefix $(WIKIDIR)/,bin/{{cookiecutter.package_name}}.md lib/{{cookiecutter.package_name.replace('shellm-', '').replace('-', '_')}}.md)

all : doc

install :
	@./install.sh "${PREFIX:-/usr/local}"

$(MANDIR)/%.1 : $(BINDIR)/%
	@shellman --format man $< > $@

$(MANDIR)/%.3 : $(LIBDIR)/%.sh
	@shellman --format man $< > $@

$(WIKIDIR)/bin/%.md : $(BINDIR)/%
	@shellman --format markdown $< > $@

$(WIKIDIR)/lib/%.md : $(LIBDIR)/%.sh
	@shellman --format markdown $< > $@

man : $(MANPAGES)

wiki : $(WIKIPAGES)

doc : man wiki
