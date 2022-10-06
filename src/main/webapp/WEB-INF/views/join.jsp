<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/layout/header.jsp" %>

<style type="text/css">
#join_wrap {
	text-align: center;
	position: relative;
	top: 187px;
}

#joinform > p{  
	position: relative; left: 566px; font-size: 17px; font-weight: bold; margin: 0;
	padding: 0; text-align: left; width: 400px;
}

#joinform > input{
	border: 1px solid #d9d9d9; width: 400px; height: 50px;
    margin: 5px; padding-left: 10px; border-radius: 5px;
    box-sizing: border-box; font-size: 15px;
}

#btnJoin{
	width: 400px; height: 50px; margin: 10px; border-radius: 5px; border: 0; cursor: pointer;
    background: linear-gradient(to left, #f857a6, #ff5858);
    color: #fff; font-weight: bold; font-size: 18px;
}
</style>

<div id="join_wrap">
	<form action="/Semi/login" method="post" id="joinform">
		<p>이름</p>
		<input type="text" id="username" name="username" placeholder="예)홍길동" autofocus><br><br>
		
		<p>이메일</p>
		<input type="text" id="username" name="username" placeholder="이메일을 입력하세요"><br><br>
		
		<p>휴대폰 번호</p>
		<input type="text" id="username" name="username" placeholder="휴대폰번호를 입력하세요"><br><br>
		
		<p>비밀번호</p>
		<input type="text" id="username" name="username" placeholder="비밀번호를 입력하세요"><br><br>
		
		<p>비밀번호 확인</p>
		<input type="text" id="username" name="username" placeholder="비밀번호를 입력하세요"><br><br>
	
		<button id="btnJoin">가입하기</button>
	</form>
</div>


<%@ include file="/layout/footer.jsp" %>









