<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup page</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<div class="box">
	<form action="signup" method="post">
		<span class="text-center">Sign up</span>
	<div class="input-container">
		<input type="text" id="fullName" name="fullName">
		<label>Full name</label>		
	</div>
	<div class="input-container">		
		<input type="email" id="email" name="email">
		<label>Email</label>
	</div>
	<div class="input-container">		
		<input type="text" id="username" name="username">
		<label>Username</label>
	</div>
	<div class="input-container">		
		<input type="password" id="password" name="password">
		<label>Password</label>
	</div>
	<input type="submit" class="btn" value="Sign up">
	<a href="login.jsp">Login page</a>
	<br>
	<p style="color: green;">${tb}</p>
</form>	
</div>
</body>
</html>