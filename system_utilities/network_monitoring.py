import psutil
import time
import matplotlib.pyplot as plt

def monitor_network(interface='eth0', interval=1):
    tx_prev = 
psutil.net_io_counters(pernic=True)[interface].bytes_sent
    rx_prev = 
psutil.net_io_counters(pernic=True)[interface].bytes_recv

    tx_rate = []
    rx_rate = []
    time_axis = []

    while True:
        time.sleep(interval)

        tx_now = 
psutil.net_io_counters(pernic=True)[interface].bytes_sent
        rx_now = 
psutil.net_io_counters(pernic=True)[interface].bytes_recv

        tx_rate.append((tx_now - tx_prev) / interval)
        rx_rate.append((rx_now - rx_prev) / interval)
        time_axis.append(time.time())

        tx_prev = tx_now
        rx_prev = rx_now

        plt.plot(time_axis, tx_rate, 'r-', time_axis, 
rx_rate, 'b-')
        plt.xlabel('Time (s)')
        plt.ylabel('Bandwidth (bytes/s)')
        plt.legend(['TX', 'RX'])
        plt.show(block=False)
        plt.pause(interval)
        plt.clf()

