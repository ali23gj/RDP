@echo off
REM === 1. تحميل السكربتات الإضافية ===
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ali23gj/RDP/main/setup.py' -OutFile 'setup.py'"
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ali23gj/RDP/main/show.bat' -OutFile 'show.bat'"
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ali23gj/RDP/main/loop.bat' -OutFile 'loop.bat'"

REM === 2. تحميل LiteManager وفك الضغط ===
powershell -Command "Invoke-WebRequest -Uri 'https://www.litemanager.com/soft/litemanager_5.zip' -OutFile 'litemanager.zip'"

REM التحقق من فك الضغط متاح في البيئة
powershell -Command "Expand-Archive -Path 'litemanager.zip' -DestinationPath '.' -Force"

REM === 3. تثبيت pyautogui ===
where python
IF %ERRORLEVEL% NEQ 0 (
    echo Python غير مثبت
    EXIT /B 1
)
python -m pip install --upgrade pip
python -m pip install pyautogui

REM === 4. تثبيت vcredist-all عبر Chocolatey (إن كان مثبتًا) ===
where choco
IF %ERRORLEVEL% EQU 0 (
    choco install vcredist-all -y
) ELSE (
    echo Chocolatey غير مثبت، تخطي تثبيت vcredist-all
)

REM === 5. إنشاء المستخدم TRX ===
net user TRX /add /expires:never
net user TRX TRX2014x

REM === 6. تشغيل setup.py إذا كان موجودًا ===
IF EXIST setup.py (
    python setup.py
) ELSE (
    echo setup.py غير موجود
)

echo.
echo === Downloads.bat completed ===
