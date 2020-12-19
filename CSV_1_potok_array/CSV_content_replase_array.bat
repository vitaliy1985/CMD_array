echo off
rem !!!!!!!
rem Подгоняем под свои поля для замены и пользуемся
rem Копируем скрипт в папку с CSV-файлами и запускаем
rem Строки: 
rem if !переменная!==nulll set "переменная=" не удалять и не изменять

rem Скрипт внесения изменений в csv файл по контенту
rem поля %%a,%%b..,%%v идут по порядку, согласно структуре файла
rem Команда SetLocal EnableExtensions EnableDelayedExpansion обязательна! для изменения переменных
rem Для внесения изменений необзодимо создать переменную, например: set TT=
rem и присвоить ей значение перед началом цикла, тогда обращаться к ней: %переменная%
rem или в теле цикла, тогда обращаться к ней: !переменная!
rem и заменить в строке формирования файла переменную на свою,

SetLocal EnableExtensions EnableDelayedExpansion

rem Если каталог new отсутствует, то создаем его
if not exist new md new

rem перебираем все файлы с расширением csv в текущей папке
for %%z in (*.csv) do (
	rem получаем имя текущего файла
	set filename=%%z
	rem Выводим имя обрабатываемого файла
	echo -------------------------------------
	echo File being processed: %CD%\!filename!
	rem echo start time: !date! !time!
	
	rem если уже файл существует, то удаляем его
	if exist new\%%z del new\%%z
	
	rem Нумерация для переменных для хранения строк из файла
	set /a num=0
	
	rem ------------------------------------------------------------------------------------
	rem Обрабатываем текущий файл построчно и создаем переменные и присваиваем им значения
	echo Start create array: !date! !time!
	echo Creating variables and assigning values to them	
	for /F "usebackq tokens=* " %%a in (!filename!) do (
		rem увеличиваем значение на 1
		set /a num =!num!+1					
		rem Сохраняем значение построчно в переменные
		set mas!num!=%%a
		)					
	echo End create array: !date! !time!
	
	
	rem ------------------------------------------------------------------------------------
	rem Обработка массива переменных
	echo Start processing array: !date! !time!	
	echo Processing array
	rem Нумерация для переменных для хранения строк из файла
	for /l %%q in (1,1,!num!) do (
		set stroka1=!mas%%q!		
		set q_temp=%%q
		rem Обработка строки			
		rem Создаем переменную stroka и записываем в нее значение n-й строки
		set stroka=!mas%%q!
		
		rem Заменяем в переменной stroka значения ,, на ,nulll, чтобы строка правильно распарсилась,
		rem т.к. в командной строке не распознаются значения null
		set stroka=!stroka:,,=,nulll,!
		rem Если значение первого поля null, то присваиваем ему значение nulll
		set str=!stroka!
		set str=!str:~0,1!
		if "!str!"=="," set stroka=nulll!stroka!
	
		rem Если значение последнего поля null, то присваиваем ему значение nulll
		set str=!stroka!
		set str=!str:~-1!
		if "!str!"=="," set stroka=!stroka!nulll
		
		for /f "tokens=1-25 delims=," %%a in ('echo !stroka!') do (
			set	pole1=%%a
			if !pole1!==nulll set "pole1="

			set	pole2=%%b
			if !pole2!==nulll set "pole2="
		
			set	pole3=%%c
			if !pole3!==nulll set "pole3="
		
			set	pole4=%%d
			if !pole4!==nulll set "pole4="
		
			set	pole5=%%e
			if !pole5!==nulll set "pole5="
		
			set	pole6=%%f
			if !pole6!==nulll set "pole6="
		
			set	pole7=%%g
			if !pole7!==nulll set "pole7="
		
			set	pole8=%%h
			if !pole8!==nulll set "pole8="
		
			set	pole9=%%i
			if !pole9!==nulll set "pole9="
		
			set	pole10=%%j
			if !pole10!==nulll set "pole10="
		
			set	pole11=%%k
			if !pole11!==nulll set "pole11="
			if %%k==ZN1 (
				set pole11=ZN2
						) else set pole11=ZN3
		
			set	pole12=%%l
			if !pole12!==nulll set "pole12="
		
			set	pole13=%%m
			if !pole13!==nulll set "pole13="
		
			set	pole14=%%n
			if !pole14!==nulll set "pole14="
		
			set	pole15=%%o
			if !pole15!==nulll set "pole15="
		
			set	pole16=%%p
			if !pole16!==nulll set "pole16="
			if "%%p"=="ppppp" (
				set pole16=ZN1
							  ) else (
								if "%%p"=="ZN 2" ( set pole16=ZN222
												 ) else if "%%p"=="ZN 3" set pole16=ZN333
			
									 )
		
			set	pole17=%%q
			if !pole17!==nulll set "pole17="
		
			set	pole18=%%r
			if !pole18!==nulll set "pole18="
		
			set	pole19=%%s
			if !pole19!==nulll set "pole19="
		
			set	pole20=%%t
			if !pole20!==nulll set "pole20="
		
			set	pole21=%%u
			if !pole21!==nulll set "pole21="
		
			set	pole22=%%v
			if !pole22!==nulll set "pole22="
		
			set	pole23=%%w
			if !pole23!==nulll set "pole23="
		
			set	pole24=%%x
			if !pole24!==nulll set "pole24="
		
			set	pole25=%%y
			if !pole25!==nulll set "pole25="

			rem формирование новой строки
			set stroka=!pole1!,!pole2!,!pole3!,!pole4!,!pole5!,!pole6!,!pole7!,!pole8!,!pole9!,!pole10!,!pole11!,!pole12!,!pole13!,!pole14!,!pole15!,!pole16!,!pole17!,!pole18!,!pole19!,!pole20!,!pole21!,!pole22!,!pole23!,!pole24!,!pole25!
			
			rem Сохраняем обработанные строки по полям обратно в переменные
			set mas!q_temp!=!stroka!
			)
			rem for /f "tokens=1-25 delims=," %%a in ('echo !stroka!') do (
		)
		rem for /l %%q in (1,1,!num!) do (
	echo End processing array: !date! !time!
	

	rem ------------------------------------------------------------------------------------	
	rem Созранение массива переменных в файл
	echo Start save array: !date! !time!	
	echo Saving an array of variables to a file
	rem Нумерация для переменных для хранения строк из файла
	for /l %%q in (1,1,!num!) do (
		set stroka1=!mas%%q!
		echo !stroka1! >> %CD%\new\!filename!
		rem Удаление переменной
		set !mas%%q!=
		)
	echo End save array: !date! !time!
	)
	rem for %%z in (*.csv) do (	

pause