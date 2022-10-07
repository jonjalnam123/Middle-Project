<%@page import="dao.impl.Semi_UserDaoImpl"%>
<%@page import="dao.face.Semi_UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<%-- 비로그인 상태 --%>
<%	if( session.getAttribute("exists") == null ) { %>
<strong>등록된 정보가 없습니다</strong><br><br>
<button id="btnBack">다시 찾기</button>
<!-- <button onclick="location.href='./member/login'">로그인</button> -->
<%	} %>

<%-- 로그인 상태 --%>
<%	if( session.getAttribute("exists") != null && (boolean) session.getAttribute("exists") ) { %>
<strong><%=session.getAttribute("username") %>님의 비밀번호는</strong><br><br>
<strong><%=session.getAttribute("userpw") %>입니다</strong><br><br>
<form action="/findPw/result" method="post">
<button>로그인 하러가기</button>
</form>
<!-- <button onclick="location.href='./member/logout'">로그아웃</button> -->
<%	} %>


<script type="text/javascript">
//취소 버튼
$("#btnBack").click(function() {
	history.go(-1) //뒤로가기
})
</script>

<%@ include file="/layout/footer.jsp" %>