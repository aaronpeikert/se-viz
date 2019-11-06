FROM rocker/verse
RUN install2.r --error --skipinstalled -n 4\
  pacman here fs furrr digest pander radix
WORKDIR /home/rstudio
