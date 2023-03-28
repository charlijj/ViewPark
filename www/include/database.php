<?php

include_once ('defines.php');

class DataEntry{


    function get_params(){
        /*
        Return the non None attributes of the class
        */

        $dParams = array();

        foreach(get_object_vars($this) as $key => $value){

            if (isset($value))
                $dParams[$key] = $value;
		}	

        return $dParams;
	}


    function set_params($dParams){
        /*
        Set the attributes of the class from the dParams
      	*/

		foreach($dParams as $key => $value)
            $this->{$key} = $value;
	}


    function assign_list($dList){
        /*
        Assign attributes in order of the list 
        */

        foreach($dList as $key => $value)
			$this->{$key} = $value;
	}
}


class UserEntry extends DataEntry{
    public $userId				= null;
    public $userName   			= null;
    public $userType       		= null;
    public $email          		= null;
    public $password        	= null;
    public $registrationDate	= null;
}


class LotEntry extends DataEntry{
    public $lotId	            = null;
    public $lotName            	= null;
    public $lotType            	= null;
    public $fullness           	= null;
    public $location           	= null;
}


class AvailabilityEntry extends DataEntry{
    public $lotId              	= null;            
    public $date               	= null;
    public $fullness           	= null;
}


class SessionEntry extends DataEntry{
    public $sessionId          	= null;
    public $lotId              	= null;
    public $userId             	= null;
    public $startTime          	= null;
    public $endTime            	= null;
}


class Database{
    /*
    Interface class to the sqlite3 database has forwarder functions
    for the User, Lot, Availability, and Session objects within the 
    database. Forwarders are for functions get_*, create_*, update_*
   	*/
	private $connection = null;

    function __construct($database = null){
        /*
        Initialize connection and create the SQLite 
        cursor object needed for executing statements
        */

		// Default connection point
		if (!isset($database)){
			global $project_home;
			$database = $project_home.'/sql/viewpark.db';
		}

		try{
        	$this->connection = new PDO("sqlite:$database");
		
		}catch(PDOException $e){
			print($e->getMessage());
		}
	}

    function __destruct(){
        /*
        On object deletion close the connection so the 
        file can be used
        */

        $connection = null;
	}

    function run_script($script_name){
        /*
        Execute a SQL script file on the  database and 
        commit the changes, if any. Returns[0] is the 
        success state of the execution and Returns[1] is
        the results returned
        */
		$sql_file = fopen($script_name, 'r');
		$sql_script = fread($sql_file, filesize($script_name));
		fclose($sql_file);

		try{
			$success = $this->connection->exec($sql_script);
			
			return [$success, []];

		}catch(PDOException $e){
        	print($e->getMessage());
		}

        return [false, []];
	}

    function run($query, $params=[]){
        /*
        Execute a SQL query on the  database and 
        commit the changes, if any. Returns[0] is the 
        success state of the execution and Returns[1] is
        the results returned
        */

        try{
            $stmt = $this->connection->prepare($query);

			// Bind the parameters to the statement
			foreach($params as $key => $value)
				if (is_numeric($value) && !is_string($value))
					$stmt->bindValue($key, $value, PDO::PARAM_INT);
				else
					$stmt->bindValue($key, $value, PDO::PARAM_STR);

            $success = $stmt->execute();
		
            return [$success, $stmt->fetchAll()];

        }catch(PDOException $e){
			echo $e->getMessage();
		}        

        return [false, []];
	}


    function reset_tables(){
        /*
        Reset all tables in the database
        */

		global $project_home;

        $this->run_script($project_home.'/sql/drop_tables.sql');
        $this->run_script($project_home.'/sql/create_tables.sql');
	}


    function generate_select_query($query, $args){
        /*
        Create a select query which can be used with 
        kwargs to replace the values
        */

        $query = 'SELECT * FROM ' . $query;
        $conditions = '';

        foreach($args as $key => $value){

            if ($conditions == '')
                $conditions = ' WHERE ' . $key . '=:' . $key;
            else
                $conditions .= ' AND ' . $key . '=:' . $key;
		}
		
        return $query . $conditions;
	}


    function generate_insert_query($query, $args){
        /*
        Create an insert query which can be used with 
        kwargs to replace the values
        */     

        $query = 'INSERT INTO ' . $query . '(';
		$columns = '';

        foreach($args as $key => $value){

            if ($columns != '')
                $columns .= ',' . $key;
            else
                $columns .= $key;
		}

        $query .= $columns . ') VALUES (';
		$columns = '';

        foreach($args as $key => $value){

            if ($columns != '')
                $columns .= ',:' . $key;
            else
                $columns .= ':' . $key;
		}

        return $query . $columns . ')';
	}


    function generate_update_query($query, $argsFrom, $argsTo){
        /*
        Create an update query which can be used with 
        kwargs to replace the values
        */

        $query = 'UPDATE ' . $query;
        $columns = '';
        $conditions = '';

        # Set the columns values
        foreach($argsTo as $key => $value){
            
            if ($columns == '')
                $columns = ' SET ' . $key . '=:' . $key . 'To';
            else
                $columns .= ', ' . $key . '=:' . $key . 'To';
		}

        # Set the conditions
        foreach($argsFrom as $key => $value){

            if ($conditions == '')
                $conditions = ' WHERE ' . $key . '=:' . $key;
            else
                $conditions .= ' AND ' . $key . '=:' . $key;
		}

        return $query . $columns . $conditions;
	}


    function append_dict_str($arr, $str){
        /*
        Foreach key in the dictionary concat the string
        to the key name
        */

		$copy = $arr;

        foreach($copy as $key => $value){
            $arr[$key . $str] = $arr[$key];
			unset($arr[$key]);
		}

		return $arr;
	}


    function get_table_rows($table, $entry, $dataType){
        /*
        Get rows from table using entry object as a hint for
        what attributes to look for, entry should have it's type
        passed into dataType
        */

        $query = $this->generate_select_query($table, $entry->get_params());
        $results = $this->run($query, $entry->get_params());

		for($i = 0; $i < count($results[1]); $i += 1){
            $entry = new $dataType;
            $entry->assign_list($results[1][$i]);
            $results[1][$i] = $entry;
		}

        return $results;
	}
    

    function create_table_row($table, $entry){
        /*
        Create a row in table using the entry object to fill in
        the values
        */

        $query = $this->generate_insert_query($table, $entry->get_params());

        return $this->run($query, $entry->get_params());
	}


    function update_table_rows($table, $entryFrom, $entryTo){
        /*
        Update rows in table using the entryFrom to hint at what row 
        values to select from, and using entryTo to change the values to
        */

        $paramsFrom = $entryFrom->get_params();
        $paramsTo = $entryTo->get_params();
		
        $query = $this->generate_update_query($table, $paramsFrom, $paramsTo);
		
        $paramsTo = $this->append_dict_str($paramsTo, 'To');
        $params = array_merge($paramsFrom, $paramsTo);
		
        return $this->run($query, $params);
	}


    function get_users($entry = null){
	
		if(!isset($entry))
			$entry = new UserEntry;

    	return $this->get_table_rows('user', $entry, UserEntry::class);
	}


    function update_users($entryFrom, $entryTo){
        return $this->update_table_rows('user', $entryFrom, $entryTo);
	}


    function create_user($entry){
        return $this->create_table_row('user', $entry);
	}


    function get_lots($entry = null){

		if(!isset($entry))
			$entry = new LotEntry;

        return $this->get_table_rows('lot', $entry, LotEntry::class);
	}


    function create_lot($entry){
        return $this->create_table_row('lot', $entry);
	}


    function update_lots($entryFrom, $entryTo){
        return $this->update_table_rows('lot', $entryFrom, $entryTo);
	}


    function get_availabilities($entry = null){

		if(!isset($entry))
			$entry = new AvailabilityEntry;

        return $this->get_table_rows('availability', $entry, AvailabilityEntry::class);
	}


    function create_availability($entry){
        return $this->create_table_row('availability', $entry);
	}


    function update_availabilities($entryFrom, $entryTo){
        return $this->update_table_rows('availability', $entryFrom, $entryTo);
	}


    function get_sessions($entry = null){

		if(!isset($entry))
			$entry = new SessionEntry;

        return $this->get_table_rows('session', $entry, SessionEntry::class);
	}


    function create_session($entry){
        return $this->create_table_row('session', $entry);
	}


    function update_sessions($entryFrom, $entryTo){
        return $this->update_table_rows('session', $entryFrom, $entryTo);
	}
}

/*
echo "PASS THROUGH GOOD";

$db = new Database();
$db->reset_tables();


$user = new UserEntry;
$user->userName = 'Test-User';
$user->email = 'example@gmail.com';
$user->password = 'test123';
$db->create_user($user);

$user = new UserEntry;
$user->userName = 'Test-User2';
$user->email = 'example2@gmail.com';
$user->password = '2test123';
$db->create_user($user);

$lot = new LotEntry;
$lot->lotName = "test Lot";
$lot->location = "in the server space";
$lot->fullness = 0;
$db->create_lot($lot);


$hint = new UserEntry;
$hint->userId = 2;
$to = new UserEntry;
$to->userName = "test-user2 lowercase";
$db->update_users($hint, $to);

foreach($db->get_users()[1] as $user)
	echo '<br>user:'.$user->userName.'<br>';

foreach($db->get_lots()[1] as $lot)
	echo '<br>lot:'.$lot->lotName.'<br>';


echo "DONE";
*/
?>
