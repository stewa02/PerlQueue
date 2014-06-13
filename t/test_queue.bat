@echo off

rem Author: Stephan Wagner
rem Version: 1.0.0
rem Runs all test files in test directory.
echo Testing file for Queue V1.7
echo Editor: 		Stephan Wagner
echo File version: 		1.1.0

prove --ignore-exit -v 0*.t
pause