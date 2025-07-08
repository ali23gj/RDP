import psutil, socket, datetime

threshold = 50.0
log_file = f"{socket.gethostname()}_usage.log"

with open(log_file, "a") as log:
    for proc in psutil.process_iter(['name', 'cpu_percent']):
        if proc.info['cpu_percent'] > threshold:
            proc.kill()
            log.write(f"Killed {proc.info['name']} at {datetime.datetime.now()}\n")
    log.write(f"Check at {datetime.datetime.now()} complete.\n")
