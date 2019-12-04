# pull rocker/tidyverse image from DockerHub
FROM rocker/tidyverse:latest

# create 2 directories in container
RUN mkdir /root/working 
RUN mkdir /root/outputs

# run install.packages commands in r
RUN R -e "install.packages(c('remotes', 'rmarkdown')); \
  remotes::install_version('caret', '6.0-84'); \
  remotes::install_version('e1071', '1.7-3')"

# copy my_analysis.Rmd from local PC to container
ADD my_analysis.Rmd /root/working

# render my_analysis.Rmd and move my_analysis.html to outputs folder
CMD cd /root/working \
    && R -e "rmarkdown::render('my_analysis.Rmd')" \
&& mv /root/working/my_analysis.html /root/outputs/