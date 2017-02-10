THEMENAME='retrosmart'
SUFFIX='-gtk-themes'
NAME=$(THEMENAME)$(SUFFIX)
SRCDIR='src'
OUTDIR='.'
PREFIX='/usr'
INSTALLDIR=$(PREFIX)'/share/themes'

$(NAME):
	mkdir $(OUTDIR)/$(NAME)
	cp -r $(SRCDIR)/$(THEMENAME)-*/ $(OUTDIR)/$(NAME)/

install:
	mkdir -p $(INSTALLDIR)
	cp -r $(OUTDIR)/$(NAME)/* $(INSTALLDIR)
	chown -R root:root $(INSTALLDIR)/$(THEMENAME)-gtk-*/
	chmod -R u=rwX,go=rX $(INSTALLDIR)/$(THEMENAME)-gtk-*/

uninstall:
	rm -Rf $(INSTALLDIR)/$(THEMENAME)-gtk-*/

clean:
	rm -Rf $(OUTDIR)/$(NAME)

purge: clean uninstall

togit:
	git add .
	git commit -m "Updated from makefile"
	git push origin
