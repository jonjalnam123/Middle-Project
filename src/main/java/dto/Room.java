package dto;

public class Room {

	private int room_no; // 객실번호
	private int hotel_no; // 호텔번호
	private String room_type; //객실타입
	private int people; // 기준인원
	private int max_people; //최대인원
	private int room_price; //객실가격
	private String room_img; //객실사진
	
	public Room() { }

	public Room(int room_no, int hotel_no, String room_type, int people, int max_people, int room_price,
			String room_img) {
		super();
		this.room_no = room_no;
		this.hotel_no = hotel_no;
		this.room_type = room_type;
		this.people = people;
		this.max_people = max_people;
		this.room_price = room_price;
		this.room_img = room_img;
	}

	@Override
	public String toString() {
		return "Room [room_no=" + room_no + ", hotel_no=" + hotel_no + ", room_type=" + room_type + ", people=" + people
				+ ", max_people=" + max_people + ", room_price=" + room_price + ", room_img=" + room_img + "]";
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

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getMax_people() {
		return max_people;
	}

	public void setMax_people(int max_people) {
		this.max_people = max_people;
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	public String getRoom_img() {
		return room_img;
	}

	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}

	
}
