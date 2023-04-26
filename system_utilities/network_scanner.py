import nmap

nm = nmap.PortScanner()

def scan_network(ip_range):
    nm.scan(hosts=ip_range, arguments='-sP')
    for host in nm.all_hosts():
        print(f"Host: {host}, MAC Address: 
{nm[host]['addresses']['mac']}, OS: 
{nm[host]['osmatch'][0]['name']}")

def main():
    # scan network

if __name__ == '__main__':
    main()

