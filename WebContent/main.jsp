<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.DAO.DAO"%>
<%@ page import="com.DTO.BookDTO"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: 'Sunflower', sans-serif;
	padding: 0px;
	margin: 0px;
}
.left{
 	width: 50%;
 	float: left;
}
.right{
	width: 50%;
	float: left;
}
.item{
display: block;
margin: 30px;
height: 250px;
	

}
a{
text-decoration: none;
color: black;
}
.item>.img{
float: left;
margin-right: 10px;

}

</style>
</head>

<body>
	<div class="left">
		<h1>New book</h1>
		
		<%
		DAO dao = new DAO();
		ArrayList<BookDTO> list2 = dao.newselect();
		
		for(int i = 0; i< 6; i++) {
			
			BookDTO dto = list2.get(i);
			String book_name=dto.getBook_name();
			String book_price=dto.getBook_price();
			int book_use= dto.getBook_use();
			String book_maker= dto.getBook_maker();
			String book_author= dto.getBook_author();
			String book_imgad= dto.getBook_imgad();
			int book_bt = dto.getBook_bt();
			int book_best = dto.getBook_best();
			
			
			
			%>
			
				<div class="item" onclick="window.open('bookinfo.jsp?&book_name=<%=book_name %>','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">
					<div class="img">
					<%if(book_best == 1){ %>
					
					<img src="img/best_icon.png" style="z-index: 99; position: absolute; width: 100px">
					<%} %>
					<img src="Upload/<%=book_imgad%>">
					</div>
					<div class="book_name"><h3> <%=book_name %></h3> </div>
					<div class="book_author"> 지은이 : <%=book_author %></div>
					<div class="book_maker">메이커 : <%=book_maker %></div>
					<div class="book_price">  price : <%=book_price %></div>
				</div>
		
			
		<%
			
		}
		
		
		%>

	</div>

	<div class="right">
		<h1>Best seller</h1>
		
		
		<%
		ArrayList<BookDTO> list = dao.bestselect();
		
		for(int i = 0; i< 6; i++) {
			
			BookDTO dto = list.get(i);
			String book_name=dto.getBook_name();
			String book_price=dto.getBook_price();
			int book_use= dto.getBook_use();
			String book_maker= dto.getBook_maker();
			String book_author= dto.getBook_author();
			String book_imgad= dto.getBook_imgad();
			int book_bt = dto.getBook_bt();
			int book_best = dto.getBook_best();
			
			
			
			%>
				<div  class="item" onclick="window.open('bookinfo.jsp?&book_name=<%=book_name %>','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">
					<div class="img">
					<img src="img/best_icon.png" style="z-index: 99; position: absolute; width: 100px"><img src="Upload/<%=book_imgad%>">
					</div>
					<div class="book_name"><h3> <%=book_name %></h3> </div>
					<div class="book_author"> 지은이 : <%=book_author %></div>
					<div class="book_maker">메이커 : <%=book_maker %></div>
					<div class="book_price">  price : <%=book_price %></div>
				</div>
		
		<%
			
		}
		
		
		%>
			
		
	</div>
</body>
</html>