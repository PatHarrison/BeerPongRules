:: Makes BeerPongRule Document

@ECHO OFF

IF "%~1"=="" GOTO :build

IF "%1"=="-h" GOTO :help
IF "%1"=="-help" GOTO :help
IF NOT "%~1"=="" GOTO :invalid

:: Build PDF
:build
    ECHO -- Building PDF --
    pdflatex -quiet -output-directory=Output BPRules.tex
    pdflatex -quiet -output-directory=Output BPRules.tex

IF "%~1"=="" GOTO :EOF

IF "%1"=="-o" GOTO :openPDF
IF "%1"=="-open" GOTO :openPDF

IF NOT "%~1"=="" GOTO :EOF

:: Open PDF
:openPDF
    ECHO -- Opening PDF --
    Output\BPRules.pdf
    GOTO :EOF

:: Help
:help
    ECHO %~nx0 compiles BPRules.tex using PDFLaTeX.
    ECHO.
    ECHO     Usage: %~nx0 [option]
    ECHO.
    ECHO %~nx0 [-h ^| -help]     Provides help information.
    ECHO %~nx0 [-o ^| -open]     Open the PDF after compilation.
    GOTO :EOF

:: Invalid Parameter
:invalid
    ECHO Unknown option: %1
    ECHO Try "%~nx0 -h" for more information.
    GOTO :EOF