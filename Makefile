# The files that create all the other files
SOURCE = resilience.md 
SOURCE += resilience.yaml

# All the different files we'll create
TARGET = resilience.html
TARGET += resilience-presentation.html
TARGET += resilience.pdf

# pandoc options
PANDOC := pandoc -f markdown+mmd_title_block --slide-level=2

#OFFLINE := -s --self-contained
OFFLINE := -s

# reveal.js options
REVEALJS_THEME := solarized
 
# build everything by default
all: $(TARGET)

# generate reveal.js files
%-presentation.html: $(SOURCE)
		$(PANDOC) $(OFFLINE) -t revealjs -V theme=$(REVEALJS_THEME) -o $@ $(SOURCE)

# generate html file
%.html: $(SOURCE)
		$(PANDOC) -o $@ $(SOURCE)

# generate pdf file
%.pdf: $(SOURCE)
		$(PANDOC) -o $@ $(SOURCE)

# delete everything we make
clean:
	@rm -vrf $(TARGET)
