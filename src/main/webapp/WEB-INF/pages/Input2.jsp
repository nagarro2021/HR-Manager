
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

input[type=submit] {
	background-color: #1E90FF;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #4169E1;
}

input[type=date], select {
	width: 100%;
	padding: 12px; 
	border: 1px solid #ccc; 
	border-radius: 4px; 
	margin-top: 3px; 
	margin-bottom: 3px; 
}
</style>
<title>Add Employee</title>
</head>
<body>

		<header>
			<div>
				<table width="100%">
					<tr>
					<td>
					<h3>Add Employee</h3>
					</td>
						<td align="right">
							<form action="SignOut" method="post">
								<input type="submit" value="SignOut" />
							</form>
						</td>
					</tr>
				</table>
			</div>
		</header>
		<div align="center" class="container">
			<form action="search" method="post">
				<table>
					<tr>
						<td>Employee Code:</td>
						<td><input type="text" name="code" /></td>
					</tr>
					<tr>
						<td>Employee Name :</td>
						<td><input type="text" name="name"  maxlength=100 required/></td>
					</tr>
					<tr>
						<td>Employee Location :</td>
						<td><input type="text" name="location"  maxlength=500/></td>
					</tr>
					<tr>
						<td>Employee Email :</td>
						<td><input type="email" name="email"  maxlength=100/></td>
					</tr>
					<tr>
						<td>Employee DOB :</td>
						<td><input type="date" name="dob"  /></td>
					</tr>
					<tr>
						<td></td>
						<td align="right"><input type="submit" id="btn_save" value="Save" /></td>
					</tr>
				</table>
			</form>
		</div>


</body>
<footer>Copyright 2020-21 by Fresher Training</footer>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
<script type="text/javascript">
	     
	  	const request2 = new XMLHttpRequest();
		request2.open("PUT", "http://localhost:6060/employees");
		request2.send();
		request2.onload=()=>{
			if(request2.status===200){
			console.log(JSON.parse(request2.response));
			
		       var response1 = JSON.parse(request2.response);
		      var n=response1.length;
		      console.log("SIZE OF ARRAY");
		      console.log(n);
		      response1.forEach(update())
		      
		}
			else
				{
				console.log('error ${request.status}')
				}
		}   
	     
	function update(){
	     
	document.getElementById("btn_save").submit();
	} 

</script>
</html>