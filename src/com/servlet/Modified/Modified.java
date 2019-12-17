package com.servlet.Modified;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.DAO;

@WebServlet("/Modified")
public class Modified extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("idtb");
		String pw = request.getParameter("pwtb");
		String ph = request.getParameter("pntb");
		String ad1 = request.getParameter("roadAddrPart1");
		String ad2 = request.getParameter("addrDetail");
		
		DAO dao = new DAO();
		dao.userModified(id, pw, ph, ad1, ad2);
		
		out.println("<script>alert('수정 완료');history.back();</script>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
