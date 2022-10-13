<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dto.Hotel"%>

<% List<Hotel> list = (List) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

</style>

<body>

<h3>♥최다 찜 호텔</h3>
<% int mo = list.size()/3; %>
<% int na = list.size()%3; %>
<% int newStart  = 0; %>


		
			<% for (int i=0; i<mo*3;i++) { %>
			<div >
				<img src="/upload/<%= list.get(i).getHotel_photo() %>" alt="호텔 이미지 불러오기 실패!" width="200" height="100" display="inline" >
				<%= list.get(i).getHotel_name() %>
			</div>
			 <% newStart++; %>
   			 <% if(newStart != 0 && newStart %3 ==0) {%>
    		<br>
    		<% } %>
			 <% } %>
			 
			 
			 
<% for (int i=newStart; i<list.size();i++) { %>




<% } %>
</body>
</html>