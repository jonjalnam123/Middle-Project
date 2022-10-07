<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/layout/header.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

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

#useremail{
	border: 1px solid #d9d9d9; width: 400px; height: 50px;
    margin: 5px; padding-left: 10px; border-radius: 5px; position: relative;
    box-sizing: border-box; font-size: 15px; font-weight: normal; left: -11px;
}

#btnJoin{
	width: 400px; height: 50px; margin: 10px; border-radius: 5px; border: 0; cursor: pointer;
    background: linear-gradient(to left, #f857a6, #ff5858);
    color: #fff; font-weight: bold; font-size: 18px;
}

/* #btnCheck{ */
/* 	width: 48px; height: 42px; position: relative; top: -2px; margin-left: 0; */
/* 	border: 0; box-sizing: content-box; background: linear-gradient(to left, #f857a6, #ff5858); */
/* 	color: #fff; border-radius: 5px; */
/* } */

</style>


<div id="join_wrap">
	<form action="/join" method="post" id="joinform" name="joinform" onsubmit="return sendLogin()">
	<h1>회원가입</h1><br><br>
		<p>이름</p>
		<input type="text" id="username" name="username" placeholder="예)홍길동" autofocus><br><br>
		
		<p>이메일</p>
		<p><input type="text" id="useremail" name="useremail" placeholder="이메일을 입력하세요">
<!-- 		<input type="button" id="btnCheck" value="확인" onclick="chkEmail()"></p> -->
		<p id="result">&nbsp;</p>
		
		<p>휴대폰 번호</p> 
		<input type="text" id="userphone" name="userphone" placeholder="휴대폰번호를 입력하세요"><br><br>
		
		<p>비밀번호</p> <p style="font-weight: normal; font-size: 11px;"> * 4자 이상 20자 이하</p>
		<input type="text" id="userpw" name="userpw" placeholder="비밀번호를 입력하세요"><br><br>
		
		<p>비밀번호 확인</p>
		<input type="text" id="userpwChk" name="userpwChk" placeholder="비밀번호를 입력하세요"><br><br>
	
		<button id="btnJoin">가입하기</button>
	</form>
</div>



<script type="text/javascript">
$(function(){
	$("#userphone").on('keyup', numReplace);
})


function numReplace(){
	const inputNum = document.querySelector("#userphone");
	inputNum.value = inputNum.value.replace(/-/gi, '');
}


const sendLogin = () => {
	
	//변수선언
	const inputName = document.querySelector("#username");
	const inputEmail = document.querySelector("#useremail");
	const inputNum = document.querySelector("#userphone");
	const inputPw = document.querySelector("#userpw");
	const inputPwChk = document.querySelector("#userpwChk");
	
	
	//이름이 비어있을 경우
	if(inputName.value == ""){
		alert("이름을 입력하세요");
		inputName.focus();
		return false;
	}
	
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
    
  	//휴대폰번호가 비어있을 경우
	if(inputNum.value == ""){
		alert("휴대폰번호를 입력하세요");
		inputNum.focus();
		return false;
	}
    
 	// 핸드폰 번호 형식 정규식
    const expHpText = /^\d{3}\d{3,4}\d{4}$/;
    // userphone값이 정규식에 부합한지 체크
    if(!expHpText.test(inputNum.value)) {
        alert('숫자만 입력하세요');
        inputNum.focus()
        return false;
    }
    
    //비밀번호가 비어있을 경우
    if(inputPw.value == ""){
		alert("비밀번호를 입력하세요");
		inputPw.focus();
		return false;
	}
    
 	// 비밀번호 확인칸이 비어있으면 실행.
    if(inputPwChk.value == '') {
        alert('비밀번호 확인을 입력해주세요.');
        inputPwChk.focus();
        return false;
    }
    // userpw값이 4자 이상 20자 이하를 벗어나면 실행.
    if(inputPw.value.length < 4 || inputPw.value.length > 20){
        alert("비밀번호는 4자 이상 20자 이하로 입력해주세요.");
        inputPw.focus();
        return false;
    }
	// userpw값과 userpw_ch값이 다르면 실행.
    if(inputPw.value != inputPwChk.value) {
        alert('비밀번호가 다릅니다. 다시 입력해주세요.');
        inputPwChk.focus();
        return false;
    }
	
	return true;
}

</script>


<%@ include file="/layout/footer.jsp" %>









