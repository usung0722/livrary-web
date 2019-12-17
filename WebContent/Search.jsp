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
	text-align: center;
	animation-name: navbar-fade;
	 animation-duration: 2s;
   	 -webkit-animation-name: navbar-fade;
  	 -webkit-animation-duration: 2s;
}
@keyframes navbar-fade {
    from { opacity: .4}
    to { opacity: 1 }
}

@-webkit-keyframes navbar-fade {
    from { opacity: .4}
    to { opacity: 1 }
}

.sh {
	max-width: 1300px;
	margin-left: auto;
	margin-right: auto;
	text-align: left;
	
}
.tb{
display: inline-block;
margin: 40px;
}
a{
text-decoration: none;
color: black;
}
.tb {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
.tb:hover {
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.2);
}
</style>


</head>
<body>
	<div style="width: 100%; height: 100%;">
		<form method="get" action="Search.jsp">
		<h1>Search</h1>
		<input type="text" name="shbox">
		<input type="submit" value="검색">
		<input type="button" value="전체보기" onclick="location.href='Search.jsp'">
		</form>
		<div class="sh">


			<%
				DAO dao = new DAO();
				request.setCharacterEncoding("UTF-8");
				String name = request.getParameter("shbox");
				ArrayList<BookDTO> list;
				if(name==null){
				list = dao.newselect();
				}
				else{
					list = dao.bookselect(name);
				}
				
				
				
				
			for(int i=0;i<list.size(); i++){
				BookDTO dto = list.get(i);
				String book_name = dto.getBook_name();
				String book_price = dto.getBook_price();
				String book_img = dto.getBook_imgad();
				
				
			
			%>

			<div class= "tb">
			<table  onclick="window.open('bookinfo.jsp?&book_name=<%=book_name %>','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">
				<tr>
					<th style=" width: 150px;"><%=book_name %></th>
					<tr>
						<td ><img style=" width: auto; height: 200px;" src="Upload/<%=book_img %>"></td>
					</tr>
					<tr>
						<td><%=book_price %> 원</td>
					</tr>
			</table>
			</div>
			
			
			
			<%} %>




		</div>
	</div>

</body>
</html>