<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- APlayer CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="icon" href="https://t3.ftcdn.net/jpg/04/54/66/12/360_F_454661277_NtQYM8oJq2wOzY1X9Y81FlFa06DVipVD.jpg" type="image/icon type">
<link rel="stylesheet" type="text/css" href="css/login.css">
	<style>


.dropbtn {
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  border-radius: 50px;
  width:150px;
   background-color: rgba(220,220,220,0.1);
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;

}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: rgba(0,0,0,0.5);
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  border-radius: 15px;
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  font-size: 20px;
  border-radius: 15px;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {background-color: rgba(0,0,0,0.2);}

.dropdown{
 margin-left: 115px;
}

#btnright{
margin-right: 115px;
}
.text-center{
	color:#fff;	
	text-transform:uppercase;
    font-size: 23px;
    margin: -50px 0 80px 0;
    display: block;
    text-align: center;
}
.box{
	position:absolute;
	left:50%;
	top:50%;
	transform: translate(-50%,-50%);
    background-color: rgba(0, 0, 0, 0.89);
	border-radius:3px;
	padding:70px 100px;
}

.input-container{
	position:relative;
	margin-bottom:25px;
}
.input-container label{
	position:absolute;
	top:0px;
	left:0px;
	font-size:16px;
	color:#fff;	
    pointer-event: none;
	transition: all 0.5s ease-in-out;
}
.input-container input{ 
  border:0;
  border-bottom:1px solid #555;  
  background:transparent;
  width:100%;
  padding:8px 0 5px 0;
  font-size:16px;
  color:#fff;
}
.input-container input:focus{ 
 border:none;	
 outline:none;
 border-bottom:1px solid #e74c3c;	
}
.btn{
	color:#fff;
	background-color:#e74c3c;
	outline: none;
    border: 0;
    color: #fff;
	padding:10px 20px;
	text-transform:uppercase;
	margin-top:50px;
	border-radius:2px;
	cursor:pointer;
	position:relative;
}
</style>
    <title>Songs list</title>
 	</head>
	<body style="background-image: linear-gradient(black,darkgrey);">
	}
	<%
    	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
  		response.setHeader("Pragma","no-cache");
  		response.setHeader("Expires","0");
   		if (session.getAttribute("name")==null){
   			response.sendRedirect("login.jsp");
   			return;
   		}
    %>
    <%@ page import="java.util.ArrayList, entity.Song" %>
    <%	ArrayList<Song> myList = (ArrayList<Song>)request.getSession().getAttribute("songList");%>
<div class="navbar">			
				
						<div class="dropdown">
  <button class="dropbtn">Menu</button>
  <div class="dropdown-content">
    <a href="user-page.jsp" style="text-decoration: none;color: hotpink;"><i class="fa fa-home fa-fw icon"></i> Home</a>
    <a href="SongServlet" style="text-decoration: none;color: hotpink;"><i class="fa fa-list-ul icon" aria-hidden="true"></i> Songs</a>
  </div>
</div>
		
		<div class="dropdown" id="btnright">		
		<button class="dropbtn" style="font-size: 16px;">${name}</button>
  <div class="dropdown-content">
    <a href="userProfile.jsp" style="text-decoration: none;color: hotpink;"><i class="fa fa-address-book-o" aria-hidden="true"></i> Account</a>
    <a href="CollectionServlet" style="text-decoration: none;color: hotpink;"><i class="fa fa-heart" aria-hidden="true"></i> My songs</a> 
    <a href="logout" style="text-decoration: none;color: hotpink;"><i class="fa fa-sign-out icon" aria-hidden="true"></i> Logout</a>
  </div>
</div>		
	
</div>
		
<div class="main">
	
	
	<div class="box">
	<form action="update" method="post">
		<span class="text-center">User's information</span>
	<div class="input-container">
	<br>
		<input type="text" id="fullnamee" name="fullnamee" value="${name}">
		<br>
		<label>Name</label>		
	</div>
	<div class="input-container">
	<br>
		<input type="text" id="emaill" name="emaill" value="${email}">
		<br>
		<label>Email</label>		
	</div>
	<div class="input-container">	
	<br>	
		<input type="text" id="userNamee" name="userNamee" value="${username}" readonly>
		<br>
		<label>Username</label>
	</div>
	<div class="input-container">	
	<br>	
		<input type="password" id="passwordd" name="passwordd" value="********">
		<br>
		<label>Password</label>
	</div>
	<input type="submit" class="btn" value="Change info">
	<p style="color: green;">${notif}</p>
</form>	
</div>
	
	
	
</div>


	</body>
</html>