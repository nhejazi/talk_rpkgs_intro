TITLE = rpkgs_intro

.PHONY : all
all: deck web clean

deck:
	Rscript -e "rmarkdown::render('$(TITLE).Rmd')"

web:
	rsync -a --exclude='.git/' --chmod=go+r "$(pwd -P)" \
	  nhejazi@arwen.berkeley.edu:/mirror/data/pub/users/nhejazi/present/2020_$(TITLE)/

clean:
	rm *.html
