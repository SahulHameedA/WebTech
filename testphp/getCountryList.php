<html>
<body>

<?php
     
     	    include_once 'common/connection.php';
      
	/* formulate the SQL query for execution */            
            $sql = "SELECT Country_Name FROM country_list ORDER BY Country_Name" ;
               
	/* execute the query on the sql connection */            
            $result = mysql_query( $sql, GetMyConnection() );
            
            if(! $result ) {
               die('Could not fetch data: ' . mysql_error());
            }
            
	   
	   echo "<table> <tr><th>Country Name</th></tr>";
	    
    	/* use the result */
	   while($row = mysql_fetch_assoc($result)) {		
	   	echo "<tr> <td>". $row['Country_Name']. "</td> </tr>";	
	    } 
    	   echo "</table> ";             

	/* close the MySQL connection */            
	   CleanUpDB();

?>   

</body>
</html>