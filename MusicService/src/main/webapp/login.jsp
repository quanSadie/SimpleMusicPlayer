<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<script type="text/javascript">function preventBack(){window.history.forward()};
        setTimeout("preventBack()",0);
        	window.onunload=function(){null};
        </script>
<div class="box">
	<form action="login" method="post">
		<span class="text-center">Login</span>
	<div class="input-container">
		<input type="text" id="userName" name="userName">
		<label>Username</label>		
	</div>
	<div class="input-container">		
		<input type="password" id="password" name="password">
		<label>Password</label>
	</div>
	<input type="submit" class="btn" value="Log in">
	<a href="signup.jsp">Register here</a>
	<br>
	<p style="color: Red;">${error}</p>
</form>	
</div>
</body>
</html>