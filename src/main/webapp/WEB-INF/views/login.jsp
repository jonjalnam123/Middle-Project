<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp" %>

<style type="text/css">
#page{
	text-align: center;
	position: relative;
	top: 187px;
}

.input {
	width: 282px;
	height: 32px;
	border: 1px solid #ccc;
}

label{
	position: relative;
	left: -54px;
	font-size: 13px;
	color: red;
}

button{
	width: 282px;
	height: 36px;
	border: 0;
	background: #44a3e3;
}

a {
	position: relative;
	font-size: 12px;
	text-decoration: none;
	color: #686868;
}

</style>

</head>
<body>

<div id="page">
<form action="" method="post">

<input type="text" name="usereamil" id="useremail" class="input" placeholder="이메일"><br>
<!-- <label>이메일 주소를 확인해주세요</label><br><br> -->
<input type="password" name="userpw" id="userpw" class="input" placeholder="비밀번호"><br>
<!-- <label>비밀번호가 일치하지 않습니다</label><br><br> -->
<button id="btnLogin">로그인</button>

</form>
<a href="/findEamilPw" style="left: -54px;">이메일/비밀번호 찾기</a>
<a href="/join" style="right: -53px;">회원가입</a>
</div>


<%@ include file="/layout/footer.jsp" %>
