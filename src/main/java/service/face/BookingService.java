package service.face;

import dto.Booking;
import dto.Reserve;

public interface BookingService {

	/**
	 * 예약DB 삽입
	 * 
	 * @param hotel_no
	 * @param room_no
	 * @param user_no
	 * @param from
	 * @param to
	 * @param room_price
	 * @return
	 */
	public Booking insert(int hotel_no, int room_no,int user_no, String from, String to, int room_price);

	/**
	 * 결제페이지에 보여줄 종합정보
	 * 
	 * @param booking_no
	 * @return
	 */
	public Reserve selectAll(int booking_no);


	
	
	
}
