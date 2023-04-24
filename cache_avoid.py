import requests
import random
import time
from fake_useragent import UserAgent

def random_accept_encoding():
    encodings = ['gzip', 'deflate', 'br']
    return ','.join(random.sample(encodings, random.randint(1, len(encodings))))

def random_accept_language():
    languages = ['en-US', 'en-GB', 'en-AU', 'en-CA', 'fr-FR', 'fr-CA', 'de-DE', 'es-ES', 'it-IT', 'pt-BR', 'ru-RU', 'ja-JP', 'zh-CN']
    return ','.join(random.sample(languages, random.randint(1, len(languages))))

def random_sec_ch_ua():
    browsers = [
        ('Not A;Brand', '99'),
        ('Chromium', '112'),
        ('Google Chrome', '112'),
        ('Firefox', '106'),
        ('Safari', '14.1')
    ]
    return '"{}";v="{}"'.format(*random.choice(browsers))

def random_sec_ch_ua_mobile():
    return '?{}'.format(random.choice(['0', '1']))

def random_sec_ch_ua_platform():
    return random.choice(['Windows', 'macOS', 'Android', 'iOS'])

ua = UserAgent()
url = "https://www.binance.com/en/support/announcement"

# Create a session
session = requests.Session()

while True:
    current_time = int(time.time() * 1000)
    unique_url = f"{url}?timestamp={current_time}"
    headers = {
        'User-Agent': ua.random,
        'Accept-Encoding': random_accept_encoding(),
        'Accept-Language': random_accept_language(),
        'Sec-CH-UA': random_sec_ch_ua(),
        'Sec-CH-UA-Mobile': random_sec_ch_ua_mobile(),
        'Sec-CH-UA-Platform': random_sec_ch_ua_platform(),
        'Pragma': 'no-cache',
        'Cache-Control': 'no-cache, no-store, must-revalidate',
        'Connection': 'close',
        'Age': '0',
        'Clear-Site-Data': "*"
    }
    response = session.get(unique_url, headers=headers)
    print('Headers:')
    for key, value in headers.items():
        print(f'  {key}: {value}')
    print(f'x-cache status: {response.headers["X-Cache"]}\n')

    session.cookies.clear()  # Clear cookies after each request
    time.sleep(random.uniform(2, 4))  # Add a random delay between 5 to 10 seconds.
