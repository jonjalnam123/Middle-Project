<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<style type="text/css">
#login_wrap{ text-align: center; position: relative; top: 187px; }

#useremail {
	border: 1px solid #d9d9d9; width: 400px; height: 50px;
    margin: 5px; padding-left: 10px; border-radius: 5px;
    box-sizing: border-box; font-size: 15px;
}

#userpw {
	border: 1px solid #d9d9d9; width: 400px; height: 50px;
    margin: 5px; padding-left: 10px; border-radius: 5px;
    box-sizing: border-box; font-size: 15px;
}

#btnLogin{
	width: 400px; height: 50px; margin: 10px; border-radius: 5px; border: 0; cursor: pointer;
    background: linear-gradient(to left, #f857a6, #ff5858);
    color: #fff; font-weight: bold; font-size: 18px;
}

.findjoin {
	text-align: left; font-size: 14px; font-weight: bold;
    margin: 0 0 10px 10px; cursor: pointer; color: #e32a62;
    
}
</style>


<div id="login_wrap">
	<form action="/Semi/login" method="post" name="loginform" onsubmit="return sendMain()">
		<input type="text" name="useremail" id="useremail" class="input" placeholder="이메일" ><br>
<!-- 		<span id="emailMsg"></span><br> -->
		<input type="password" name="userpw" id="userpw" class="input" placeholder="비밀번호"><br>
		<a href="/findPw" class="findjoin" style="position: relative; left: -158px;">비밀번호찾기</a><br>
		<button id="btnLogin">로그인</button>
	</form>
	<p>회원이 아니신가요? <a href="/Semi/join" class="findjoin">가입하기</a></p>
</div>


<script type="text/javascript">
const sendMain = () => {
	
	//변수선언
	const inputEmail = document.querySelector("#useremail");
	const inputPw = document.querySelector("#userpw");
	
	//이메일이 비어있을 경우
	if(inputEmail.value == ""){
		alert("이메일을 입력하세요");
		inputEmail.focus();
		return false;
	}
	
	// 이메일 형식 정규식
    const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
    // 이메일값이 정규식에 부합한지 체크
    if(!expEmailText.test(inputEmail.value)) {
        alert("올바른 이메일 형식이 아닙니다");
        inputEmail.focus();
        return false;
    }
    
    //비밀번호가 비어있을 경우
    if(inputPw.value == ""){
		alert("비밀번호를 입력하세요");
		inputPw.focus();
		return false;
	}
	
	return true;
}
</script>


<%@ include file="/layout/footer.jsp" %>
