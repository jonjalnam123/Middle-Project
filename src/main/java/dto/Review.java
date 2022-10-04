package dto;

import java.util.Date;

public class Review {
	
	private int pay_no;
	private int review_no;
	private int hotel_no;
	private int booking_no;
	private String user_email;
	private String review_content;
	private int review_score;
	private Date review_date;
	
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getHotel_no() {
		return hotel_no;
	}
	public void setHotel_no(int hotel_no) {
		this.hotel_no = hotel_no;
	}
	public int getBooking_no() {
		return booking_no;
	}
	public void setBooking_no(int booking_no) {
		this.booking_no = booking_no;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	@Override
	public String toString() {
		return "Review [pay_no=" + pay_no + ", review_no=" + review_no + ", hotel_no=" + hotel_no + ", booking_no="
				+ booking_no + ", user_email=" + user_email + ", review_content=" + review_content + ", review_score="
				+ review_score + ", review_date=" + review_date + "]";
	}
	
	public Review(int pay_no, int review_no, int hotel_no, int booking_no, int user_no, String review_content,
			int review_score, Date review_date) {
		super();
		this.pay_no = pay_no;
		this.review_no = review_no;
		this.hotel_no = hotel_no;
		this.booking_no = booking_no;
		this.user_email = user_email;
		this.review_content = review_content;
		this.review_score = review_score;
		this.review_date = review_date;
	}
	
	public Review() {
		super();
	}

	

}
