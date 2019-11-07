FROM rocker/verse
RUN install2.r --error --skipinstalled -n 4\
  pacman here fs furrr digest pander radix
RUN installGithub.r\
  'cttobin/ggthemr'
WORKDIR /home/rstudio
