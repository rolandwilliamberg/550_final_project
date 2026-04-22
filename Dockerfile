FROM rocker/tidyverse:4.5.1 as base

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN Rscript -e "renv::restore(prompt = FALSE)"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/tidyverse:4.5.1

RUN mkdir /home/rstudio/project

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

COPY Makefile .
COPY report.Rmd .
COPY README.md .

RUN mkdir code
RUN mkdir data
RUN mkdir output
RUN mkdir report

COPY data/data550_final_dataset.csv data

COPY code/01_make_cleandataset.R code
COPY code/02_make_reporttable.R code
COPY code/03_make_reportfigure.R code
COPY code/04_render_report.R code

CMD make && mv report.html report