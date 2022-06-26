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
	<link rel="stylesheet" type="text/css" href="css/homepage.css">
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="icon" href="https://t3.ftcdn.net/jpg/04/54/66/12/360_F_454661277_NtQYM8oJq2wOzY1X9Y81FlFa06DVipVD.jpg" type="image/icon type">
	<style>
	.button-33 {
  background-color: #c2fbd7;
  border-radius: 100px;
  box-shadow: rgba(44, 187, 99, .2) 0 -25px 18px -14px inset,rgba(44, 187, 99, .15) 0 1px 2px,rgba(44, 187, 99, .15) 0 2px 4px,rgba(44, 187, 99, .15) 0 4px 8px,rgba(44, 187, 99, .15) 0 8px 16px,rgba(44, 187, 99, .15) 0 16px 32px;
  color: green;
  cursor: pointer;
  display: inline-block;
  font-family: CerebriSans-Regular,-apple-system,system-ui,Roboto,sans-serif;
  padding: 7px 20px;
  text-align: center;
  text-decoration: none;
  transition: all 250ms;
  border: 0;
  font-size: 16px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}
a:hover{
    		color:hotpink;
		}
.button-33:hover {
  box-shadow: rgba(44,187,99,.35) 0 -25px 18px -14px inset,rgba(44,187,99,.25) 0 1px 2px,rgba(44,187,99,.25) 0 2px 4px,rgba(44,187,99,.25) 0 4px 8px,rgba(44,187,99,.25) 0 8px 16px,rgba(44,187,99,.25) 0 16px 32px;
  transform: scale(1.05) rotate(-1deg);
}
input[type="text"]
{
width: 300px;
height:50px;
    background: transparent;
    border: none;
    transition: all .2s ease;
    color: chocolate;
    border: none;
    outline-width: 0;
    font-size: 20px;
}
input[type="text"]:focus{
box-shadow: 5px 5px grey;
}
a:hover { text-shadow: 5px 5px 10px black; }

body{
color: chocolate;
font-weight: bold;
}
h3{
-webkit-animation: glow 1s ease-in-out infinite alternate;
  -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
}

@-webkit-keyframes glow {
  from {
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 30px #e60073, 0 0 20px #e60073, 0 0 25px #e60073, 0 0 60px #e60073, 0 0 35px #e60073;
  }
  to {
    text-shadow: 0 0 10px #fff, 0 0 15px #ff4da6, 0 0 40px #ff4da6, 0 0 25px #ff4da6, 0 0 30px #ff4da6, 0 0 70px #ff4da6, 0 0 40px #ff4da6;
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
</style>
    <title>Songs list</title>
 	</head>
 	
	<body style="background-image: linear-gradient(black,darkgrey);">
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
		
		
		<div>
				<form action="search">
				<input type="text" id="songname" name="songname" placeholder="Enter song name">
				<button type="submit" class="button-33" role="button"><i class="fa fa-search" aria-hidden="true"></i></button>
				</form>
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
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 style="color: pink;font-family: monospace;font-weight: bold;">All available songs</h3>
			</div>
			<br>
			<br>
			<br>
			<%
			int count = 0;
				for (Song s: myList) { %>
				
				<div class="col-md-3">
				<a href="javascript:void();" class="album-poster" data-switch="<%=count%>">
					<img src="<%=s.getCover()%>" alt="">
				</a>
				<h4><%=s.getSongName()%></h4>
				<p><%=s.getArtist()%></p>
				<form action="AddServlet" method="get">
				<input type="hidden" name="IDDD" id="IDDD" value="<%=s.getSongName()%>">
				<button type="submit" class="button-33" role="button">Add to favorite</button>
				</form></div>

				
				<%
				count++;}
			%>

		</div>


		<div class="row">
			<div class="col-md-12">
				<h3 style="color: pink;font-family: monospace;font-weight: bold;">Coming soon</h3>
			</div>
			<div class="col-md-2">
				<a href="#" class="album-poster">
					<img src="https://images.pexels.com/photos/1699161/pexels-photo-1699161.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt="">
				</a>
				<h4>Lorem ipsum</h4>
			</div>
			<div class="col-md-2">
				<a href="#" class="album-poster">
					<img src="https://images.pexels.com/photos/838702/pexels-photo-838702.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt="">
				</a>
				<h4>Repellat illo</h4>
			</div>
			<div class="col-md-2">
				<a href="#" class="album-poster">
					<img src="https://images.pexels.com/photos/894156/pexels-photo-894156.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt="">
				</a>
				<h4>adipisicing elit</h4>
			</div>
			
			<div class="col-md-2">
				<a href="#" class="album-poster">
					<img src="https://images.pexels.com/photos/2118046/pexels-photo-2118046.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt="">
				</a>
				<h4>Atque ab</h4>
			</div>
			<div class="col-md-2">
				<a href="#" class="album-poster">
					<img src="https://images.pexels.com/photos/1735240/pexels-photo-1735240.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt="">
				</a>
				<h4>Fugiat Silly</h4>
			</div>
			<div class="col-md-2">
				<a href="#" class="album-poster">
					<img src="https://images.pexels.com/photos/2272854/pexels-photo-2272854.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt="">
				</a>
				<h4>veniam expedita</h4>
			</div>
		</div>


	</div>
</div>

	<div id="aplayer"></div>

	<!-- Jquery Link -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<!-- Bootstrap Link -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<!-- APlayer Jquery link -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/aplayer/1.10.1/APlayer.min.js"></script>	
	
	<script>
	// NOW I CLICK album-poster TO GET CURRENT SONG ID
	$(".album-poster").on('click', function(e){
		var dataSwitchId = $(this).attr('data-switch');
		//console.log(dataSwitchId);

		// and now i use aplayer switch function see
		ap.list.switch(dataSwitchId); //this is static id but i use dynamic 

		// aplayer play function
		// when i click any song to play
		ap.play();

		// click to slideUp player see
		$("#aplayer").addClass('showPlayer');
	});
    var c = <%=count%>
	const ap = new APlayer({
	    container: document.getElementById('aplayer'),
	    listFolded: true,
	    audio: [
	    	
	    	
	    	 <%
				for (Song s: myList) { %>
				{
						name: '<%=s.getSongName()%>',
				        artist: '<%=s.getArtist()%>',
				        url: '<%=s.getLink()%>',
				        cover: '<%=s.getCover()%>'
				},
				<%}
			%>

	    ]
	});

	</script>

	</body>
</html>