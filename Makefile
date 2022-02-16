all:
	make slides.html
	make web

%.html: %.Rmd
	Rscript -e "rmarkdown::render('$^', output_format = 'xaringan::moon_reader')"

web:
	mv slides.html index.html
