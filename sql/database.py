import sqlite3 as sql

# connect to database / make new

sqlConnection = sql.connect("ViewPark.db")

cursor = sqlConnection.cursor()

# open sql file and execute
with open('createDatabase.sql', 'r') as sql_file:
    sql_script = sql_file.read()

cursor.executescript(sql_script)

# show all tables
showTable = "SELECT * FROM ViewPark"

cursor.execute(showTable)

results = cursor.fetchall()
print(results)

# commit changes and close connection
sqlConnection.commit()
sqlConnection.close()
