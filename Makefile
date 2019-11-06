DOCKER = TRUE
PROJECT := $(notdir $(CURDIR))
UID = $(shell id -u)
WORKDIR = $(CURDIR)

ifeq ($(DOCKER),TRUE)
	RUN:= docker run --rm --user $(UID) -v $(CURDIR):/home/rstudio $(PROJECT)
	WORKDIR=/home/rstudio
endif

all: README.md site

build: Dockerfile
	docker build -t $(PROJECT) .

site:
	$(RUN) Rscript -e 'rmarkdown::render_site(encoding = "UTF-8")'

%.html: %.Rmd
	$(RUN) Rscript -e 'rmarkdown::render("$(WORKDIR)/$<", output_format = "all")'

README.md: README.Rmd
	$(RUN) Rscript -e 'rmarkdown::render("$(WORKDIR)/$<", output_format = "all")'
