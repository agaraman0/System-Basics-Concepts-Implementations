import psutil

pid = 1234

p = psutil.Process(pid)
print(f"CPU Usage: {p.cpu_percent()}%, Memory Usage: 
{p.memory_info().rss/1024/1024:.2f} MB")

