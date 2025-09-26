@echo off
chcp 65001
title Phenix 0.01
color 0b

:menu
cls
echo ================================
echo     Phenix - Install Best Tool    
echo ================================
echo [1] Flex       - Проверка и открытие ссылки
echo [2] Strike scan- Статистика сайта (DEMO)
echo [3] Open World - Вход на сайт (DEMO)
echo [4] Copy code  - Скопировать исходный код сайта
echo [5] Innstan    - (Нет функционала)
echo [X] Выйти
echo ================================
set /p choice=Выберите действие: 

if "%choice%"=="1" goto flex
if "%choice%"=="2" goto scan
if "%choice%"=="3" goto openworld
if "%choice%"=="4" goto copycode
if "%choice%"=="5" goto innstan
if /i "%choice%"=="X" exit
goto menu

:flex
cls
set /p url=Вставьте ссылку (https://...): 
REM (Замените путь к python на необходимый или используйте curl, PowerShell и пр.)
REM Здесь ДЕМО: считаем, что любые ссылки на .ru безопасны, остальные - угроза
echo %url% | find ".ru" >nul
if %errorlevel% equ 0 (
  echo Ссылка безопасна, открываем...
  start "" "%url%"
) else (
  echo Угроза! Ссылка не открыта.
)
pause
goto menu

:scan
cls
set /p scanurl=Введите URL сайта для сканирования: 
REM Пример простейшей статистики (только длина адреса и протокол)
echo Длина URL: %scanurl% | findstr /r "[^ ]*" | find /c ""
echo Протокол: 
echo %scanurl% | find "https" >nul && (echo HTTPS) || (echo HTTP)
pause
goto menu

:openworld
cls
set /p site=Введите URL сайта для входа: 
set /p login=Логин: 
set /p pass=Пароль: 
REM Авто-вход браузером невозможен стандартным батником без сторонних утилит!
REM Здесь откроем сайт. Для авто-ввода потребуется Selenium/Python.
start "" "%site%"
echo Для автологина используйте внешние скрипты (например, на Python + Selenium)
pause
goto menu

:copycode
cls
set /p copyurl=Введите URL для копирования кода: 
REM Нужен curl или PowerShell (пример для PowerShell)
powershell -command "Invoke-WebRequest -Uri '%copyurl%' | Select-Object -ExpandProperty Content" >site_code.html
echo Код сайта скопирован в файл site_code.html
pause
goto menu

:innstan
cls
echo Пока что команда не реализована.
pause
goto menu
