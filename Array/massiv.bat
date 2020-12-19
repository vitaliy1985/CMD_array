echo off
SetLocal EnableExtensions EnableDelayedExpansion

echo -------------------------------
echo Start create array: !date! !time!
	
rem если уже файл существует, то удаляем его
if exist mas.txt del mas.txt
	
rem Нумерация для переменных
set /a num=0
	
rem Создание массива переменных
echo Creating variables and assigning values to them
for /l %%a in (1,1,10000) do (
	set /a num =!num!+1					
	set mas!num!=%%a
	rem echo %%a
	)	
echo End create array: !date! !time!



echo -------------------------------
echo Start save array: !date! !time!	
echo Saving an array of variables to a file
rem Сохранение массива в файл
for /l %%q in (1,1,!num!) do (
	rem set stroka1=!mas%%q!
	echo !mas%%q! >> %CD%\mas.txt
	rem Удаление переменной
	set !mas%%q!=
	)
echo End save array: !date! !time!

pause