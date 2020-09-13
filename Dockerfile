FROM rocker/shiny-verse:3.6.3

# Download and install libraries
RUN R -e "install.packages(c('shinydashboard', 'sortable'))"
RUN R -e "install.packages('remotes')"
RUN R -e "remotes::install_github('daqana/dqshiny')"
RUN Rscript -e "install.packages('BiocManager')"
RUN Rscript -e "BiocManager::install('limma')"
RUN R -e "devtools::install_github('singha53/omicsBioAnalytics@udacity')" 
asdfasdf
EXPOSE 3838

CMD ["R", "-e", "options(shiny.port = 3838, shiny.host = '0.0.0.0'); shiny::runApp('/usr/local/lib/R/site-library/omicsBioAnalytics/app')"] 
