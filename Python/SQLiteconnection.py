import sqlite3

conn = sqlite3.connect('database.db')
cursor = conn.cursor()

#sql_command = """CREATE TABLE user (
#username VARCHAR(20) PRIMARY KEY,
#wins INTEGER,
#losses INTEGER,
#games INTEGER,
#lastselected DATETIME);"""

#cursor.execute("""INSERT INTO user VALUES ("User1", 10, 20, 30, CURRENT_TIMESTAMP);""")
#conn.commit()

#cursor.execute(sql_command)

cursor.execute("SELECT * FROM user")

data = cursor.fetchall()

for i in data:
    print(i)

conn.close()
