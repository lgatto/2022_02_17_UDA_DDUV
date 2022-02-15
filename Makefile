all:
	make slides.html
	make web

%.html: %.Rmd
	Rscript -e "rmarkdown::render('$^', output_format = 'xaringan::moon_reader')"

web:
	cp slides.html ./docs/index.html
	cp xaringan-themer.css ./docs/.
	cp -r slides_files ./docs/.

clean:
	rm *.html xaringan-themer.css
	rm -r *_files
