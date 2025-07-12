from flask import Flask, request, jsonify
import csv
import os

app = Flask(__name__)
CSV_FILE = 'students.csv'
FIELDNAMES = ['id', 'first_name', 'last_name', 'age']


def read_students():
    if not os.path.exists(CSV_FILE):
        return []
    with open(CSV_FILE, mode='r', newline='') as f:
        return list(csv.DictReader(f))


def write_students(students):
    with open(CSV_FILE, mode='w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(students)


def get_new_id(students):
    if not students:
        return 1
    return max(int(s['id']) for s in students) + 1


@app.route('/students', methods=['GET'])
def get_students():
    students = read_students()
    last_name = request.args.get('last_name')
    student_id = request.args.get('id')

    if student_id:
        student = next((s for s in students if s['id'] == student_id), None)
        if not student:
            return jsonify({'error': 'Student not found'}), 404
        return jsonify(student)

    if last_name:
        matched = [s for s in students if s['last_name'].lower() == last_name.lower()]
        if not matched:
            return jsonify({'error': 'Student not found'}), 404
        return jsonify(matched)

    return jsonify(students)


@app.route('/students', methods=['POST'])
def create_student():
    students = read_students()
    data = request.get_json()

    if not data or any(k not in FIELDNAMES[1:] for k in data.keys()):
        return jsonify({'error': 'Invalid fields'}), 400

    if not all(field in data for field in FIELDNAMES[1:]):
        return jsonify({'error': 'Missing required fields'}), 400

    new_student = {
        'id': str(get_new_id(students)),
        'first_name': data['first_name'],
        'last_name': data['last_name'],
        'age': str(data['age']),
    }

    students.append(new_student)
    write_students(students)
    return jsonify(new_student), 201


@app.route('/students/<id>', methods=['PUT'])
def update_student(id):
    students = read_students()
    data = request.get_json()

    if not data or any(k not in FIELDNAMES[1:] for k in data.keys()):
        return jsonify({'error': 'Invalid fields'}), 400

    if not all(field in data for field in FIELDNAMES[1:]):
        return jsonify({'error': 'Missing required fields'}), 400

    for s in students:
        if s['id'] == id:
            s.update({k: str(data[k]) for k in FIELDNAMES[1:]})
            write_students(students)
            return jsonify(s)
    return jsonify({'error': 'Student not found'}), 404


@app.route('/students/<id>', methods=['PATCH'])
def patch_student(id):
    students = read_students()
    data = request.get_json()

    if not data or 'age' not in data or len(data) != 1:
        return jsonify({'error': 'Only age can be updated'}), 400

    for s in students:
        if s['id'] == id:
            s['age'] = str(data['age'])
            write_students(students)
            return jsonify(s)
    return jsonify({'error': 'Student not found'}), 404


@app.route('/students/<id>', methods=['DELETE'])
def delete_student(id):
    students = read_students()
    updated_students = [s for s in students if s['id'] != id]

    if len(updated_students) == len(students):
        return jsonify({'error': 'Student not found'}), 404

    write_students(updated_students)
    return jsonify({'message': f'Student {id} deleted'})


if __name__ == '__main__':
    app.run(debug=True)
