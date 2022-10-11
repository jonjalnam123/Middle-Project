<%@page import="dto.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp"%>
<% List<Hotel> hotelList = (List) request.getAttribute("hotelList"); %>
    
  <style type="text/css">

table {
	border-collapse: collapse;
	width: 600px;
	margin: 60px auto;
}

td {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	text-align: center;
	padding: 5px 10px;
	font-size: 20px;
	font-weight: bold;
	
}

tbody tr:hover { background-color: skyblue; }

/* "메인으로" 버튼 높이 */
tfoot th { height: 80px; }

.htimg {
display: block;
width: 600px;
height: 280px;
margin: 0px auto;

}

</style>
   
    
    
    	<table>

		<% for (int i = 0; i < hotelList.size(); i++) { %>
		<thead>
		<tr>
			<th colspan="6">
			<a href="/hotel/detail?hotel_no=<%=hotelList.get(i).getHotel_no()%>"><img src="/upload/<%=hotelList.get(i).getHotel_photo() %>" class="htimg" alt="이미지 아님"></a>
			</th>
		</tr>
		</thead>
		<tbody>
			<tr>
				<td>
						<%=hotelList.get(i).getHotel_name() %>
				</td>
				
				<td><%=hotelList.get(i).getHotel_tel() %></td>
			</tr>
			<% } %>
		</tbody>
		<tfoot>
			<tr style=>
				<th colspan="7"><a href="/main"><button class="button">메인으로</button></a></th>
			</tr>
		
		</tfoot>

	</table>
    
    
    
    <%@ include file="/layout/footer.jsp"%>