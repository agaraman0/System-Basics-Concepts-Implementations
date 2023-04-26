from loguru import logger

logger.add('app.log', rotation='500 MB', compression='zip')

def process_data(data):
    # do something with data

    logger.info(f"Processed {len(data)} records")

def main():
    # read data from file

    process_data(data)

if __name__ == '__main__':
    main()

