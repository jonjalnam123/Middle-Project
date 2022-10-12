<%@page import="dao.impl.Semi_UserDaoImpl"%>
<%@page import="dao.face.Semi_UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<style type="text/css">
.not-found {text-align: center; position:relative; top: 100px;}
.found {text-align: center; position:relative; top: 100px;}

.not-found > strong { font-size: 20px; }

.found > p { font-size: 20px; }
.found > strong { font-size: 20px; text-decoration: underline; color: #e32a62;}

.not-found > button{
	width: 400px; height: 50px; margin: 10px; border-radius: 5px; border: 0; cursor: pointer;
    background: linear-gradient(to left, #f857a6, #ff5858);
    color: #fff; font-weight: bold; font-size: 18px;
}

.found > form > button{
	width: 400px; height: 50px; margin: 10px; border-radius: 5px; border: 0; cursor: pointer;
    background: linear-gradient(to left, #f857a6, #ff5858);
    color: #fff; font-weight: bold; font-size: 18px;
}
</style>

<div class="not-found">
<%	if(session.getAttribute("res") == null ) { %>
<strong>등록된 정보가 없습니다.</strong><br><br><br><br>
<button id="btnBack">다시 찾기</button>
<%	} %>
</div>

<div class="found">
<%if( session.getAttribute("res") != null && (boolean) session.getAttribute("res")) { %>
<p>회원님의 임시비밀번호는</p><br>
<strong>" <%=session.getAttribute("userpw") %> " 입니다.</strong><br><br><br>
<p>로그인 후 [내 정보 수정] 에서 변경하실 수 있습니다.</p><br><br>
<form action="/findPw/result" method="post">
<button id="btnGologin">로그인 하러가기</button>
</form>
<%	} %>
</div>

<script type="text/javascript">
//취소 버튼
$("#btnBack").click(function() {
	history.go(-1) //뒤로가기
})
</script>

<%@ include file="/layout/footer.jsp" %>