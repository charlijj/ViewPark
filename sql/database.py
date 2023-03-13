import sqlite3 as sql

# connect to database / make new

sqlConnection = sql.connect("view_park.db")

cursor = sqlConnection.cursor()

# open sql file and execute
with open('create_database.sql', 'r') as sql_file:
    sql_script = sql_file.read()

cursor.executescript(sql_script)

# show all in table
showTable = "SELECT * FROM table"

cursor.execute(showTable)

results = cursor.fetchall()
print(results)

# commit changes and close connection
sqlConnection.commit()
sqlConnection.close()
