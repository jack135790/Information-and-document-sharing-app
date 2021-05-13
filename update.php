<!--nasfk-->
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<!-- <meta http-equiv="refresh" content="2"> -->
	<link rel="stylesheet" href="Addons/updateNnewpass.css">
	<title>Add Details</title>
</head>
<body>		
	
	<?php
		// include 'session.php';
	?>
    <p class="pupdate">Edit Profile</p>
    <hr class=hratten>
    <div class="update">
	<div class="tags">
		<ul>
			<li>Pen No: </li>
			<li>Reg No: </li>
			<li>Name: </li>
			<li>Classs/Division:</li>
			<li>Roll No:</li>
			<li>Mobile Number: </li>
			<li>Address: </li>
		</ul>
	</div>
	
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

			echo '<script>
		function validate_mobile()
		{
			var mobile = document.getElementById("MobNo").value.length;
			if(mobile < 0 || mobile > 10)
			{
				alert("error mobile no");
				return false;
			}
			else
			{
				return true;
			}
			
		}
	</script>';
			echo'<div class="container">
				<form action="" method="POST" onsubmit="return validate_mobile();">
					<br><ul class=\"ulright\">
					<li>'.$row["UserId"].'</li>
					<li>'.$row["RegNo"].'</li>
					<li><span>'.$row["Fname"].' '.$row["Lname"].'</span><br></li>
					<li><span>'.$row["Class"].' '.$row["Division"].'</span><br></li>
					<li><span>'.$row["RollNo"].'</span><br></li>
					<li><input type="number" id="MobNo" name="MobNo" required value="'.$row["MobNo"].'"><br></li>
					<li><input type="text" name="Addr" value="'.$row["Addr"].'"><br></li>
					<input name="update" type="submit" value="Update">
					<input name="pass" type="submit" value="Change Pass"></ul>
				</form> 
			</div>';
			mysqli_close($conn);
		}

		if (isset($_POST['pass'])) {
			header('Location: home.php?page=new_pass.php');
		}

		if (isset($_POST['update'])) {update();}
	
		
		function update() {


			$user = 'root';
			$pass = '';
			$db = 'students';

			$conn = new mysqli('localhost', $user, $pass, $db) or die("Unable to connect to server".$db);


			$sql = "UPDATE `profile` SET MobNo=".$_POST['MobNo'].", Addr=\"".$_POST['Addr']."\" WHERE UserId=\"".$_SESSION['name']."\"";

			if (mysqli_query($conn, $sql)) {
				echo "Updated Profile, redirecting to home...";
			}
	
			else {
				echo "Error: ".mysqli_error($conn);
			}

			mysqli_close($conn);

			header("Location: home.php?page=update.php");
		}
		
		?>
        </div>

</body>
</html>