import pyautogui, os, socket

# فتح بورت TCP 5650 في الجدار الناري باسم LiteManager_TRX
os.system('netsh advfirewall firewall add rule name="LiteManager_TRX" dir=in action=allow protocol=TCP localport=5650')
print(f"[setup.py] Hostname: {socket.gethostname()}")
print("[setup.py] Setup completed.")
