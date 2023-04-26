import psutil

cpu_count = psutil.cpu_count(logical=False)
mem_total = psutil.virtual_memory().total
mem_avail = psutil.virtual_memory().available
disk_total = psutil.disk_usage('/').total
disk_used = psutil.disk_usage('/').used
os_info = f"{os.name} {platform.system()} 
{platform.release()}"

print(f"CPU Cores: {cpu_count}, Memory Total: 
{mem_total/1024/1024:.2f} MB, Memory Available: 
{mem_avail/1024/1024:.2f} MB")
print(f"Disk Total: {disk_total/1024/1024:.2f} MB, Disk Used: 
{disk_used/1024/1024:.2f} MB")
print(f"Operating System: {os_info}")

