
<%@page import="dto.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- flagPickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/flatpicker.js"></script>   --%>  
<% List<Room> roominfo = (List) request.getAttribute("roominfo"); %>

<style type="text/css">

table {
border: 1px solid #ccc;
}

tr, td {
text-align: center;
vertical-align : middle;
font-size: 30px;
}


</style>
<script type="text/javascript">
$(document).ready(function() {
	var from = "";
	var to = "";
	<% for (int i = 0; i < roominfo.size(); i++) { %>
<%--  	$(document).on("click", "#bookingBtn", function() {
	
		var hotel_no = <%=roominfo.get(i).getHotel_no() %> 	
 		var room_no = <%=roominfo.get(i).getRoom_no() %>  
 		var room_price = '<%=roominfo.get(i).getRoom_price() %>' 
  		$("#room_price").val(room_price); 
	});  --%>
	<% } %> 
	var checkin = flatpickr("#checkin", {
		locale: "ko",
		minDate: "today",
		dateFormat: "Ymd",

		onChange: function(dateStr, dateObj) {
			checkout.set("minDate", dateObj);
			checkin.setDate(dateObj);
			from = $("#checkin").val();
			$("#checkin").val(from);
		}
	});
	var checkout = flatpickr("#checkout", {
		locale: "ko",
		minDate: "today",
		dateFormat: "Ymd",
		onChange: function() {
			to = $("#checkout").val();
			console.log(to);
			console.log(from); 
			$("#checkout").val(to);
		 		
		/* $.ajax({
			type: "GET",
			url: "/hotel/booking",
			data: { "to": to, "from": from},
			//dataType: "text",
			success: function(data) {
				console.log("전달성공");
			}
		});   */
			}
		})
	
	
});

</script>
	<!-- 날짜선택 -->
 <form action="/hotel/booking">
	<div class="checkDate">
		<div>  	
			<p>체크인</p>  	
			<input type="text" name="checkin" id="checkin" placeholder="체크인 날짜 선택" value=""/>
			  
			<p>체크인</p>  	
			<input type="text" name="checkout" id="checkout" placeholder="체크아웃 날짜 선택" value=""/> 
	
 		</div>
	</div>
	
<% for (int i = 0; i < roominfo.size(); i++) { %>

<table class="table">
	
		<tr>
			<td rowspan="5" style="width: 500px;">
			<img src="/upload/<%=roominfo.get(i).getRoom_img() %>" class="roomimg" alt="이미지 아님">
			</td>
			<td colspan="3"><%=roominfo.get(i).getRoom_type() %></td>
		</tr>
			<tr>
				<td>수용인원</td>
				<td><%=roominfo.get(i).getPeople() %></td>
				<td><%=roominfo.get(i).getMax_people() %></td>
			</tr>
			<tr>
				<td>가격</td>
				<td colspan="2"><%=roominfo.get(i).getRoom_price() %></td>
			</tr>
			<tr>
				<td><input type="hidden" name="hotel_no" value = "<%=roominfo.get(i).getHotel_no()%>"></td>
			    <td><input type="hidden" id="room_price" name="room_price" value="<%=roominfo.get(i).getRoom_price() %>"></td>
				<td colspan="3">
			<button type="submit" id="bookingBtn" name="room_no" value="<%=roominfo.get(i).getRoom_no()%>">예약하기</button></td>
			</tr>
	</table>
			<hr>
			<% } %>
</form> 