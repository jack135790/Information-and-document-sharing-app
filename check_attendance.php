<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Attendance</title>
	<link rel="stylesheet" href="Addons/attendance.css">

</head>
<body>
	
	<p class="patten">Attendance Record</p>
    <hr class="hratten">
	<?php
		fetch();
		function fetch() {
			
			$user = 'root';
			$pass = '';
			$db = 'students';

			$conn = new mysqli('localhost', $user, $pass, $db) or die("Unable to connect to server".$db);

			$get_all = "select * from profile where UserId=\"".$_SESSION['name']."\"";
					
			$data = mysqli_query($conn, $get_all) or die("No records found.");

			$row = mysqli_fetch_assoc($data);

			echo "<div class=\"table\"><table><tr><th>Name</th><th>Class-Div-Roll</th><th>MP</th><th>MP-T</th><th>CN</th><th>CN-T</th><th>AOS</th><th>AOS-T</th><th>DBMS</th><th>DBMS-T</th><th>TCS</th><th>TCS-T</th><th>Attended</th><th>Total</th><th>Percentage</th></tr>
				<tr><td>".$row["Fname"]." ".$row["Lname"]."</td><td>".$row["Class"]." ".$row["Division"]." ".$row["RollNo"]."</td><td>".$row["S1"]."</td><td>".$row["S1t"]."</td><td>".$row["S2"]."</td><td>".$row["S2t"]."</td><td>".$row["S3"]."</td><td>".$row["S3t"]."</td><td>".$row["S4"]."</td><td>".$row["S4t"]."</td><td>".$row["S5"]."</td><td>".$row["S5t"]."</td><td>".$row["Attended"]."</td><td>".$row["Total"]."</td><td>".$row["Percent"]."</td></tr></table></div>";
			mysqli_close($conn);
		}
	?>

</body>
</html>
