TARGET = main
SRC = $(TARGET).tex
BUILD_DIR = build
PDF = $(BUILD_DIR)/$(TARGET).pdf

.PHONY: all clean help

all: $(PDF)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(PDF): $(SRC) | $(BUILD_DIR)
	xelatex -shell-escape -interaction=nonstopmode -output-directory=$(BUILD_DIR) $(SRC)
	xelatex -shell-escape -interaction=nonstopmode -output-directory=$(BUILD_DIR) $(SRC)
	cp $(PDF) $(TARGET).pdf

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(TARGET).pdf

help:
	@echo "Makefile Help:"
	@echo "  all    - Build the PDF document using xelatex (outputs to build/ and copies PDF to root)."
	@echo "  clean  - Remove build directory and PDF file."
	@echo "  help   - Display this help message."

