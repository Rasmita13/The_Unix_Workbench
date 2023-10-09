# Define the name of the output file
OUTPUT_FILE = README.md

# Define the name of the source file
SOURCE_FILE = guessinggame.sh

# Define the title of the project
PROJECT_TITLE = "Guessing Game"

# Get the current date and time
CURRENT_DATE = $(shell date +"%Y-%m-%d %H:%M:%S")

# Count the lines of code in guessinggame.sh
LOC = $(shell wc -l < $(SOURCE_FILE))

# Generate the README.md file
$(OUTPUT_FILE): $(SOURCE_FILE)
	@echo "# $(PROJECT_TITLE)" > $@
	@echo >> $@
	@echo "Date and Time at which 'make' was run: $(CURRENT_DATE)" >> $@
	@echo "Number of lines of code in $(SOURCE_FILE): $(LOC)" >> $@
	@echo >> $@

# Deploy the README.md to GitHub Pages
deploy:
	@git add $(OUTPUT_FILE)
	@git commit -m "Update $(OUTPUT_FILE)"
	@git push origin master
	@echo "README.md has been updated and pushed to GitHub Pages."

# Phony targets
.PHONY: clean

# Clean the generated files
clean:
	@rm -f $(OUTPUT_FILE)
