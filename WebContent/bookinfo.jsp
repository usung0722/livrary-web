<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.DAO.DAO"%>
<%@ page import="com.DTO.BookDTO"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

</style>
<body>

<%
				DAO dao = new DAO();
				request.setCharacterEncoding("UTF-8");
				String name = request.getParameter("book_name");
				
				ArrayList<BookDTO> list= dao.bookselect(name);
				
				
				BookDTO dto = list.get(0);
				
				String book_name=dto.getBook_name();
				String book_price=dto.getBook_price();
				int book_use= dto.getBook_use();
				String book_maker= dto.getBook_maker();
				String book_author= dto.getBook_author();
				String book_imgad= dto.getBook_imgad();
				int book_bt = dto.getBook_bt();
				int book_best = dto.getBook_best();
			%>


				<div class="item">
					<div class="img">
					<%if(book_best == 1){ %>
					
					<img src="img/best_icon.png" style="z-index: 99; position: absolute; width: 150px">
					<%} %>
					<img src="Upload/<%=book_imgad%>" style=" width: 350px;">
					</div>
					<div class="book_name"><h3> <%=book_name %></h3> </div>
					<div class="book_author"> 지은이 : <%=book_author %></div>
					<div class="book_maker">메이커 : <%=book_maker %></div>
					<div class="book_maker">출사일 : <%=book_bt %></div>
					<div class="book_price">  price : <%=book_price %></div>
					<div class="book_price">  재고 : <%if(book_use==1){%>없음<%}
					else{%>있음<%}%></div>
				</div>
				<%
				if(book_use!=1 && session.getAttribute("sessionid")!=null){
				%>
				<br>
				<input type="button" value="빌리기" onclick="location.href='bookbuy.jsp?&book_name=<%=book_name%>'">
				
				<%
				}
				%>


</form>
</body>
</html>