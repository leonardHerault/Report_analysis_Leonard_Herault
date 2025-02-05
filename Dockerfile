# Start from the RStudio's R Base Image to have the latest R version
FROM r-base:latest


# Install system dependencies for R packages
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    pandoc \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-latex-recommended \
    texlive-latex-extra \
    && apt-get clean

# Install latest Seurat and its dependencies
RUN Rscript -e "install.packages('Seurat', repos='https://cloud.r-project.org')"

# Install additional R packages
RUN Rscript -e "install.packages(c('rmarkdown','ggthemes','devtools'), repos='https://cloud.r-project.org')"

# Install biomaRt from bioconductor
RUN Rscript -e "if (!require('BiocManager', quietly = TRUE)) install.packages('BiocManager');BiocManager::install('biomaRt')"


# Install presto from github
RUN Rscript -e "devtools::install_github('immunogenomics/presto')"

