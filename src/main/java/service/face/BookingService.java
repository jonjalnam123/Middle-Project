package service.face;

import dto.Booking;

public interface BookingService {

	Booking insert(int hotel_no, int room_no,int user_no, String from, String to);

	
	
	
}
