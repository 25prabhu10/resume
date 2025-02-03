# -*- Makefile -*-

# Source files
SRC_DIR = src
RESUME = resume
SRC_TEX = ${SRC_DIR}/${RESUME}.tex
PDF = ${SRC_DIR}/${RESUME}.pdf

.PHONY: clean

all: ${PDF}

${PDF}: ${SRC_TEX}
	tectonic ${SRC_TEX}
	@echo "PDF generated: ${PDF}"

clean:
	rm -f ${PDF}
