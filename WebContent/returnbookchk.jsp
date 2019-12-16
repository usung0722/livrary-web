<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import="com.DAO.DAO"%>
<%@ page import="com.DTO.BookDTO"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<%
String id = (String) session.getAttribute("sessionid");
String[] book_name = request.getParameterValues("chk");
DAO dao = new DAO();
for(String val : book_name){
	dao.bookreturn(id, val);
	out.println("<script>alert('반납 완료');history.back(); location.href = document.referrer;</script>");
}
%>

</body>
</html>