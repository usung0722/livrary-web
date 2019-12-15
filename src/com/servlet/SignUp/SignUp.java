package com.servlet.SignUp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.DAO;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String id;
	String pw;
	String phone;
	String ad1;
	String ad2;
	
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		id = request.getParameter("idtb");
		pw = request.getParameter("pwtb");
		phone = request.getParameter("pntb");
		ad1 = request.getParameter("roadAddrPart1");
		ad2 = request.getParameter("addrDetail");

		DAO dao = new DAO();
		boolean result =  dao.signup(id, pw, phone, ad1, ad2);
		if(result == false) {
		out.println("<script>alert('회원가입 완료');self.close();</script>");
		}
		else {
		out.println("<script>alert('ID 값 중복입니다.');history.back();</script>");	
		}

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
