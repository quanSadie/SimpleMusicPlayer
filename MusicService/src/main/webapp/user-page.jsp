<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Music streaming service</title>
    <link rel="stylesheet" type="text/css" href="css/user-style.css">
    
     <link href="https://fonts.googleapis.com/css?family=Kulim+Park&display=swap" rel="stylesheet">
    
     <link href="https://fonts.googleapis.com/css?family=Great+Vibes|Mountains+of+Christmas|Shadows+Into+Light&display=swap" rel="stylesheet"> 
        
     <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        
       <link href="https://fonts.googleapis.com/css?family=Hanalei|Indie+Flower|Orbitron|Righteous&display=swap" rel="stylesheet">
    <link rel="icon" href="https://t3.ftcdn.net/jpg/04/54/66/12/360_F_454661277_NtQYM8oJq2wOzY1X9Y81FlFa06DVipVD.jpg" type="image/icon type">
   <link rel="stylesheet" type="text/css" href="css/homepage.css">
    <style>
    $primary: #11998e;
$secondary: #38ef7d;
$white: #fff;
$gray: #9b9b9b;
.form__group {
  position: relative;
  padding: 15px 0 0;
  margin-top: 10px;
  width: 50%;
}

.form__field {
  font-family: inherit;
  width: 100%;
  border: 0;
  border-bottom: 2px solid $gray;
  outline: 0;
  font-size: 1.3rem;
  color: $white;
  padding: 7px 0;
  background: transparent;
  transition: border-color 0.2s;

  &::placeholder {
    color: transparent;
  }

  &:placeholder-shown ~ .form__label {
    font-size: 1.3rem;
    cursor: text;
    top: 20px;
  }
}



.glow {
  font-size: 80px;
  color: green;
  text-align: center;
  -webkit-animation: glow 1s ease-in-out infinite alternate;
  -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
}

@-webkit-keyframes glow {
  from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
  }
  to {
    text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
  }
}
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

.sidebar{
display: block;
text-align: center;
justify-content: center;
align-items: center;
justify-items: center;
}
.sidebar div{
border: none;
text-align: center;
justify-content: center;
align-items: center;
justify-items: center;
height: 130px;
width: 400px;
display: flex;
}
#div11{
border-top-left-radius: 15px;
border-top-right-radius: 15px;
}
#div12{
border-bottom-left-radius: 15px;
border-bottom-right-radius: 15px;
}
.sidebar div a{
text-align: center;
align-items: center;
justify-content: center;
justify-items: center;
}

.my-div {
    background-color: rgba(0,0,0,0.7);
    width: 200px;
    height: 200px;
}
a.fill-div {
    display: block;
    height: 100%;
    width: 100%;
    text-decoration: none;
    padding-top: 20px;
}
.sidebar div:hover {display: block; background: rgba(120,120,120,0.5);}
    </style>   
    </head>
    <body style="background-color: rgba(0,0,0,0.9);">
    <script type="text/javascript">function preventBack(){window.history.forward()};
        setTimeout("preventBack()",0);
        	window.onunload=function(){null};
        </script>
        <%
    	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
  		response.setHeader("Pragma","no-cache");
  		response.setHeader("Expires","0");
   		if (session.getAttribute("name")==null){
   			response.sendRedirect("login.jsp");
   		}
    %>


  <div class="navbar">			
				
						<div>
    					</div>
		
						<div>
						</div>
		
		
		<div class="sidebar">		
  		 	<div id="div11" class="divitem my-div"><a class="fill-div" href="user-page.jsp" style="text-decoration: none;color: hotpink;"> <i class="fa fa-home fa-fw"></i></a></div>
   			<div class="divitem my-div"><a class="fill-div" href="SongServlet" style="text-decoration: none;color: hotpink;"> <i class="fa fa-list-ul" aria-hidden="true"></i></a></div>
   			<div class="divitem my-div"><a class="fill-div" href="userProfile.jsp" style="text-decoration: none;color: hotpink;"> <i class="fa fa-address-book-o" aria-hidden="true"></i></a></div>
   			<div class="divitem my-div"><a class="fill-div" href="CollectionServlet" style="text-decoration: none;color: hotpink;"> <i class="fa fa-heart" aria-hidden="true"></i></a> </div>
  			<div id="div12" class="divitem my-div"><a class="fill-div" href="logout" style="text-decoration: none;color: hotpink;"> <i class="fa fa-sign-out" aria-hidden="true"></i></a></div>
		</div>		
							
</div>
  
	
           
        <div class="cover">
        <div class="subcover">
            
            </div>
            <div>
            <h1 style="color: purple; text-shadow: blueviolet; font-weight: bold;">Featured song</h1>
            </div>
        <div class="coverimage">
            
            
            
            <img src="resources/vitas.jpg" width="200" height="200">
            </div>
            
            <div class="player">
            <i class="fa fa-play-circle" id="icon1" aria-hidden="true"></i>
            
            </div>
            
        </div>
        
        <div class="context">
                <h5 class="glow"> <i class="fa fa-music" aria-hidden="true"></i><i class="fa fa-music" aria-hidden="true"></i><i class="fa fa-music" aria-hidden="true"></i><i class="fa fa-music" aria-hidden="true"></i> </br>The<font> real</font> </br> sound<br> <font><i class="fa fa-music" aria-hidden="true"></i></font></h5>
            </div>
            
        
        <audio id="mySong">
        	<source src="source/7thelement.mp3" type="audio/mp3">
        </audio>
   <script>
   	var mySong = document.getElementById("mySong");
   	var icon = document.getElementById("icon1");
   	icon.onclick=function(){
   		if (mySong.paused){
   			mySong.play();
   			document.getElementById("icon1").className = "fa fa-pause-circle";
   		} else{
   			mySong.pause();
   			document.getElementById("icon1").className = "fa fa-play-circle";
   		}
   	}
   </script>
    </body>
</html>