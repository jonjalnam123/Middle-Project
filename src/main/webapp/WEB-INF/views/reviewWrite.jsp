<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%String pay_no = (String) request.getAttribute("pay_no"); %>
 <%String booking_no =(String)  request.getAttribute("booking_no"); %>
 <%String room_type = (String)  request.getAttribute("room_type"); %>
 <%String hotelPhotoLocation = (String)  request.getAttribute("hotelPhotoLocation"); %>
  <%String hotel_name = (String)  request.getAttribute("hotel_name"); %>
 <%String  hotel_no = (String) request.getAttribute(" hotel_no"); %>
<% String user_email = (String) session.getAttribute("user_email"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 페이지</title>
<link href="/assets/css/star.css" rel="stylesheet"/>
<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>


<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js">
$(document).ready(function() {
	
}
</script>



</head>
<body>
리뷰 쓰기
<hr>
<form action="/review/upload" method="POST" enctype="multipart/form-data">
묶었던 호텔 사진 : <img src="/upload/<%=hotelPhotoLocation %>" alt="이미지 아님" width="50" height="50">
묶었던 호텔 이름 : <%=hotel_name%>
묶었던 객실 이름 : <%=room_type%>
 	<div class="mb-3" id="myform" >
	<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="review_score" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="review_score" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="review_score" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="review_score" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="review_score" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
</div>	
리뷰를 남겨주세요 : <textarea type="text" name="review_content"
				  placeholder="리뷰를 남겨주세요"></textarea>

<label>파일 <input type="file" name="upfile"></label><br>
<label>파일 <input type="file" name="upfile"></label><br>

<button>확인</button>
<input name="pay_no" value = "<%=pay_no%>" style="display:none;">
<input name="booking_no" value = "<%=booking_no%>" style="display:none;">
<input name="hotel_no" value = "<%=hotel_no%>" style="display:none;">
<input name="user_email" value = "<%=user_email%>" style="display:none;">
</form>
</body>
</html>