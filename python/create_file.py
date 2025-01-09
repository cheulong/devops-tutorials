import os

# Create a new file
file = input("Enter the name of the file: ")

if os.path.isfile(file):
    print("File already exists.")
else:
    print("The file does not exist.")
    print("Creating a new file...")
    os.system("touch {}".format(file))
    print("File created successfully.")