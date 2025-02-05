# Analysis of single-cell transcriptomics data from developing human cortex

## Report

The HTML report of the analysis is available [here](./Report_analysis_Leonard_Herault.html). We can download the file (Download raw file button) and open it with a web browser.

## Reproduce the analysis

1.  Clone or download this repository. For example using git:

``` bash
git clone https://github.com/leonardHerault/Report_analysis_Leonard_Herault.git
```

2.  Place the `seurat_subset_test.rds`object at the root of repository. For example:

``` bash
cd Report_analysis_Leonard_Herault
cp <your_path_to_seurat_data_dir>/seurat_subset_test.rds ./
```

3.  Pull the docker image used for this analysis:

``` bash
docker pull leonardherault/seurat-extended:latest
```

4.   Run the analysis inside this docker container (being at the root of the repository):

``` bash
docker run -it --rm     -v $(pwd):/workspace     -w /workspace     seurat-extended     Rscript -e 'rmarkdown::render("Report_analysis_Leonard_Herault.Rmd")'
```
