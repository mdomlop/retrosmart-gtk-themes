THEMENAME='retrosmart'
SRCDIR='src'
OUTDIR='.'
PREFIX='/usr'
INSTALLDIR=$(PREFIX)'/share/themes'

retrosmart-gtk-themes:
	mkdir $(OUTDIR)'/retrosmart-gtk-themes' || exit 1
	cp -r $(SRCDIR)/$(THEMENAME)-*/ $(OUTDIR)/$(THEMENAME)-gtk-themes/

install: uninstall retrosmart-gtk-themes
	cp -r $(OUTDIR)/$(THEMENAME)-gtk-themes/* $(INSTALLDIR)
	chown -R root:root $(INSTALLDIR)/$(THEMENAME)-*/gtk-*/
	chmod -R u=rwX,go=rX $(INSTALLDIR)/$(THEMENAME)-*/gtk-*/

uninstall:
	rm -Rf $(INSTALLDIR)/$(THEMENAME)-*/gtk-*/

clean:
	rm -Rf $(OUTDIR)/$(THEMENAME)-gtk-themes

