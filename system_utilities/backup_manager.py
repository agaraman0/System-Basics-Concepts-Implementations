import os
import boto3
from botocore.exceptions import NoCredentialsError

ACCESS_KEY = 'your_access_key'
SECRET_KEY = 'your_secret_key'
BUCKET_NAME = 'your_bucket_name'

def backup_to_aws_s3(file_path):
    s3 = boto3.client('s3', aws_access_key_id=ACCESS_KEY, 
aws_secret_access_key=SECRET_KEY)
    try:
        s3.upload_file(file_path, BUCKET_NAME, 
os.path.basename(file_path))
        print("Backup successful")
    except NoCredentialsError:
        print("Credentials not available")

def main():
    # backup file to S3

if __name__ == '__main__':
    main()

