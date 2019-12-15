<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import="com.DAO.DAO"%>
<%@ page import="com.DTO.BookDTO"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
String book_name = request.getParameter("book_name");
DAO dao = new DAO();
String id = (String)session.getAttribute("sessionid");
dao.bookbuy(id, book_name);

%>
<script>alert('구매 완료');self.close();</script>

</body>
</html>