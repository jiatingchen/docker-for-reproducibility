FROM rocker/tidyverse:latest

RUN mkdir /root/working 
RUN mkdir /root/outputs

RUN R -e "install.packages(c('remotes', 'rmarkdown')); \
  remotes::install_version('caret', '6.0-84'); \
  remotes::install_version('e1071', '1.7-3')"

ADD my_analysis.Rmd /root/working
CMD cd /root/working \
    && R -e "rmarkdown::render('my_analysis.Rmd')" \
&& mv /root/working/my_analysis.html /root/outputs