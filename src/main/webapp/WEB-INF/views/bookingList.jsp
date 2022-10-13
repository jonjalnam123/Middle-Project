<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp" %>
<% List<Map<String, Object>> list = (List) request.getAttribute("list"); %>

<style type="text/css">
/* #list-wrap { list-style: none; text-align: center; float: left;} */

li {list-style: none; float: left;}
ul {list-style: none;}

/* .border{ border: 1px solid #000; width: 501px; padding: 0 0 0 0; } */

/* img { width: 500px; height: 350px; } */


</style>

<h2 style="text-align: center;">예약 내역</h2><br>

<ul id="list-wrap">
<% for(int i = 0; i < list.size(); i++) { %>
	<li>
		<ul class="border">
			<li><a  href="/booking/detail?booking_no=<%=list.get(i).get("booking_no") %>">
			<img src="/upload/<%=list.get(i).get("hotel_photo") %>" alt="이미지 아님"></a></li>
			<li><%=list.get(i).get("hotel_name") %></li>
			<li><%=list.get(i).get("hotel_in") %> <%=list.get(i).get("hotel_intime") %></li>
		</ul>
	</li>
<% } %>
</ul>


<%@ include file="/layout/footer.jsp" %>