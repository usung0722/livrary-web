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
		
		ServletContext context = getServletContext(); //���ø����̼ǿ� ���� ������ ServletContext ��ü�� ���� ��. 
		String saveDir = context.getRealPath("Upload"); //�����θ� ������
		System.out.println("������ >> " + saveDir);
		int maxsize = 3*1024*1024; // 3MB
		String encoding = "UTF-8";
		
		try {
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxsize, encoding, new DefaultFileRenamePolicy());
		fileName1 = multi.getFilesystemName("file1");
		System.out.println("�̹��� �̸�"+fileName1);
		String book_name = multi.getParameter("book_name");
		String book_price = multi.getParameter("book_price");
		String book_use = multi.getParameter("book_use");
		String book_maker = multi.getParameter("book_maker");
		String book_author = multi.getParameter("book_author");
		String book_bt = multi.getParameter("book_bt");
		String book_best = multi.getParameter("book_best");
		
		
		

		if(book_use==null)book_use="0";
		if(book_best==null)book_best="0";
		
		System.out.println("å�̸�"+book_name);
		System.out.println("å����"+book_price);
		System.out.println("å �����"+book_use);
		System.out.println("å ����Ŀ"+book_maker);
		System.out.println("å ������"+book_author);
		System.out.println("å ���糯"+book_bt);
		System.out.println("å ����Ʈ"+book_best);
		
		
		
	
		
		
		
		PrintWriter out = response.getWriter();
		
		DAO dao = new DAO();
		try {
		dao.bookinset(book_name,book_price, book_use,book_maker, book_author,
				fileName1,book_bt,book_best);
		out.println("<script>alert('�߰� �Ϸ�');history.back();</script>");
		}
		catch (Exception e) {
			out.println("<script>alert('�߰�����');history.back();</script>");
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
