package dto;

import java.sql.Date;


public class Booking {

	private int booking_no;
	private int room_no; 
	private int hotel_no; 
	private int user_no; 
	private Date hotel_in;
	private Date hotel_out;
	private int room_price; 
	
	public Booking() {}

	public Booking(int booking_no, int room_no, int hotel_no, int user_no, Date hotel_in, Date hotel_out,
			int room_price) {
		super();
		this.booking_no = booking_no;
		this.room_no = room_no;
		this.hotel_no = hotel_no;
		this.user_no = user_no;
		this.hotel_in = hotel_in;
		this.hotel_out = hotel_out;
		this.room_price = room_price;
	}

	@Override
	public String toString() {
		return "Booking [booking_no=" + booking_no + ", room_no=" + room_no + ", hotel_no=" + hotel_no + ", user_no="
				+ user_no + ", hotel_in=" + hotel_in + ", hotel_out=" + hotel_out + ", room_price=" + room_price + "]";
	}

	public int getBooking_no() {
		return booking_no;
	}

	public void setBooking_no(int booking_no) {
		this.booking_no = booking_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public int getHotel_no() {
		return hotel_no;
	}

	public void setHotel_no(int hotel_no) {
		this.hotel_no = hotel_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public Date getHotel_in() {
		return hotel_in;
	}

	public void setHotel_in(Date hotel_in) {
		this.hotel_in = hotel_in;
	}

	public Date getHotel_out() {
		return hotel_out;
	}

	public void setHotel_out(Date hotel_out) {
		this.hotel_out = hotel_out;
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	
	
}
 

