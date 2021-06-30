<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!doctype html>
<html lang="en">
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
<title>Login Page</title>
</head>
 <style type="text/css">
.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	/* align-items:center; */
	margin-top: 150px;
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

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-top: 3px;
	margin-bottom: 3px;
}
.msg-div
{
background-color:lime;
}

</style> 
<body>

 <div align="center" class="container">
		<div>
		
		<b>	<c:out value="${heading}"></c:out></b>
		
			<form action="search" method="post">
				<br>
				<table>
					 <%-- 	<tr>	<c:out value="${input}"></c:out>  </tr>  --%>
					<tr>
						<td>User ID :</td>
						<td><input type="text" name="username" class="form-control" id="username" minlength=5 maxlength=50></td>

					</tr>
					<tr>
						<td>Password :</td>
						<td><input type="password" name="password"
							class="form-control" id="password" minlength=5 maxlength=50> <br></td>
					</tr>
					<tr>
						<th></th>
						<td align="center"><input type="submit" value="Sign In"></td>
				</table>
			</form>
		</div>
	</div>


	<br>
	<br>
	
	
	<div class="container">
		
		
	 	<form action="saveLogin" method="POST">
			<br>
			
			<%-- 	<c:out value="${page}"></c:out> 
				<c:out value="${savelogin}"></c:out>  
					<c:out value="${msg}"></c:out>  --%> 
					<b>Register here...</b>
					<br>
				Set User ID :
					<input type="text" name="username" minlength=5 maxlength=50/>
				
					Set Password :
					<input type="text" name="password" minlength=5 maxlength=50/> <br>
				
					<%-- <a href='<c:url value='/saveLogin'></c:url>'>Sign Up</a> --%>
					<input type = "submit" value = "Sign Up">
					
					
		</form> 
	
	</div>
		<div class="container-fluid" id="msg-div">
		<c:out value="${msg}"></c:out>
			<c:out value="${todo.username}" />
			<c:out value="${todo.password}" />
		</div>


</body>
</html>