<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="font.css" type="text/css">
</head>
<title>library</title>
<style>
.imghome {
	width: 30px;
	height: auto;
}

#homehref {
	text-decoration: none;
	color: black;
}

body {
	font-family: 'Roboto', sans-serif;
	padding: 0px;
	margin: 0px;
	overflow: auto;
}

#homeheader {
	font-size: 50px;
	float: none;
}

.menu {
	overflow: hidden;
	font-size: 25px;
	width: 100%;
	height: 50px;
	background-color: #363c48;
	color: white;
	z-index: 90;
	cursor: pointer;
}

.menu>.menusize {
	float: right;
	margin-left: 0px;
}

.menu>.menusize>.menuvar {
	display: inline-block;
	margin-top: 10px;
	margin-right: 50px;
}

.menu>.menusize>.menuvar>a {
	text-decoration: none;
	color: white;
	display: block;
	padding-left: 50px;
}

.homemain {
	position: static;
	margin-top: 50px;
	height: 600px;
	width: 100%;
}

.if {
	width: 100%;
	border: none;
}

.container {
	margin: 30px;
	overflow: hidden;
}

.form {
	font-size: 15px;
	display: inline-block;
}

.bt {
	font-size: 10px;
	border: 0;
	outline: 0;
	background-color: white;
}

@media screen and (max-width:1000px) {
	#homeheader {
		font-size: 100px;
	}
	.menu {
		overflow: auto;
		font-size: 70px;
		width: 100%;
		height: auto;
		background-color: #363c48;
		color: white;
		z-index: 90;
		cursor: pointer;
	}
	.imghome {
		width: 100px;
		height: auto;
	}
	.form {
		font-size: 30px;
		display: inline-block;
	}
	.bt {
		font-size: 30px; border : 0;
		outline: 0;
		background-color: white;
		border: 0;
	}
}
}
</style>
</head>
<body>
	<div class="container">

		<div id="homeheader">
			<a id="homehref" href="http://59.4.10.185:8090/Livrary/Home.jsp"> <img class="imghome" src="img/homebook.png"> Home Library
			</a>
			<%
				if (session.getAttribute("sessionid") == null) {
			%>

			<form class="form" action="loginchk.jsp" method="post">
				ID : <input type="text" name="idtb"> PW : <input type="password" name="pwtb"><br> <input class="bt" type="submit" value="log in"> <input class="bt" type="button"
					value="sign up"
				>
			</form>


			<%
				} else {
			%>
			<p style="font-size: 15px; display: inline-block; margin-left: 100px;">
				<%=session.getAttribute("sessionid")%>
				Nice to meet you
			</p>
			<input class="bt" type="button" value="log out" onclick="window.location='logout.jsp'">
			<%
				}
			%>

		</div>
		<div class="menu">
			<div class="menusize">
				<div class="menuvar">
					<a href="Search.jsp" target="iframe">Search</a>
				</div>
				<div class="menuvar">
					<a href="#">Shopping Cart</a>
				</div>
				<div class="menuvar">
					<a href="#">Return book</a>
				</div>
				<div class="menuvar">
					<a href="#">My Page</a>
				</div>
			</div>
		</div>

		<div class="homemain">
			<iframe name="iframe" class="if" src="main.jsp"></iframe>
		</div>






	</div>
</body>
</html>