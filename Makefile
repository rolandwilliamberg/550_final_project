# REPORT ASSOCIATED RULES (run in container)

report.html: code/04_render_report.R report.Rmd output/cleandataset.rds output/reporttable.rds output/reportfigure.rds
	Rscript code/04_render_report.R

output/cleandataset.rds: code/01_make_cleandataset.R
	Rscript code/01_make_cleandataset.R

output/reporttable.rds: code/02_make_reporttable.R output/cleandataset.rds
	Rscript code/02_make_reporttable.R

output/reportfigure.rds: code/03_make_reportfigure.R output/cleandataset.rds
	Rscript code/03_make_reportfigure.R

.PHONY: clean
clean:
	rm report/*.html
	rm buildfinalimage
	rm output/*.rds
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

# DOCKER ASSOCIATED RULES (run on local machine)

pullfinalimage:
	docker pull rolandberg/finalimage

buildfinalimage:
	docker build -t rolandberg/finalimage .
	touch $@

report/report.html:
	docker run -v "/$$(pwd)/report":/home/rstudio/project/report rolandberg/finalimage

