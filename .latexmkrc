# Latex engine used when invoking latexmk (through shell, makefile, vimtex).
# Can be overridden by a latexmkrc file in the project directory or at the CLI.
$pdf_mode = 1;  # pdflatex, as latexmk -pdf
#$pdf_mode = 4;  # lualatex, as latexmk -pdflua
#$pdf_mode = 5;  # xelatex, as latexmk -pdfxe
