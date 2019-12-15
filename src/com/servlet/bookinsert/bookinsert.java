package com.servlet.bookinsert;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.DAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/bookinsert")
public class bookinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html; charset=UTF-8");
		
		String fileName1=null;
		
		ServletContext context = getServletContext(); //어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨. 
		String saveDir = context.getRealPath("Upload"); //절대경로를 가져옴
		System.out.println("절대경로 >> " + saveDir);
		int maxsize = 3*1024*1024; // 3MB
		String encoding = "UTF-8";
		
		try {
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxsize, encoding, new DefaultFileRenamePolicy());
		fileName1 = multi.getFilesystemName("file1");
		System.out.println("이미지 이름"+fileName1);
		String book_name = multi.getParameter("book_name");
		String book_price = multi.getParameter("book_price");
		String book_use = multi.getParameter("book_use");
		String book_maker = multi.getParameter("book_maker");
		String book_author = multi.getParameter("book_author");
		String book_bt = multi.getParameter("book_bt");
		String book_best = multi.getParameter("book_best");
		
		
		

		if(book_use==null)book_use="0";
		if(book_best==null)book_best="0";
		
		System.out.println("책이름"+book_name);
		System.out.println("책가격"+book_price);
		System.out.println("책 사용중"+book_use);
		System.out.println("책 메이커"+book_maker);
		System.out.println("책 지은이"+book_author);
		System.out.println("책 만든날"+book_bt);
		System.out.println("책 베스트"+book_best);
		
		
		
	
		
		
		
		PrintWriter out = response.getWriter();
		
		DAO dao = new DAO();
		try {
		dao.bookinset(book_name,book_price, book_use,book_maker, book_author,
				fileName1,book_bt,book_best);
		out.println("<script>alert('추가 완료');history.back();</script>");
		}
		catch (Exception e) {
			out.println("<script>alert('추가오류');history.back();</script>");
		}
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
