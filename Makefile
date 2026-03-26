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
	rm output*/*.rds