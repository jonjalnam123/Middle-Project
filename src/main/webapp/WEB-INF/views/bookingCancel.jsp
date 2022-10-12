<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>
<% List<Map<String, Object>> dList = (List) request.getAttribute("dList"); %>

<style type="text/css">
ul{ list-style: none; }

hr{color: #000;}

</style>

<% for(int i = 0; i < dList.size(); i++) { %>
<h1>예약 취소</h1>
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
			<li>환불금액 및 환불내용을 확인하신 후</li> 
			<li>정말 예약취소를 원하시면 취소를 진행해주세요.</li>
		</ul>
	</li><br>
	
	<li>
		<ul>
			<li><p style="font-weight: bold;">환불 예정 정보</p></li>
			<li>결제금액 <%=dList.get(i).get("pay_total") %></li>
			<li>환불방법 <%=dList.get(i).get("pay_kind") %></li>
		</ul>
	</li><hr>
	
	<li>
		<ul>
			<li>최종 환불금액<%=dList.get(i).get("pay_total") %></li>
		</ul>
	</li><hr>
	
	<li>
		<ul>
			<li>취소, 변경, 환불 등</li>
			<li>① 서비스 이용에 대한 취소 및 환불규정은 전자상거래 등에서의 소비자보호에 관한 법령을 준수합니다.</li>
            <li>② "제휴판매자"는 별도의 취소 및 환불규정을 제정할 수 있으며 이를 상세페이지에 기재하고 "이용자"의 동의를 받은 경우 우선 적용됩니다.</li>
            <li>③ "회사"는 "제휴판매자" 에게 전②항의 규정이 없는 경우를 위하여 시설 별 취소환불규정을 제정할 수 있으며 이를 상세페이지에 기재하고 "이용자"의 동의를 받아 적용합니다.</li>
		</ul>
	</li>
</ul>
<button onclick="history.back(-1)">뒤로가기</button>
<button onclick="location.href='/booking/delete?booking_no=<%=dList.get(i).get("booking_no")%>'">취소 진행</button>
<% } %>

<%@ include file="/layout/footer.jsp" %>