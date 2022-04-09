@echo off
REM Copyright (c) 2022 XXIV
REM
REM Permission is hereby granted, free of charge, to any person obtaining a copy
REM of this software and associated documentation files (the "Software"), to deal
REM in the Software without restriction, including without limitation the rights
REM to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
REM copies of the Software, and to permit persons to whom the Software is
REM furnished to do so, subject to the following conditions:
REM
REM The above copyright notice and this permission notice shall be included in all
REM copies or substantial portions of the Software.
REM
REM THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
REM IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
REM FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
REM AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
REM LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
REM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
REM SOFTWARE.
goto :main

:random_num
set /a random_num=%RANDOM% %%%2 + %1
goto :eof

:main
setlocal

set /a min=1
set /a max=100

call :random_num %min% %max%

set /a number=%random_num

echo.
echo.
echo ============================
echo +                          +
echo +  _  _  _  _  ____  _  _  +
echo + ( \/ )( \/ )(_  _)( \/ ) +
echo +  )  (  )  (  _)(_  \  /  +
echo + (_/\_)(_/\_)(____)  \/   +
echo +                          +
echo +  Number Guessing Game    +
echo ============================
echo.
echo.
echo You have 5 attempts use it wis
echo.
echo.

:play

set /a attempts=5

:loop

if %attempts%==0 (
	echo You lost.
	echo.
	goto :play_again
)

set /a attempts-=1

:input

set /p input=Choose number between %min% and %max% : 

if [%input%]==[] (
	echo Input cannot be empty.
	echo.
	goto :input
)

set /a input=%input%

echo.
echo %attempts% attempts remains.
echo.

if %input% LSS %number% (
	echo You're lower!
	echo.
	goto :loop
)

if %input% gtr %number% (
	echo You're higher!
	echo.
	goto :loop
)

if %input%==%number% goto :endloop

:endloop

echo.
echo You guessed it ! It's %number%
echo.

:play_again

set /p in=Wanna play again [Y/N] ? 

if [%in%]==[y] goto :play

if [%in%]==[Y] goto :play

if [%in%]==[n] exit

if [%in%]==[N] exit

goto :play_again

endlocal
goto :eof