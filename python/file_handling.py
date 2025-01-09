my_file = "file.txt"

try:
    file = open(my_file, "a")
except FileNotFoundError as e:
    print("File not found.")
    print(e)
    exit(1)

movies = ["Bluey", "South Park", "The Simpsons"]
for movie in movies:
    file.write(movie + "\n")
file.close()

try:
    file = open(my_file, "r")
except FileNotFoundError as e:
    print("File not found.")
    print(e)
    exit(1)

for line in file:
    print(line + "\n")
file.close()