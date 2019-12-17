package com.DTO;

public class userDTO {
	String id;
	String pw;
	String ph;
	String ad1;
	String ad2;
	public userDTO(String id, String pw, String ph, String ad1, String ad2) {
		super();
		this.id = id;
		this.pw = pw;
		this.ph = ph;
		this.ad1 = ad1;
		this.ad2 = ad2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPh() {
		return ph;
	}
	public void setPh(String ph) {
		this.ph = ph;
	}
	public String getAd1() {
		return ad1;
	}
	public void setAd1(String ad1) {
		this.ad1 = ad1;
	}
	public String getAd2() {
		return ad2;
	}
	public void setAd2(String ad2) {
		this.ad2 = ad2;
	}
	
}
