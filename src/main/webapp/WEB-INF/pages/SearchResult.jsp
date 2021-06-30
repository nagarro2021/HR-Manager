
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%-- <%@ page import="com.Model.Flights" %> --%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style type="text/css">
.result {
	width: 100%;
	border-collapse: collapse;
	background-color: #f2f2f2;
}

.result td {
	text-align: center;
	height: 25px;
	border: 1px solid black;
}

th {
	text-align: center;
	height: 50px;
	border: 1px solid black;
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
</style>
<meta charset="ISO-8859-1">
<title>Employee List</title>
</head>
<body>
	<br>

	<header>
		<div>
			<table width="100%">
				<tr>
					<td>
						<h2>Employee Management System</h2>
					</td>
					
					
					<td align="right">
					<h2>Welcome 	<c:out value="${username}"></c:out>!</h2>
					</td>
				
				</tr>
				<tr>
				
				<td align="right">
						<form action="update" method="post">
							<input type="submit" value="Upload Employee Details" />
						</form>
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

	<table class="result" id="result">
		<thead>
			<tr>
				<th>EMPLOYEE CODE</th>
				<th>EMPLOYEE NAME</th>
				<th>LOCATION</th>
				<th>EMAIL</th>
				<th>DATE OF BIRTH</th>
				<th>ACTION</th>

			</tr>
		</thead>
		<tbody id="result1">

			<tr id="tr1">
				<td id="empCode"></td>
				<td id="empName"></td>
				<td id="empLocation"></td>
				<td id="empEmail"></td>
				<td id="empDOB"></td>
			</tr>
		</tbody>
	</table>
	<br>

	<form action="input" id="form_id">
		<input type="hidden" id="hidden_form" name="hidden_form" />
	</form>


</body>
<footer>Copyright 2020-21 by Fresher Training</footer>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
<script type="text/javascript">
	
	 	const request = new XMLHttpRequest();
		request.open("GET", "http://localhost:6060/employees");
		request.send();
		request.onload=()=>{
			if(request.status===200){
			console.log(JSON.parse(request.response));
			
		       var response1 = JSON.parse(request.response);
		      var n=response1.length;
		      console.log("SIZE OF ARRAY");
		      console.log(n);
		      
		      
		      response1.forEach(myFunction);
		      
		      function myFunction(item, index) {
	    	document.getElementById("result").innerHTML += "<tr id="+item.employeeCode+"><td>"+ item.employeeCode+"</td>"+"<td>"+ item.employeeName+"</td>"+"<td>"+ item.employeeLocation+"</td>"+"<td>"+ item.employeeEmail+"</td>"+"<td>"+ item.employeeDOB+"</td>" +"<td><button class='btn btn-warning'>Edit</button></td></tr>";
	    	console.log(document.getElementById(item.employeeCode));
	    	document.getElementById(item.employeeCode).getElementsByTagName("button")[0].setAttribute("onclick","edit("+item.employeeCode+")");
		      }
		}
			else
				{
				console.log('error ${request.status}')
				}
		}  
		
	     function edit(employeecode)
			{
 	  console.log(employeecode);
 	  console.log("clicked");
 	 document.getElementById("hidden_form").value=employeecode;
 	 
 	document.getElementById("form_id").submit();
 	  }
	   
	     
	     

	//	console.log(window);
	
	</script>

</html>
