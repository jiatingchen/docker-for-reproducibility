FROM rocker/tidyverse:latest

RUN mkdir /root/working 
RUN mkdir /root/outputs

# install r dependencies
RUN R -e "install.packages(c('caret', 'e1071', 'rmarkdown'))"

COPY my_analysis.rmd /root/working
CMD cd /root/working \
    && R -e "rmarkdown::render('my_analysis.rmd')" \
&& mv /root/working/my_analysis.html /root/outputs