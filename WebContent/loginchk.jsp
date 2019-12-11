
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="com.DAO.DAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!String id;
	String pw;%>
	<%
		id = request.getParameter("idtb");
		pw = request.getParameter("pwtb");

		DAO dao = new DAO();
		boolean result = dao.login(id, pw);
		if (result==true) {
			session.setAttribute("sessionid", id);
			session.setAttribute("sessionpw", pw);
			response.sendRedirect("Home.jsp");

		} else {
			out.println("<script>alert('아이디나 비밀번호가 틀렸습니다');history.back();</script>");

		}
	%>



</body>
</html>