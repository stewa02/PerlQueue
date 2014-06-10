@echo off

rem Author: Stephan Wagner
rem Version: 1.0.0
rem Generates PDF-Documentation out of POD using pod2pdf.

echo "Generate PDF..."
pod2pdf --title Queue documentation.pod >documentation.pdf
pause