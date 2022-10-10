<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
$(document).ready(function() {
	
	//객실 상세페이지 가기
	$("#roomOk").click(function() {
		$(location).attr('href', './roomDetail')
	})

})
</script>
</head>

<body>


<h1>객실 삽입 성공 ! </h1>

<br>
<br>


<div class="text-center">
	<button id="roomOk" class="btn btn-outline-dark">객실 상세페이지로가기</button>
</div>



</body>
</html>