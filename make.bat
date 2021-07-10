:: Makes BeerPongRule Document

@ECHO OFF

@REM If no parameters, build without opening
IF "%~1"=="" GOTO :default

@REM Build and open PDF
IF "%~1"=="-o" GOTO :open
IF "%~1"=="-open" GOTO :open

@REM Display help text
IF "%~1"=="-h" GOTO :help
IF "%~1"=="-help" GOTO :help

@REM Parameter is invalid
GOTO :invalid

:: Default
:default
    CALL :buildPDF
    GOTO :EOF

:: Open
:open
    CALL :buildPDF
    CALL :openPDF
    GOTO :EOF

:: Build PDF
:buildPDF
    ECHO -- Building PDF --
    pdflatex -quiet -output-directory=Output BPRules.tex
    EXIT /B

:: Open PDF
:openPDF
    ECHO -- Opening PDF --
    Output\BPRules.pdf
    EXIT /B

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
    ECHO Unknown option: %~1
    ECHO Try "%~nx0 -h" for more information.
    GOTO :EOF