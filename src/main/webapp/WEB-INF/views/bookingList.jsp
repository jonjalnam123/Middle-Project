<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp" %>
<% List<Map<String, Object>> list = (List) request.getAttribute("list"); %>

<style type="text/css">
ul { list-style: none; text-align: center;}
</style>

<h2>내 정보</h2><br>

<% for(int i = 0; i < list.size(); i++) { %>
<ul>
	<li>
		<ul>
			<li><a  href="/booking/detail?booking_no=<%=list.get(i).get("booking_no") %>">
			<img src="/upload/<%=list.get(i).get("hotel_photo") %>" alt="이미지 아님"></a></li>
			<li><%=list.get(i).get("hotel_name") %></li>
			<li><%=list.get(i).get("hotel_in") %> <%=list.get(i).get("hotel_intime") %></li>
		</ul>
	</li>
</ul>
<% } %>


<%@ include file="/layout/footer.jsp" %>