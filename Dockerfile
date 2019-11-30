FROM rocker/tidyverse:latest

RUN mkdir /root/working 
RUN mkdir /root/outputs

RUN R -e "install.packages(c('caret', 'e1071', 'rmarkdown'))"

ADD my_analysis.Rmd /root/working
CMD cd /root/working \
    && R -e "rmarkdown::render('my_analysis.Rmd')" \
&& mv /root/working/my_analysis.html /root/outputs