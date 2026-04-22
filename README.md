# DATA 550 Final Project
    
**Description of Repository Contents**

In addition ot this README.md file, other components of this repository include:

- a `code/` folder where all project code is stored
- a `data/` folder where the main project dataset is stored
- a Dockerfile used to help build a Docker image for executing this project
- a Makefile with rules for construction the final report, as well as individual report components
- an `output/` folder where all report outputs are stored as `.rds` objects
- a `report/` folder where the final report will eventually be saved
- a `renv/` folder containing an activate.R file, a settings.json file, and a library folder with information about the project packages
- a `renv.lock` file containing information about the R packages used for this project
- a report.Rmd file that contains code that compiles all report elements into a single html file

**Description of Report Contents**

This final project report (compiled via the instructions below) aims to summarize county-level data on opioid prescription rates 
and narcotic overdose mortality in the United States between the years of 2014 and 2022. The report is comprised of the following:

- A table displaying the average county-level opioid prescription rate in 2022 for each state in the dataset
    - The code that creates this table can be found in `code/02_make_reporttable.R`
    - The table itself is saved in the project's `output/` folder as a `.rds` object
    
- A figure displaying the change in narcotic overdose mortality rate in metro Atlanta's 5 core counties (Fulton, DeKalb, Cobb, 
Gwinnett, and Clayton County) between the years of 2014 and 2021
    - The code that creates this figure can be found in `code/03_make_reportfigure.R`
    - The figure itself is saved in the project's `output/` folder as a `.rds` object

**Instructions for Building the Docker Image**

In order to build a Docker image to run this report, please follow these instructions:

1. Using your machine's terminal, navigate to your desired working directory for the project
2. In terminal, execute the command `make pullfinalimage`
3. In terminal, execute the command `make buildfinalimage`

**Instructions for Generating Final Report**

In order to compile the report, please follow these instructions:

1. Using your machine's terminal, navigate to desired working directory for the project
2. If you have not built the Docker image yet, follow the instructions found in the above section (Instructions for Generating Final Report)
3. In terminal, execute the command `make report/report.html`

Please reach out to the project lead (Roland Berg, roland.berg @ emory.edu) with any questions or issues that arise.