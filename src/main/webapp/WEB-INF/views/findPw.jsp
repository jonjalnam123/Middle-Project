<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp" %>


<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
#findPw_wrap { text-align: center; }

#findPwform > p{  
	position: relative; left: 566px; font-size: 17px; font-weight: bold; margin: 0;
	padding: 0; text-align: left; width: 400px;
}

#findPwform > input{
	border: 1px solid #d9d9d9; width: 400px; height: 50px;
    margin: 5px; padding-left: 10px; border-radius: 5px;
    box-sizing: border-box; font-size: 15px;
}

#findPwEmail{
	border: 1px solid #d9d9d9; width: 400px; height: 50px;
    margin: 5px; padding-left: 10px; border-radius: 5px; position: relative;
    box-sizing: border-box; font-size: 15px; font-weight: normal; left: -11px;
}

#btnFindPw{
	width: 190px; height: 50px; margin: 10px; border-radius: 5px; border: 0; cursor: pointer;
    background: linear-gradient(to left, #f857a6, #ff5858);
    color: #fff; font-weight: bold; font-size: 18px;
}

#btnCancel{
	width: 190px; height: 50px; margin: 10px; border-radius: 5px; border: 0; cursor: pointer;
    background: linear-gradient(to left, #f857a6, #ff5858);
    color: #fff; font-weight: bold; font-size: 18px;
}


</style>


<div id="findPw_wrap">
<h1>비밀번호 찾기</h1><br><br>
	<form action="/findPw" method="post" id="findPwform" name="findPwform" onsubmit="return chk_input()">
		<p>이메일</p>
		<p><input type="text" id="findPwEmail" name="findPwEmail" placeholder="이메일을 입력하세요" autofocus><br><br>
		
		<p>휴대폰 번호</p>
		<input type="text" id="findPwPhone" name="findPwPhone" placeholder="휴대폰번호를 입력하세요"><br><br>
		<button id="btnFindPw">확인</button> <button id="btnCancel">취소</button>
	</form>
</div>


<script type="text/javascript">
//취소 버튼
$("#btnCancel").click(function() {
// 		history.go(-1) //뒤로가기
	$(location).attr('href', '/login') //메인으로 가기
})


$(function(){
	$("#findPwPhone").on('keyup', numReplace);
})

function numReplace(){
	const inputNum = document.querySelector("#findPwPhone");
	
	inputNum.value = inputNum.value.replace(/-/gi, '');
}


function chk_input(){
	const frm = document.findPwform;
// 	const email = document.querySelector("#findPwEmail");
// 	const phone = document.querySelector("#findPwPhone");
	
	if(frm.findPwEmail.value == ''){
		alert("이메일을 입력하세요")
		findPwEmail.focus();
		return false;
	}
	
	if(frm.findPwPhone.value == ''){
		alert("휴대폰번호를 입력하세요")
		findPwPhone.focus();
		return false;
	}
	
	return true;
	
// 	frm.method="post";
// 	frm.action="./findPwResult.jsp"; //넘어간화면
// 	frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
 }
 
</script>



<%@ include file="/layout/footer.jsp" %>

