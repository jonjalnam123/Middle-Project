<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dto.Hotel"%>

<% List<Hotel> list = (List) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<title>Insert title here</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style type="text/css">

.middle{
	margin: 0 auto;
	height: 800px;
}

    
.img {
   width: 100%;
   height: 100%;
   object-fit: cover;
}

</style>

<!-- Demo styles -->
<style>
.middle2{
	margin: 0 auto;
	height: 800px;
}

body {
	margin: 0;
	padding: 0;
}

.swiper {
	width: 80%;
	height: 30%;
	position: absolute;
	top: 80%;
	left: 50%;
	transform: translate(-50%, -50%);
	margin-top: 15%;
	
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
	overflow: hidden;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
	overflow: hidden;
}

.swiper > mySwiper {
	font-size: 10px;
}
</style>

<body>

<div class="middle">
  	<div class="middle2">
	<div class="swiper mySwiper"><h3>♥최다 찜 호텔♥</h3>
	<i class="fa-solid fa-magnifying-glass"></i>
		<div class="swiper-wrapper">
		<% if (list.size() == 0) { %>
		사람들로부터 찜 된 호텔이 없습니다
		 <% } else { %> 
					<% for(int i=0; i<list.size();i++) { %>
			<div class="swiper-slide">
				<img src="/upload/<%= list.get(i).getHotel_photo() %>" alt="호텔 이미지 불러오기 실패!" >
			</div>
			 <% } } %>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-pagination"></div>
	</div>

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			slidesPerView : 4,
			spaceBetween : 20,
			slidesPerGroup : 4,
			loop : true,
			loopFillGroupWithBlank : true,
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			},
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});
	</script>
</div>
</div>
  
  
</body>
</html>