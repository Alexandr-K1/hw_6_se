import logging
from random import randint

from faker import Faker

import sqlite3
from sqlite3 import Error


fake = Faker()
logging.basicConfig(level=logging.ERROR)

database = './hw6.db'


try:
    # Підключення до бази даних
    conn = sqlite3.connect(database)
    cur = conn.cursor()


    # Додавання груп
    for _ in range(3):
        cur.execute("INSERT INTO groups (name) VALUES (?)", (fake.word(),))

    cur.execute("SELECT id FROM groups")
    group_ids = [row[0] for row in cur.fetchall()]


    # Додавання викладачів
    for _ in range(randint(3, 5)):
        cur.execute("INSERT INTO teachers (fullname) VALUES (?)", (fake.name(),))

    cur.execute("SELECT id FROM teachers")
    teacher_ids = [row[0] for row in cur.fetchall()]


    # Додавання предметів із вказівкою викладача
    for teacher_id in teacher_ids:
        for _ in range(randint(1,2)):
            cur.execute("INSERT INTO subjects (name, teacher_id) VALUES (?, ?)", (fake.word(), teacher_id))


    # Додавання студентів і оцінок
    for group_id in group_ids:
        for _ in range(randint(10, 17)):
            cur.execute("INSERT INTO students (fullname, group_id) VALUES (?, ?)", (fake.name(), group_id))
            student_id = cur.lastrowid

            for subject_id in range(randint(5, 8)):
                for _ in range(randint(5, 20)):
                    cur.execute("INSERT INTO grades (student_id, subject_id, grade, grade_date) VALUES (?, ?, ?, ?)",
                                (student_id, subject_id, randint(0, 100), fake.date_this_decade()))

    # Збереження змін
    conn.commit()
except Error as e:
    logging.error(f"SQL Error: {e}")
    conn.rollback()
finally:
    # Закриття підключення
    cur.close()
    conn.close()
