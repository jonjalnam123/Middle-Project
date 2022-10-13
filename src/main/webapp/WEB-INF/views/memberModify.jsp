<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<h1>회원 정보 수정</h1>

	<form action="/member/modify" method="post" enctype="multipart/form-data">
	
		<label for="upfile">
          프로필 이미지 첨부 또는 수정<br><br><input type="file" name="upfile" id="upfile" />
        </label>
        
		<p>이름</p>
		<input type="text" id="username" name="user_name" placeholder="개명한 이름 기입" autofocus class="textput"><br><br>
		
		<p>현재 비밀번호</p>
		<input type="text" id="" name="" placeholder="비밀번호를 입력하세요" class=""><br><br>
		
		<p>새 비밀번호</p>
		<input type="text" id="" name="" placeholder="비밀번호를 입력하세요" class=""><br><br>
		
		<p>새 비밀번호 확인</p>
		<input type="text" id="" name="user_pw" placeholder="비밀번호를 입력하세요" class=""><br><br>
	
		<button id="btnJoin" type="submit">수정 완료</button>
	</form>


</body>
</html>