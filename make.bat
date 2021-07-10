:: Makes BeerPongRule Document

@ECHO OFF

setlocal ENABLEDELAYEDEXPANSION

@REM Set global variables
SET filename=%~nx0

SET /A verbose=0
SET /A open=0

@REM If no parameters, build without opening
IF "%~1"=="" GOTO :default

@REM Display help text
IF "%~1"=="-h" GOTO :help
IF "%~1"=="-help" GOTO :help

@REM Loop through all parameters
SET /A numP=0
:loop
    @REM Use numP to test each parameter for validity
    SET numP=0

    @REM Check options
    IF "%1"=="-v" (
        SET numP=1
        SET verbose=1
    ) ELSE (
        IF "%1"=="-verbose" (
            SET numP=1
            SET verbose=1
        )
        IF "%1"=="-o" (
            SET numP=1
            SET open=1
        )
        IF "%1"=="-open" (
            SET numP=1
            SET open=1
        )
    )

    @REM If current option is not valid
    IF !numP!==0 GOTO :invalid
    
    @REM Shift variables and loop if another option exists
    SHIFT
    IF NOT "%1"=="" GOTO :loop

:: Default
:default
    @REM Verbose options
    IF %verbose%==0 CALL :buildPDF
    IF %verbose%==1 CALL :buildPDFv
    
    @REM Open options
    IF %open%==0 GOTO :EOF
    IF %open%==1 CALL :openPDF

    @REM Finally:
    GOTO :EOF

:: Build PDF
:buildPDF
    ECHO -- Building PDF --
    pdflatex -quiet -output-directory=Output BPRules.tex
    pdflatex -quiet -output-directory=Output BPRules.tex
    EXIT /B

:: Build PDF verbose
:buildPDFv
    ECHO -- Building PDF --
    pdflatex -output-directory=Output BPRules.tex
    pdflatex -output-directory=Output BPRules.tex
    EXIT /B

:: Open PDF
:openPDF
    ECHO -- Opening PDF --
    Output\BPRules.pdf
    EXIT /B

:: Help
:help
    ECHO %filename% compiles BPRules.tex using PDFLaTeX.
    ECHO.
    ECHO     Usage: %filename% [option] ...
    ECHO.
    ECHO Available options:
    ECHO     %filename% [-h ^| -help]       Provides help information.
    ECHO     %filename% [-v ^| -verbose]    Show compiler output.
    ECHO     %filename% [-o ^| -open]       Open the PDF after compilation.
    GOTO :EOF

:: Invalid Parameter
:invalid
    ECHO Unknown option: %1
    ECHO Try "%filename% -h" for more information.
    GOTO :EOF