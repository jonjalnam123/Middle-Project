<%@page import="dto.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% Hotel hotelDetail = (Hotel) request.getAttribute("hotelDetail"); %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2f47283a16fca78743abba9b8a1f5ba&autoload=false"></script>
<meta charset="UTF-8">
<title>리뷰 작성 페이지</title>
<!-- 카카오지도 -->
<style type="text/css">

.container {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
}

.container div {
	margin-top: 50px;
	padding: 0 20px 0px 20px;
}

.container::before {
  content: "::before element";
  order:9999;
  visibility:hidden;
  display:none;
  height:0;
  overflow:hidden;
}

.container::after {
  content: "::before element";
  order:9999;
  visibility:hidden;
  display:none;
  height:0;
  overflow:hidden;
}

.htimg {
	display: block;
	width: 490px;
	height: 350px;
}

.tab {
	text-align: left;
	grid-column: span 2;
}

.result {
	text-align: left;
	grid-column: span 2;
}

h2 { font-weight: bold; }
</style>

<script type="text/javascript">

 	$(document).ready(function() {
				
		var hotel_no = 3
		//console.log("no : " + no)
			
		/* 숙소정보 버튼 클릭시 비동기호출 */
		$.ajax({
			type: "GET",
			url: "/review",
			data: hotel_no,
			datatype: "html",
			success: function(data) {
				console.log("성공");
				$("#result").html(data);
			}
			
		})
		
	}) 

</script>
</head>
<body>

<div class="container">
	
<%-- 	<div>
		<%=hotelDetail.getHotelPhoto() %>
		<img src="/upload/<%=hotelDetail.getHotel_photo() %>" class="htimg" alt="이미지 아님">
	</div>
	
	<div>
		<h2><%=hotelDetail.getHotel_name() %></h2>
		<hr>
		<p>주소 : <%=hotelDetail.getHotel_addr() %></p>
		<p>대표번호 : <%=hotelDetail.getHotel_tel() %></p>
	</div> --%>
	
	<!-- <input type="text" id="datepicker" class="datepicker" name="checkin">
	<input type="text" id="datepicker2" class="datepicker" name="checkout"> -->
	
	<div class="tab">
		<button class="room">
		<span>객실정보</span>
		</button>
	
		<%-- <a href="/hotel2/detail?no=<%=hotelDetail.getHotelNo()%>"> --%>
		<button class="intro" id="infobtn">
		<span>숙소정보</span>
		</button>
		<!-- </a> -->
		
		<button class="tab_review" id="revbtn">
		<span>리뷰</span>
		</button>
	</div>
	
		<div id="result" class="result">
		</div>
</div>	
	
</body>
</html>