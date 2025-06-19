import requests

BASE = 'http://127.0.0.1:5000/students'
results = []

def log(response):
    results.append(response.text)
    print(response.text)

# 1. GET all students
log(requests.get(BASE))

# 2. POST 3 students
students = [
    {"first_name": "John", "last_name": "Doe", "age": 30},
    {"first_name": "Jane", "last_name": "Smith", "age": 42},
    {"first_name": "Alice", "last_name": "Brown", "age": 19},
    {"first_name": "Ivan", "last_name": "Brown", "age": 27},
    {"first_name": "Olena", "last_name": "Shevchenko", "age": 52},
    {"first_name": "Andrii", "last_name": "Bondar", "age": 33},
]
for s in students:
    log(requests.post(BASE, json=s))

# 3. GET all students again
log(requests.get(BASE))

# 4. PATCH - Update age of 2nd student (id=2)
log(requests.patch(f"{BASE}/2", json={"age": 23}))

# 5. GET 2nd student
log(requests.get(BASE, params={"id": "2"}))

# 6. PUT - Update all fields of 3rd student (id=3)
log(requests.put(f"{BASE}/3", json={"first_name": "Alicia", "last_name": "Green", "age": 21}))

# 7. GET 3rd student
log(requests.get(BASE, params={"id": "3"}))

# 8. GET all students
log(requests.get(BASE))

# 9. DELETE 1st student (id=1)
log(requests.delete(f"{BASE}/1"))

# 10. GET all students
log(requests.get(BASE))

# Write to file
with open("results.txt", "w") as f:
    for r in results:
        f.write(r + "\n\n")