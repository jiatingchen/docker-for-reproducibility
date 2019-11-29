FROM rocker/tidyverse:latest

# install r dependencies
RUN R -e "install.packages(c('caret', 'e1071'))"
