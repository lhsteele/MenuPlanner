<?php 

class DbConnect {
	private $con;

	function __construct() {

	}

	//establish db connection
	//return db connection handler

	function connect() {
		require_once 'Config.php';

		//connecting to mysql db
		$this->con = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

		//check for db connection error
		if (mysqli_connect_errno()) {
			echo "Failed to connect to MySQL: " . mysqli_connect-error();
		}

		//returning connection resource 
		return $this->con;
	}
}