from dataclasses import dataclass
import sqlite3 as sql
import os

class DataEntry:


    def get_params(self):
        """
        Return the non None attributes of the class
        """

        dParams = {}

        for key in self.__dict__:

            if self.__dict__[key] is not None:
                dParams[key] = self.__dict__[key]

        return dParams


    def set_params(self, dParams):
        """
        Set the attributes of the class from the dParams
        """     

        for key in dParams:
            setattr(self, key, dParams[key])


    def assign_list(self, dList):
        """
        Assign attributes in order of the list 
        """

        i = 0

        for key in self.__dict__:

            if i < len(dList):
                setattr(self, key, dList[i])
            i += 1


@dataclass
class UserEntry(DataEntry):
    userId:             int = None
    userName:           str = None
    userType:           int = None
    email:              str = None
    password:           str = None
    registrationDate:   int = -1


@dataclass
class LotEntry(DataEntry):
    lotId:              int = None
    lotName:            str = None
    lotType:            int = None
    fullness:           int = None
    location:           str = None


@dataclass
class AvailabilityEntry(DataEntry):
    lotId:              int = None            
    date:               int = -1
    fullness:           int = None


@dataclass
class SessionEntry(DataEntry):
    sessionId:          int = None
    lotId:              int = None
    userId:             int = None
    startTime:          int = -1
    endTime:            int = None


class Database:
    """
    Interface class to the sqlite3 database has forwarder functions
    for the User, Lot, Availability, and Session objects within the 
    database. Forwarders are for functions get_*, create_*, update_*
    """


    def __init__(self, database):
        """
        Initialize connection and create the SQLite 
        cursor object needed for executing statements
        """

        self._connection = sql.connect(database)
        self._cursor = self._connection.cursor()


    def __del__(self):
        """
        On object deletion close the connection so the 
        file can be used
        """

        self._connection.close()


    def run_script(self, script_name):
        """
        Execute a SQL script file on the  database and 
        commit the changes, if any. Returns[0] is the 
        success state of the execution and Returns[1] is
        the results returned
        """

        with open(script_name, 'r') as sql_file:
            sql_script = sql_file.read()

            try:
                results = self._cursor.executescript(sql_script)
                self._connection.commit()
                return [True, results.fetchall()]

            except sql.Error as exception:
                print('Error: ' + str(exception))

        return [False, []]


    def run(self, query, params={}):
        """
        Execute a SQL query on the  database and 
        commit the changes, if any. Returns[0] is the 
        success state of the execution and Returns[1] is
        the results returned
        """

        try:
            results = self._cursor.execute(query, params)
            self._connection.commit()
            return [True, results.fetchall()]

        except sql.Error as exception:
            print('Error: ' + str(exception))
        
        return [False, []]


    def reset_tables(self):
        """
        Reset all tables in the database
        """
        dir = os.path.dirname(__file__)
       
        print('Dropping old tables')
        self.run_script(os.path.join(dir, 'drop_tables.sql'))

        print('Creating tables')
        self.run_script(os.path.join(dir, 'create_tables.sql'))

        print('Copying test data')
        self.run_script(os.path.join(dir, 'data.sql'))


    def generate_select_query(self, query, args):
        """
        Create a select query which can be used with 
        kwargs to replace the values
        """

        query = 'SELECT * FROM ' + query 
        conditions = ''

        for arg in args:

            if conditions == '':
                conditions = ' WHERE ' + arg + '=:' + arg
            else:
                conditions += ' AND ' + arg + '=:' + arg

        return query + conditions


    def generate_insert_query(self, query, args):
        """
        Create an insert query which can be used with 
        kwargs to replace the values
        """     

        query = 'INSERT INTO ' + query + '('

        for arg in args:

            if list(args.keys())[0] is not arg:
                query += ',' + arg
            else:
                query += arg

        query += ') VALUES ('

        for arg in args:

            if list(args.keys())[0] is not arg:
                query += ',:' + arg
            else:
                query += ':' + arg

        return query + ')'


    def generate_update_query(self, query, args, argsTo):
        """
        Create an update query which can be used with 
        kwargs to replace the values
        """

        query = 'UPDATE ' + query
        columns = ''
        conditions = ''

        # Set the columns values
        for arg in argsTo:
            
            if columns == '':
                columns = ' SET ' + arg + '=:' + arg + 'To'
            else: 
                columns += ', ' + arg + '=:' + arg + 'To'

        # Set the conditions
        for arg in args:

            if conditions == '':
                conditions = ' WHERE ' + arg + '=:' + arg
            else:
                conditions += ' AND ' + arg + '=:' + arg

        return query + columns + conditions


    def append_dict_str(self, dictionary, string):
        """
        Foreach key in the dictionary concat the string
        to the key name
        """

        for key in dictionary.copy():
            dictionary[key + string] = dictionary.pop(key)


    def get_table_rows(self, table, entry, dataType):
        """
        Get rows from table using entry object as a hint for
        what attributes to look for, entry should have it's type
        passed into dataType
        """

        query = self.generate_select_query(table, entry.get_params())
        results = self.run(query, entry.get_params())

        for i in range(0, len(results[1])):
            entry = dataType()
            entry.assign_list(results[1][i])
            results[1][i] = entry

        return results
    

    def create_table_row(self, table, entry):
        """
        Create a row in table using the entry object to fill in
        the values
        """

        query = self.generate_insert_query(table, entry.get_params())
        return self.run(query, entry.get_params())


    def update_table_rows(self, table, entryFrom, entryTo):
        """
        Update rows in table using the entryFrom to hint at what row 
        values to select from, and using entryTo to change the values to
        """

        paramsFrom = entryFrom.get_params()
        paramsTo = entryTo.get_params()

        query = self.generate_update_query(table, paramsFrom, paramsTo)

        self.append_dict_str(paramsTo, 'To')
        params = paramsFrom | paramsTo

        return self.run(query, params)


    def get_users(self, entry = UserEntry()):
        return self.get_table_rows('user', entry, UserEntry)


    def update_users(self, entryFrom, entryTo):
        return self.update_table_rows('user', entryFrom, entryTo)


    def create_user(self, entry):
        return self.create_table_row('user', entry)


    def get_lots(self, entry = LotEntry()):
        return self.get_table_rows('lot', entry, LotEntry)


    def create_lot(self, entry):
        return self.create_table_row('lot', entry)


    def update_lots(self, entryFrom, entryTo):
        return self.update_table_rows('lot', entryFrom, entryTo)


    def get_availabilities(self, entry = AvailabilityEntry()):
        return self.get_table_rows('availability', entry, AvailabilityEntry)


    def create_availability(self, entry):
        return self.create_table_row('availability', entry)


    def update_availabilities(self, entryFrom, entryTo):
        return self.update_table_rows('availability', entryFrom, entryTo)


    def get_sessions(self, entry = SessionEntry()):
        return self.get_table_rows('session', entry, SessionEntry)


    def create_session(self, entry):
        return self.create_table_row('session', entry)


    def update_sessions(self, entryFrom, entryTo):
        return self.update_table_rows('session', entryFrom, entryTo)


if __name__ == "__main__":
    db = Database('view_park.db')

    db.reset_tables()

    # Create test user
    db.create_user(
        UserEntry(
            userName='Test-User', 
            email='example@gmail.com', 
            password='test123'
            )
        )

    db.create_lot(
        LotEntry(
            lotName="test Lot",
            location="in the server space",
            fullness=0
            )
        )

    # First user created, so try updating 
    # the userName to lowercase
    db.update_users(
        UserEntry(
            userId=2
            ),
        UserEntry(
            userName='test-lowercase'
            )
        )

    print(db.get_users())
