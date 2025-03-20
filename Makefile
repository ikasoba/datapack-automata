OUTDIR := dist

all: $(OUTDIR)/datapacks/automata.zip $(OUTDIR)/resourcepacks/automata.zip

$(OUTDIR):
	mkdir -p $(OUTDIR)

$(OUTDIR)/datapacks: $(OUTDIR)
	mkdir -p $(OUTDIR)/datapacks

$(OUTDIR)/datapacks/automata.zip: $(OUTDIR)/datapacks
	@cd datapacks/automata && zip -r ../../$(OUTDIR)/datapacks/automata.zip *

$(OUTDIR)/resourcepacks: $(OUTDIR)
	mkdir -p $(OUTDIR)/resourcepacks

$(OUTDIR)/resourcepacks/automata.zip: $(OUTDIR)/resourcepacks
	@cd resourcepacks/automata && zip -r ../../$(OUTDIR)/resourcepacks/automata.zip *

clean:
	rm -rf $(OUTDIR)
