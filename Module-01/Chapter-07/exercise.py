# Store your name, department and current CGPA in variables and print a formatted sentence using an f-string.
name = "Adeladan Muteeyah Temilola"
department = "Computer Science"
cgpa = 3.00

print(f"My name is {name}. I'm in the {department} department. My current CGPA is {cgpa}.")

# Calculate and print how many days are left until December 31, 2026 (hardcore the numbers for now - datetime comes later.)
January = 31
February = 28
March = 31
April = 30
May = 31
June = 30
July = 31
August = 31
September = 30
October = 31
November = 30
December = 31

days_remaining = 365 - (January + February + March + April + May + June + July + (August - 9))
print(days_remaining)

