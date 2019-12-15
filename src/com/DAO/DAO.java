package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.sql.DataSource;
import javax.xml.ws.Response;

import com.DTO.BookDTO;

public class DAO {
	DataSource datasource;
	

	public DAO() {
		try {

			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/orcl12g");

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
	
public void bookbuy(String id,String name) {
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		try {
			con = datasource.getConnection();
			String sql = "insert into bookinfo (user_name,book_name) "
					+ "values(?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			res = pstmt.executeQuery();
			

			sql = "update book set book_use = '1' "
					+ "where book_name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			res = pstmt.executeQuery();
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (res != null)
					res.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	public boolean adminchk(String id) {
		
		
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		try {
			con = datasource.getConnection();
			String sql = "select * from userdb"
					+ " where id = ? and admin = 1";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			res = pstmt.executeQuery();

			while (res.next()) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (res != null)
					res.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	}
	
	// 로그인 확인
	public boolean login(String id,String pw) {
		
		
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		
		try {
			con = datasource.getConnection();
			String sql = "select * from userdb"
					+ " where id = ? and pw = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			res = pstmt.executeQuery();

			while (res.next()) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (res != null)
					res.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
		
	}
	
	//회원가입
	
public boolean signup(String id,String pw,String phone,String ad1,String ad2) {
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		try {
			con = datasource.getConnection();
			
			String sql = "select * from userdb where id = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			res = pstmt.executeQuery();
			
			while (res.next()) {
				return true;
			}
			
			sql = "insert into userdb ( id,pw,ph,ad1,ad2,user_num) values(?,?,?,?,?,sw_num.nextval)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, phone);
			pstmt.setString(4, ad1);
			pstmt.setString(5, ad2);
			res = pstmt.executeQuery();
			
			


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (res != null)
					res.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return false;
	}


public ArrayList<BookDTO> bookselect(String name) {

	ArrayList<BookDTO> list = new ArrayList<BookDTO>();

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet res = null;

	try {
//		con = DriverManager.getConnection(url,id,pw);
		con = datasource.getConnection();
		String sql = "select * "
				+ "from book "
				+ "where book_name like '%"+name+"%' "
				+ "order by book_bt DESC";
		pstmt = con.prepareStatement(sql);
		res = pstmt.executeQuery();

		while (res.next()) {
			String book_name = res.getString("book_name");
			String book_price = res.getString("book_price");
			int book_use = res.getInt("book_use");
			String book_maker = res.getString("book_maker");
			String book_author = res.getString("book_author");
			String book_imgad = res.getString("imgad");
			int book_bt = res.getInt("book_bt");
			int book_best = res.getInt("book_best");

			BookDTO bookdto = new BookDTO(book_name, book_price,  book_use, book_maker,book_author,
					book_imgad,book_bt, book_best);
			list.add(bookdto);

		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (res != null)
				res.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	return list;
}
	


	public ArrayList<BookDTO> bestselect() {

		ArrayList<BookDTO> list = new ArrayList<BookDTO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;

		try {
//			con = DriverManager.getConnection(url,id,pw);
			con = datasource.getConnection();
			String sql = "select * "
					+ "from book "
					+ "where book_best = 1 "
					+ "order by book_bt DESC";
			pstmt = con.prepareStatement(sql);
			res = pstmt.executeQuery();

			while (res.next()) {
				String book_name = res.getString("book_name");
				String book_price = res.getString("book_price");
				int book_use = res.getInt("book_use");
				String book_maker = res.getString("book_maker");
				String book_author = res.getString("book_author");
				String book_imgad = res.getString("imgad");
				int book_bt = res.getInt("book_bt");
				int book_best = res.getInt("book_best");

				BookDTO bookdto = new BookDTO(book_name, book_price,  book_use, book_maker,book_author,
						book_imgad,book_bt, book_best);
				list.add(bookdto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (res != null)
					res.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return list;
	}
	
	
	public ArrayList<BookDTO> newselect() {

		ArrayList<BookDTO> list = new ArrayList<BookDTO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;

		try {
//			con = DriverManager.getConnection(url,id,pw);
			con = datasource.getConnection();
			String sql = "select * "
					+ "from book "
					+ "order by book_bt DESC";
			pstmt = con.prepareStatement(sql);
			res = pstmt.executeQuery();

			while (res.next()) {
				String book_name = res.getString("book_name");
				String book_price = res.getString("book_price");
				int book_use = res.getInt("book_use");
				String book_maker = res.getString("book_maker");
				String book_author = res.getString("book_author");
				String book_imgad = res.getString("imgad");
				int book_bt = res.getInt("book_bt");
				int book_best = res.getInt("book_best");

				BookDTO bookdto = new BookDTO(book_name, book_price,  book_use, book_maker,book_author,
						book_imgad,book_bt, book_best);
				list.add(bookdto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (res != null)
					res.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return list;
	}
	
	public void bookinset(String book_name,String book_price, String book_use,String book_maker,String book_author,
			String book_imgad,String book_bt,String book_best) {


		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;

		try {
//			con = DriverManager.getConnection(url,id,pw);
			con = datasource.getConnection();
			String sql = "insert into book (book_name,book_price,book_use,book_maker,book_author,imgad,book_bt,book_best,book_num) "
					+ "values(?,?,?,?,?,?,?,?,book_num.nextval)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, book_name);
			pstmt.setString(2, book_price);
			pstmt.setString(3, book_use);
			pstmt.setString(4, book_maker);
			pstmt.setString(5, book_author);
			pstmt.setString(6, book_imgad);
			pstmt.setString(7, book_bt);
			pstmt.setString(8, book_best);
			
			
			res = pstmt.executeQuery();
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (res != null)
					res.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
