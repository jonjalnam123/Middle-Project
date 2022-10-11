<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



<style type="text/css">

#bookinginfo{ 
	margin-left : 18%;
	margin-top: -5%;
	text-align: left; 
	float: left;
	width: 30%;
	font-family: 'Jua', sans-serif;
	
	
}

.right {
	padding: 2%;
	margin-left: 51%;
	width: 300px;
	background-color: #FFF0F0;
	border: 0;
	border-radius: 10px;
	font-family: 'Jua', sans-serif;

}

#username {
	width: 300px; 
	height: 30px;
    font-size: 13px;
    padding-left: 10px; 
    border-radius: 5px;
	border: 1px solid #ffefea; 
	background-color: #fff0f0;
}

#userphone {
	width: 300px; 
	height: 30px;
    font-size: 13px;
    padding-left: 10px; 
    border-radius: 5px;
	border: 1px solid #ffefea;  
	background-color: #fff0f0;
}


#payBtn{
	width: 300px; 
	height: 40px; 
	margin: 10px; 
	border: 0; 
	cursor: pointer;
	border-radius: 5px; 
    font-size: 18px;
    font-weight: bold; 
    color: #fff; 
    background: #F59696;
    font-family: 'Jua', sans-serif;
    letter-spacing: 1.5px;

 
}

.btn {
	margin-left: 49.5%;
	margin-top: -3%;
	float: left;
}

.form-control {
	width: 150px;
	outline: black;
}

input[type='checkbox'] {

    width:20px;
    height:20px;
    background:white;
    border-radius:5px;
    border:2px solid #555;
    margin-top: 1%;
}

 input[id="a"] {
    position: relative;
    top: 5px;
}

.checkk {
float: left;
}


</style>

<script type="text/javascript">
function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('info');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
</script>




<div id="bookinginfo">
	<form action="/booking" method="post">
		<h2>예약 정보</h2>
			<hr>
		<h4>예약자정보</h4>
			<input type="text" name="username" id="username" class="input" placeholder="홍길동" ><br>
		<h4>휴대폰 번호</h4>
			<input type="text" name="userphone" id="userphone" class="input" placeholder="01012345678"><br>
		<hr>
		<h3><b>총액</b></h3>
			<hr>
		<h4><b>결제 수단</b></h4>
		<select class="form-control">
 			 <option selected>계좌이체</option>
 			 <option value="1">신용/체크카드</option>
  			<option value="2">무통장입금</option>
  			<option value="3">신용/체크카드</option>
		</select><br> 
		
			<input type='checkbox' name='info' id="a" value='selectall'onclick='selectAll(this)' /> <b>전체동의</b><br /> 
			<input type='checkbox' name='info' id="a" value='info' /> [필수] 만 14세 이상 이용 동의<br />
			<input type='checkbox' name='info' id="a" value='info' /> [필수] 개인정보 수집 및 이용 동의<br /> 
			<input type='checkbox' name='info' id="a" value='info' /> [필수] 개인정보 제 3자 제공 동의<br /> 
			<input type='checkbox' name='info' id="a" value='info' /> [필수] 숙소이용규칙 및 취소/환불규정 동의<br />
</div>

		<div class="right">
			<div>
			<h5>숙소명</h5><br><br>
			<h5>객실명</h5><br><br>
			<h5>체크인 시간</h5><br><br>
			<h5>체크아웃 시간</h5><br><hr>
			<h5>총 결제금액(VAT포함)</h5><br><br>
			</div>
		</div>	
		
			<div class="btn">
			<button id="payBtn">결제하기</button>
		</div>
	</form>


<%@ include file="/layout/footer.jsp" %>
