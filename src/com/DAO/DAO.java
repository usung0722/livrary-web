package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
	
	// 로그인 확인
	public boolean login(String id,String pw) {
		
		
		boolean result = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		System.out.println("아이디"+id);
		System.out.println("패스워드"+pw);
		
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
			System.out.println("읽어오기끝 결과 : " +result);

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
	
	
	public ArrayList<BookDTO> select() {

		ArrayList<BookDTO> list = new ArrayList<BookDTO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet res = null;

		try {
//			con = DriverManager.getConnection(url,id,pw);
			con = datasource.getConnection();
			String sql = "select * from book";
			pstmt = con.prepareStatement(sql);
			res = pstmt.executeQuery();

			while (res.next()) {
				int bookid = res.getInt("book_id");
				String bookname = res.getString("book_name");
				String bookloc = res.getString("book_loc");

				BookDTO bookdto = new BookDTO(bookid, bookname, bookloc);
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

}
