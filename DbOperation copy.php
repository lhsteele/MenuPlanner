<?php 

class DbOperation {
	private $con;

	//constructor
	function __construct() {
		require_once dirname(__FILE__) . '/Config.php';
		require_once dirname(__FILE__) . '/DbConnect.php';
		//opening db connection
		$db = new DBConnect()
		$this->con = #db->connect();
	}

	//select ALL from table 'User'
	$sql = "SELECT * FROM User";

	//check if there are results
	if ($result = mysqli_query($con, $sql)) {
		//if so, then create a results array and a temporary one to hold data
		$resultArray = array();
		$tempArray = array();

		//loop through each row in the result set
		while($row = $result->fetch_object()) {
			//add each row into our results array
			$tempArray = $row;
			array_push($resultArray, $tempArray);
		}

		//encode the array to JSON and output results
		echo json_encode($resultArray);
	}

	mysqli_close($con)
}