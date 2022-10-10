<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Room" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script type="text/javascript">
	$(document).ready(function() {
	 	$("#DetailBtn").change(function() {		
			var hotel_no = 1

			
			$.ajax({
				type: "GET" ,
				url: "/room//info?no="+no,,
				datatype: "html",
				success: function(data) {
					console.log("성공");
					$("#result").html(data);
				}
				
			})  
			
		}) 
	 	})
	 	
	 	
	 	
</script>
<body>

</body>
</html>