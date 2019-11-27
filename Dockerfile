FROM rocker/tidyverse:3.4.3

ENV DEBIAN_FRONTED noninteractive
RUN install2.r lme4 car
