package com.DTO;

public class BookDTO {
	
	String book_name;
	String book_price;
	int book_use;
	String book_maker;
	String book_author;
	String book_imgad;
	int book_bt;
	int book_best;
	
	
	
	
	
	
	public BookDTO(String book_name, String book_price, int book_use, String book_maker, String book_author,
			String book_imgad, int book_bt, int book_best) {
		super();
		this.book_name = book_name;
		this.book_price = book_price;
		this.book_use = book_use;
		this.book_maker = book_maker;
		this.book_author = book_author;
		this.book_imgad = book_imgad;
		this.book_bt = book_bt;
		this.book_best = book_best;
	}
	
	
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_price() {
		return book_price;
	}
	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}
	public int getBook_use() {
		return book_use;
	}
	public void setBook_use(int book_use) {
		this.book_use = book_use;
	}
	public String getBook_maker() {
		return book_maker;
	}
	public void setBook_maker(String book_maker) {
		this.book_maker = book_maker;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_imgad() {
		return book_imgad;
	}
	public void setBook_imgad(String book_imgad) {
		this.book_imgad = book_imgad;
	}
	public int getBook_bt() {
		return book_bt;
	}
	public void setBook_bt(int book_bt) {
		this.book_bt = book_bt;
	}
	public int getBook_best() {
		return book_best;
	}
	public void setBook_best(int book_best) {
		this.book_best = book_best;
	}
	
	
	
	
	
	
	

	
}

