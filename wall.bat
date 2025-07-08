@echo off
REM تغيير خلفية سطح المكتب إلى ملف project_wallpaper.bmp الموجود في assets
copy "%~dp0\assets\project_wallpaper.bmp" "C:\Windows\Temp\project_wallpaper.bmp" /Y
powershell -Command "Add-Type -AssemblyName User32; [User32.SystemParametersInfo]::SystemParametersInfo(20,0,'C:\Windows\Temp\project_wallpaper.bmp',3)"
echo Wallpaper changed by TRX.
