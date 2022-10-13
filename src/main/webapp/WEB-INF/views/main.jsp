<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

<%@ include file="/layout/header.jsp"%>


<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

	  	      $.ajax({
	  	         type: "GET",
	  	     	url: "/maxMarked", 
	  			datatype: "html",
	  	         success: function(data) {
	  	            console.log("성공");
	  	            $("#result").html(data);
	  	         }
	  	      })
		
	})
	</script>
	
	
<script type="text/javascript">
	$(document).ready(function() {

		var $slider_list = $("#slider li")
		console.log($slider_list)

		//모든 이미지 숨기기
		// 	$slider_list.css("left", "600px")
		$slider_list.css("left", $("#sliderbox").css("width"))

		//------------------------------------------------------------------

		//새로고침을 때 첫번째 이미지 보여주기
		$slider_list.eq(0).css("left", 0)

		//------------------------------------------------------------------

		//#sliderbox를 주어진 시간마다 이미지 자동 교체하기

		//setInterval(function, interval)
		//	-> interval(밀리초)마다 주어진 function을 호출한다

		//현재 보여지는 슬라이드의 인덱스 변수
		var curSlide = 0;

		setInterval(function() {
			// 		console.log("sliderbox click")

			//-----------------------------------------------------------

			//다음에 보여지는 슬라이드의 인덱스 변수
			var nextSlide = curSlide + 1;
			nextSlide %= $slider_list.length;

			console.log(curSlide, ":", nextSlide)

			//-----------------------------------------------------------

			//현재 슬라이드 숨기기 - curSlide
			$slider_list.eq(curSlide).css("left", $("#sliderbox").css("width"))

			//다음 슬라이드 보여주기 - nextSlide
			$slider_list.eq(nextSlide).css("left", 0)

			//-----------------------------------------------------------

			//증가식
			curSlide++;
			curSlide %= $slider_list.length;
		}, 3000)

	})
</script>

<style type="text/css">

.middle{
	margin: 0 auto;
	height: 800px;
}

/* 이미지 슬라이더 박스 */
#sliderbox {
	
	width: 800px;
	height: 400px;
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	/* 외부 정렬 */
	margin: 0 auto;
	/* div영역을 벗어난 부분 안보이도록 처리 */
	overflow: hidden;
	/* 	overflow: visible; */
	margin-top: 8%;
}

#slider {
	/* ul태그의 기본 스타일 제거 */
	padding: 0;
	margin: 0;
	list-style-type: none;
	/* 자식요소 absolute를 받은 li태그의 기준점으로 설정하기 */
	position: relative;
}

#slider li {
	position: absolute;
}

#slider li img {
	width: 800px;
	height: 400px;
	
}


#sliderbox {
  	width: 650px;
    height: 400px; 

    overflow: hidden;
    }
    
.img {
   width: 100%;
   height: 100%;
   object-fit: cover;
}

</style>


<div class="main_wrap">
<div id="sliderbox">

	<ul id="slider">
		<li><img
			src="https://image.goodchoice.kr/resize_1000X500x0/affiliate/2022/04/20/625f9e785a3cd.jpg"></li>
		<li><img
			src="https://image.goodchoice.kr/resize_1000X500x0/affiliate/2019/07/16/5d2d628cede99.jpg"></li>
		<li><img
			src="https://image.goodchoice.kr/resize_1000X500x0/affiliate/2017/09/13/59b8f2e3242cb.jpg"></li>
		<li><img
			src="https://image.goodchoice.kr/resize_1000X500x0/affiliate/2018/02/20/5a8bda503a8f6.jpg"></li>
		<li><img
			src="https://image.goodchoice.kr/resize_1000X500x0/affiliate/2022/03/09/622809eb68406.jpg"></li>
	</ul>
</div>
</div>

<div id="result" class="result">
</div>

	
<%@ include file="/layout/footer.jsp"%>