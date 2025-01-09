age = input("What is your age? ")

if int(age) >= 50:
    print("You are 50 years old or older.")
elif int(age) >= 25:
    print("You are 25 years old or older.")
elif int(age) >= 18:
    print("You are 18 years old or older.")
else:
    print("You are under 18 years old.")

print("This will always be printed.")