<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>
<% List<Map<String, Object>> dList = (List) request.getAttribute("dList"); %>

<style type="text/css">
ul{ list-style: none; display: inline-block; padding-left: 2px;}

hr{color: #000;}

#btnCancel{width: 400px; height: 50px; margin: 10px; border-radius: 5px; border: 0; cursor: pointer;
    background: linear-gradient(to left, #f857a6, #ff5858);
    color: #fff; font-weight: bold; font-size: 18px;
}

</style>

<% for(int i = 0; i < dList.size(); i++) { %>
<h1>예약 내역 상세</h1>
<ul>
	<li>
		<ul>
			<li><%=dList.get(i).get("hotel_name") %></li>
			<li><%=dList.get(i).get("room_type") %></li>
		</ul>
	</li><br>
	
	<li>
		<ul>
			<li>체크인 <%=dList.get(i).get("hotel_in") %> <%=dList.get(i).get("hotel_intime") %></li>
			<li>체크아웃 <%=dList.get(i).get("hotel_out") %> <%=dList.get(i).get("hotel_outtime") %></li>
		</ul>
	</li><br>
	
	<li>
		<ul>
			<li>예약번호 <%=dList.get(i).get("booking_no") %></li>
			<li>예약자 이름 <%=session.getAttribute("username") %></li>
		</ul>
	</li><hr>
	
	<li>
		<ul>
			<li>결제정보</li>
			<li>총 결제금액<%=dList.get(i).get("pay_total") %></li>
		</ul>
	</li><hr>
</ul>
<button id="btnCancel"onclick="location.href='/booking/cancel?booking_no=<%=dList.get(i).get("booking_no")%>'">예약 취소</button>
<% } %>

<%@ include file="/layout/footer.jsp" %>









