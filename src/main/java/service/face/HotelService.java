package service.face;

import dto.Hotel;

public interface HotelService {

	public Hotel detail(int hotel_no);

	public Hotel insertMark(int hotel_no);
	
	public Hotel join(Hotel hotelparam);
	
}
