TEXFILES := $(wildcard *.tex)
EPSFILES := $(wildcard fig/*.eps)
OBJFILES := $(wildcard fig/*.obj)
PNGFILES := $(wildcard fig/*.png)
JPGFILES := $(wildcard fig/*.jpg)
# SVGFILES := $(wildcard fig/*.svg)
PSFILES  := $(wildcard fig/*.ps)
GPFILES  := $(wildcard fig/*.gp)
SVGFILES := $(patsubst %.obj,%.svg,$(OBJFILES))
EMFFILES := $(patsubst %.obj,%.emf,$(OBJFILES))

.SUFFIXES: .tex .ps .dvi .obj .eps .bib .png .jpg .svg .html .pdf .gp .svg .emf

.dvi.pdf:
	dvipdfmx -V 7 -p a4 -f texfonts.map $<
.dvi.ps:
	dvips $< -f > $@
.tex.dvi:
	platex --shell-escape -kanji=utf-8 $<
	pbibtex -kanji=utf-8 $*
	platex --shell-escape -kanji=utf-8 $<
	platex --shell-escape -kanji=utf-8 $<
.tex.html:
	latex2html -split 0 $<
.obj.eps:
	tgif -print -eps -color $<
.png.eps:
	convert $< $@
.jpg.eps:
	convert $< $@
.svg.eps:
	inkscape $< -T -z -E $@ 
.ps.eps:
	ps2eps $<
.gp.pdf:
	gnuplot $<
.eps.pdf:
	sed -e 's/FILENAME/$(basename $(subst /,\/,$<))/g' fig/template.tex > fig/tmp.tex
	latex fig/tmp.tex
	dvipdf tmp.dvi $@
	rm -f fit/tmp.tex
.pdf.svg:
	pdf2svg $< $@
.svg.emf:
	inkscape $< --export-emf=$@

all: thesis.pdf thesis.dvi # $(EMFFILES)
thesis.dvi: $(TEXFILES) $(EPSFILES) $(OBJFILES:.obj=.eps) $(PNGFILES:.png=.eps) $(JPGFILES:.jpg=.eps) $(SVGFILES:.svg=.eps) $(PSFILES:.ps=.eps) $(OBJFILES:.obj=.pdf) $(GPFILES:.gp=.pdf)
html: thesis.dvi $(TEXFILES:.tex=.html)
$(TEXFILES:.tex=.html):	$(TEXFILES) $(EPSFILES) $(OBJFILES:.obj=.eps)

clean:
	rm -fv *~ *.log *.bbl *.blg *.aux *.ps *.dvi *.toc *.html *.pdf *.lot *.lof

realclean: clean
	rm -f $(OBJFILES:.obj=.eps) $(OBJFILES:.obj=.pdf) $(SVGFILES:.svg=.eps) $(PNGFILES:.png=.eps) $(PSFILES:.ps=.eps) $(EMFFILES) $(GPFILES:.gp=.pdf) fig/tmp.tex tmp.pfg
