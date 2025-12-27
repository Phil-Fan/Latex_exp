TARGET = thesis
SRC = $(TARGET).tex
BUILD_DIR = build
PDF = $(BUILD_DIR)/$(TARGET).pdf

.PHONY: all clean

all: $(PDF)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(PDF): $(SRC) | $(BUILD_DIR)
	xelatex -interaction=nonstopmode -output-directory=$(BUILD_DIR) $(SRC)
	xelatex -interaction=nonstopmode -output-directory=$(BUILD_DIR) $(SRC)
	cd $(BUILD_DIR) && BIBINPUTS=..: bibtex $(TARGET)
	xelatex -interaction=nonstopmode -output-directory=$(BUILD_DIR) $(SRC)
	cp $(PDF) $(TARGET).pdf

init: renew clean

renew: 
	find figures/ -type f ! -name 'char.png' ! -name 'example.png' ! -name 'logo.png' -delete


clean:
	rm -rf $(BUILD_DIR)
	rm -f $(TARGET).pdf
	
help:
	@echo "Makefile Help:"
	@echo "  all    - Build the PDF document using xelatex (outputs to build/ and copies PDF to root)."
	@echo "  clean  - Remove build directory and PDF file."
	@echo "  help   - Display this help message."
