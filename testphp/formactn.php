<html>
<body>

<?php
     
     	    include_once 'common/connection.php';
      
            if(! get_magic_quotes_gpc() ) {
               $user_name = addslashes ($_POST['email']);
            }else {
               $user_name = $_POST['email'];
            }
            
            $password = $_POST['fname'];

	    $ver_code = $_POST['dob'];

	/* formulate the SQL query for execution */            
            $sql = "INSERT INTO users ". "(username,password, ver_code, 
               verified) ". "VALUES('$user_name','$password',$ver_code, 0)";
               
	/* execute the query on the sql connection */            
            $retval = mysql_query( $sql, GetMyConnection() );
            
            if(! $retval ) {
               die('Could not enter data: ' . mysql_error());
            }
            
            echo "Entered data successfully\n";

	/* close the MySQL connection */            
	   CleanUpDB();

?>   

</body>
</html>