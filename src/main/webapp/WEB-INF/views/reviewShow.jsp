<%@page import="dto.ReviewImage"%>
<%@page import="dto.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int hotel_no = (int)request.getAttribute("hotel_no");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/httpRequest.js"></script>

<script type="text/javascript">
function send() {
	
	//전달 파라미터 구성
	//var hotel_no = request.getAttribute(hotel_no);
<%-- 	var params = "hotel_no=" + <%= hotel_no %>
	
	//URL 구성
	var url = '<%=request.getContextPath() %>/WEB-INF/views/reviewShow_ok.jsp' --%>

	
	//AJAX 요청 전송
	sendRequest('GET',url,params,callback)
}

function callback() {
	
}
	if(httpRequest.readyState == 4) { //DONE, 응답 완료
		if(httpRequest.status == 200) { //200 OK. 정상 응답
			
			//응답 처리
			appendResult();
		}
	}
}

function appendResult() {
	
	//응답데이터를 #result에 반영하기
	result.innerHTML = httpRequest.responseText
	
}

</script>

</head>
<body>

<button oncilck="send()">리뷰</button>
<div class="result" id="result"> </div>

</body>
</html>