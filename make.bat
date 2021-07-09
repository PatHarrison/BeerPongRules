:: Makes BeerPongRule Document

@ECHO OFF

IF %1.==. GOTO build
IF %1%=="-h" IF %1%=="-help" GOTO help

:: Help
:help
    ECHO Compiles BPRules.tex using PDFLaTeX.
    ECHO.
    ECHO make.bat [-h ^| -help]     Provides help information.
    ECHO make.bat [-o ^| -open]     Open the PDF file after compilation.
    ECHO.
    GOTO end

:: Build PDF
:build
    ECHO -- Building PDF --
    pdflatex -quiet -output-directory=Output BPRules.tex

IF %1.==. GOTO end
IF %1=="-o" IF %1=="-open" GOTO openPDF

:: Open PDF
:openPDF
    ECHO -- Opening PDF --
    Output\BPRules.pdf
    GOTO end

:end

