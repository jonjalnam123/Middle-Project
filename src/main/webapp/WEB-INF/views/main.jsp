<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp"%>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



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
</style>


<div id="sliderbox">

	<ul id="slider">
		<li><img
			src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MDVfMTQ3%2FMDAxNjI1NDg5MjE1NzEy.2yovtiQdxCcRAnN2sEehW2qYfWiSFgK9FVqQs_-_gpgg.DliWzZs0G2KXQQpv8N-quQBr47vLhEM9DbvcfyX9DK8g.JPEG.tesslove2000%2F112.jpg&type=a340"></li>
		<li><img
			src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MDdfMTg0%2FMDAxNjU3MTgxOTI3NzEw.-Lg-w9wefWisb5ZRDffUUkGuD3byR4Nnk2-iaKi0Makg.wQNbFhGH_OMkor71W42oLXIKHyuvDoc1o4GL9X2f6yEg.JPEG.seosanpost%2F34260_34751_5142.jpg&type=a340"></li>
		<li><img
			src="https://ldb-phinf.pstatic.net/20190212_66/1549945977305nNUCX_JPEG/jAcHTcXXNgO2Sznd43k2qtBE.jpg"></li>
		<li><img
			src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fwww.hotelscombined.co.kr%2Frimg%2Fhimg%2Ff8%2F55%2F45%2Frevato-12950-13687875-568470.jpg%3Fwidth%3D720%26height%3D576%26crop%3Dtrue&type=sc960_832"></li>
		<li><img
			src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20140907_259%2Fiayns_14100918572365tFBH_JPEG%2FP3280251.JPG&type=a340"></li>
	</ul>

</div>

<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

<!-- Demo styles -->
<style>
body {
	margin: 0;
	padding: 0;
}

.swiper {
	width: 50%;
	height: 30%;
	position: absolute;
	top: 80%;
	left: 50%;
	transform: translate(-50%, -50%);
	
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
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>

</head>

<body>
	<!-- Swiper -->
	<div class="swiper mySwiper"><h3>추천 많은 순</h3>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img
					src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MDVfMTQ3%2FMDAxNjI1NDg5MjE1NzEy.2yovtiQdxCcRAnN2sEehW2qYfWiSFgK9FVqQs_-_gpgg.DliWzZs0G2KXQQpv8N-quQBr47vLhEM9DbvcfyX9DK8g.JPEG.tesslove2000%2F112.jpg&type=a340">
			</div>
			<div class="swiper-slide">
				<img
					src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MDdfMTg0%2FMDAxNjU3MTgxOTI3NzEw.-Lg-w9wefWisb5ZRDffUUkGuD3byR4Nnk2-iaKi0Makg.wQNbFhGH_OMkor71W42oLXIKHyuvDoc1o4GL9X2f6yEg.JPEG.seosanpost%2F34260_34751_5142.jpg&type=a340">
			</div>
			<div class="swiper-slide">
				<img
					src="https://ldb-phinf.pstatic.net/20190212_66/1549945977305nNUCX_JPEG/jAcHTcXXNgO2Sznd43k2qtBE.jpg">
			</div>
			<div class="swiper-slide">
				<img
					src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fwww.hotelscombined.co.kr%2Frimg%2Fhimg%2Ff8%2F55%2F45%2Frevato-12950-13687875-568470.jpg%3Fwidth%3D720%26height%3D576%26crop%3Dtrue&type=sc960_832">
			</div>
			<div class="swiper-slide">
				<img
					src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20140907_259%2Fiayns_14100918572365tFBH_JPEG%2FP3280251.JPG&type=a340">
			</div>
			<div class="swiper-slide">
				<img
					src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MDdfMTg0%2FMDAxNjU3MTgxOTI3NzEw.-Lg-w9wefWisb5ZRDffUUkGuD3byR4Nnk2-iaKi0Makg.wQNbFhGH_OMkor71W42oLXIKHyuvDoc1o4GL9X2f6yEg.JPEG.seosanpost%2F34260_34751_5142.jpg&type=a340">
			</div>
			<div class="swiper-slide">
				<img
					src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20100820_222%2Fccy307_1282274594171m4KTm_JPEG%2FDSC_0018.JPG&type=a340">
			</div>
			<div class="swiper-slide">
				<img
					src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2F20111013_159%2Fhappypostmc_13185154080297qLPc_jpg%2F%25C7%25CF%25BE%25E6%25C6%25AE_%25C1%25D6%25B8%25D4%25B4%25D9%25C1%25FC_011_happypostmc.jpg&type=a340">
			</div>
			<div class="swiper-slide">
				<img
					src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MDVfMTQ3%2FMDAxNjI1NDg5MjE1NzEy.2yovtiQdxCcRAnN2sEehW2qYfWiSFgK9FVqQs_-_gpgg.DliWzZs0G2KXQQpv8N-quQBr47vLhEM9DbvcfyX9DK8g.JPEG.tesslove2000%2F112.jpg&type=a340">
			</div>
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
			slidesPerView : 3,
			spaceBetween : 30,
			slidesPerGroup : 3,
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
</body>
</html>






<%@ include file="/layout/footer.jsp"%>