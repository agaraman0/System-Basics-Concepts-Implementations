def back_of_the_envelope_calc(requests_per_second, average_request_size, 
server_capacity, replication_factor):
    # Calculate the total load on the system (in bytes per second)
    load = requests_per_second * average_request_size

    # Calculate the capacity of a single server (in bytes per second)
    single_server_capacity = server_capacity / replication_factor

    # Calculate the number of servers needed to handle the load
    num_servers = load / single_server_capacity

    return num_servers

# Example usage
requests_per_second = 1000  # 1000 requests per second
average_request_size = 100  # 100 bytes per request
server_capacity = 100000    # 100,000 bytes per second capacity per server
replication_factor = 3      # Data is replicated across 3 servers for redundancy

num_servers_required = back_of_the_envelope_calc(requests_per_second, 
average_request_size, server_capacity, replication_factor)
print("Number of servers required:", num_servers_required)

