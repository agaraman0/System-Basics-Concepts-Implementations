import psutil

def monitor_processes():
    for process in psutil.process_iter(['pid', 'name', 
'memory_info', 'cpu_percent', 'status', 'cmdline']):
        print(f"PID: {process.pid}, Name: {process.name()}, 
CPU Usage: {process.cpu_percent()}%, Memory Usage: 
{process.memory_info().rss/1024/1024:.2f} MB, Status: 
{process.status()}")

def main():
    # monitor processes

if __name__ == '__main__':
    main()

