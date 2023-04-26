import os

path = '/path/to/folder'

for dirpath, dirnames, filenames in os.walk(path):
    total_size = 0
    for f in filenames:
        fp = os.path.join(dirpath, f)
        total_size += os.path.getsize(fp)
    print(f"Folder: {dirpath}, Size: 
{total_size/1024/1024:.2f} MB")

