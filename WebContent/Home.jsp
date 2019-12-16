<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="com.DAO.DAO"%>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="font.css" type="text/css">
<script type="text/javascript">
	// opener���� ������ �߻��ϴ� ��� �Ʒ� �ּ��� �����ϰ�, ������� ������������ �Է��մϴ�. ("�˾�API ȣ�� �ҽ�"�� �����ϰ� ������Ѿ� �մϴ�.)
	//document.domain = "abc.go.kr";

	function goPopup() {
		// �ּҰ˻��� ������ �˾� �������� ȣ���մϴ�.
		// ȣ��� ������(jusopopup.jsp)���� ���� �ּҰ˻�URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)�� ȣ���ϰ� �˴ϴ�. 
		var pop = window.open("Signup.jsp", "pop1",
				"width=441,height=280, scrollbars=no, resizable=yes");

		// ����� ���� ���, ȣ��� ������(jusopopup.jsp)���� ���� �ּҰ˻�URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)�� ȣ���ϰ� �˴ϴ�.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
</script>
</head>
<title>library</title>
<style>

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
	height: 1200px;
	width: 100%;
}

.if {
	width: 100%;
	height: 100%;
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

.hi {
	font-size: 25px;
	display: inline;
	margin: 0px;
}

.homefont {
	font-size: 60px;
	text-align: center;
}

@media screen and (max-width:1000px) {
	.homefont {
		font-size: 100px;
		text-align:left;
		display: inline;
	}
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
		min-width: 879px;
	}
	.menuvar{
	font-size: 40px;}
	.imghome {
		width: 100px;
		height: auto;
	}
	.form {
		font-size: 30px;
		display: inline-block;
	}
	.bt {
		font-size: 25px;
		border: 0;
		outline: 0;
		background-color: white;
		color: gray;
		display: inline;
	}
	.hi {
		font-size: 30px;
		display: inline;
		margin: 0px;
	}
	#homeheader {
		width: 1000px;
	}
}
</style>
</head>
<body>
	<div class="container">

		<div id="homeheader">
			<p class="homefont">
				<a id="homehref" href="http://59.4.10.185:8090/Livrary/Home.jsp">Home Library </a>
			</p>
			<br>
			<%
				if (session.getAttribute("sessionid") == null) {
			%>

			<form class="form" action="Loginchk.jsp" method="post">
				ID : <input type="text" name="idtb" required> PW : <input type="password" name="pwtb" required><br> <input class="bt" type="submit" value="log in"> <input class="bt"
					type="button" value="sign up" onClick="goPopup();"
				>
			</form>


			<%
				} else {
			%>
			<p class="hi">
				<%=session.getAttribute("sessionid")%>
				Nice to meet you
			</p>
			<br> <input class="bt" type="button" value="log out" onclick="window.location='logout.jsp'">
			<%
				String id = (String) session.getAttribute("sessionid");
					DAO dao = new DAO();
					boolean adminchk = dao.adminchk(id);
					if (adminchk == true)
			%><input class="bt" type="button" value="book add" onclick="window.open('BookInsert.jsp','window_name','width=430,height=300,location=no,status=no,scrollbars=no');">
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
					<a href="returnbook.jsp" target="iframe">Return book</a>
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