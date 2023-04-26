import os

path = '/path/to/folder'

for filename in os.listdir(path):
    if filename.endswith('.txt'):
        new_filename = 'new_' + filename
        os.rename(os.path.join(path, filename), 
os.path.join(path, new_filename))

