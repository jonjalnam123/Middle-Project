<%@page import="dto.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% Hotel hotelDetail = (Hotel) request.getAttribute("hotelDetail"); %>
<% Integer user_no = (Integer) session.getAttribute("user_no"); %>
<% String user_email = (String) session.getAttribute("user_email"); %>
<% Integer like_check = (Integer) request.getAttribute("like_check"); %>

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
 		
		$("#roominfo").click(function() {
 			
 			var hotel_no = "hotel_no=" + <%=hotelDetail.getHotel_no() %> 				
 				$.ajax({
 					type: "POST",
 					url: "/hotel/detail",
 					data: hotel_no,
 					datatype: "html",
 					success: function(data) {
 						console.log("성공");
 						$("#result").html(data);
 					}
 				
 				})
 				
 			})
 		
 		/* 숙소정보 버튼 클릭시 비동기호출 */
 		$("#infobtn").click(function() {
 			
 			var hotel_no = "hotel_no=" + <%=hotelDetail.getHotel_no() %> 				
 				$.ajax({
 					type: "POST",
 					url: "/hotel/detail",
 					data: hotel_no,
 					datatype: "html",
 					success: function(data) {
 						console.log("성공");
 						$("#result").html(data);
 					}
 				
 				})
 				
 			})
 		//-----------------------------------------------------------------
 		
 			var hotel_no = <%=hotelDetail.getHotel_no() %>
			var user_no = <%=user_no%> 
			var like_check = <%=like_check%>
			var user_email = '<%=user_email%>'
			
			// 체크여부
			if( like_check > 0 ) {
				$("#heartimg").attr("src", "/resources/image/heart.png");
			} else {
				$("#heartimg").attr("src", "/resources/image/empty_heart.png");
			}
			
			// 찜하기 아이콘 눌렀을때 일어나는 일들.......
	 		$("#heartimg").click(function() {
				
				// 비로그인 상태일 때 
				 if( null == user_no ) { 
					alert('로그인 하셔야 하트를 누를수 있습니다.');
				 } 
				
				// 로그인 상태일 때
				 if( null != user_no ) {
					 $.ajax({
						type: "POST",
						url: "/mark",
						data: {hotel_no: hotel_no, user_no: user_no},
						success: function(data) {
							console.log("성공");
							if ( $("#heartimg").attr("src") == "/resources/image/empty_heart.png")  {
								$("#heartimg").attr("src", "/resources/image/heart.png");
								alert('해당호텔을 찜 하셨습니다.');
							} else {
								$("#heartimg").attr("src", "/resources/image/empty_heart.png"); 
								alert('찜하기를 취소하셨습니다.');
							}
						} 
					 }) 
				 }
			})
			
 		//-----------------------------------------------------------------
 	   $("#revbtn").click(function() {      
 	      var hotel_no = 1
 	      var selectedOption = "byDate"
 	      $.ajax({
 	         type: "GET",
 	     	url: "/review/list?hotel_no="+hotel_no+"&selectedOption="+selectedOption,   
 			datatype: "html",
 	         success: function(data) {
 	            console.log("성공");
 	            $("#result").html(data);
 	         }
 	      })
 		})
 		
 		//------------------------------------
 	      
 	      	$("#select").change(function() {		
			var hotel_no = 1
			var selectedOption = this.value;
			var type = "";
			
			$.ajax({
				type: "GET",
				url: "/review/list?hotel_no="+hotel_no,
				datatype: "html",
				success: function(data) {
					console.log("성공");
					$("#result").html(data);
				}
				
			})   //ajax 끝 }
			
 
 	      
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
	
	<!-- 찜하기 -->
	<div id="mark">
		<img src="/resources/image/empty_heart.png" id="heartimg">
	</div>
		
		<!-- 날짜선택 -->
	<div class="checkDate">  
		<div>  	
			<p>체크인</p>  	
			<input type="text" name="checkin" id="checkin" placeholder="체크인 날짜 선택"/>  
			<p>체크인</p>  	
			<input type="text" name="checkout" id="checkout" placeholder="체크아웃 날짜 선택"/>  
 		</div>
	</div>
	
	<div class="tab">
		<button class="room" id="roominfo">
		<span>객실정보</span>
		</button>
	
		<button class="intro" id="infobtn">
		<span>숙소정보</span>
		</button>
		
		<button class="tab_review" id="revbtn">
		<span>리뷰</span>
		</button>
	</div>
	
		<div id="result" class="result">
		</div>
</div>	
	
</body>
</html>