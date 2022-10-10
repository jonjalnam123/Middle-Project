package service.face;

import controller.Booking;

public interface BookingService {

	
	Booking insertBooking(String hotel_no, String room_no, Integer user_no, String from, String to);
	
	
}
