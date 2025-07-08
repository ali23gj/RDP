@echo off
REM 1. تحميل السكربتات الإضافية
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ali23gj/RDP/main/setup.py' -OutFile 'setup.py'"
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ali23gj/RDP/main/show.bat' -OutFile 'show.bat'"
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ali23gj/RDP/main/loop.bat' -OutFile 'loop.bat'"

REM 2. تحميل LiteManager وفك الضغط
powershell -Command "Invoke-WebRequest -Uri 'https://www.litemanager.com/soft/litemanager_5.zip' -OutFile 'litemanager.zip'"
powershell -Command "Expand-Archive -Path 'litemanager.zip' -DestinationPath '.'"

REM 3. تثبيت pyautogui وvcredist-all
py -3 -m pip install --upgrade pip
py -3 -m pip install pyautogui
choco install vcredist-all -y

REM 4. إنشاء المستخدم TRX وتعيين كلمة المرور
net user TRX /add /expires:never
net user TRX TRX2014x

REM 5. تشغيل setup.py لإعداد إضافي
py -3 setup.py

echo Downloads.bat completed.
