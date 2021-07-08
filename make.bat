:: Makes BeerPongRule Document

@ECHO OFF

:: Build PDF
echo -- Building PDF --
pdflatex -output-directory=Output BPRules.tex

:: Open PDF
echo -- Opening PDF in Sumatra --
C:\Users\Patrick\AppData\Local\SumatraPDF\SumatraPDF.exe Output\BPRules.pdf
