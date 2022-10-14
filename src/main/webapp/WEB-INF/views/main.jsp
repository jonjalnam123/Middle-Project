<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/layout/header.jsp"%>


<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

	  	      $.ajax({
	  	         type: "GET",
	  	     	url: "/maxMarked", 
	  			datatype: "html",
	  	         success: function(data) {
	  	            console.log("성공");
	  	            $("#result").html(data);
	  	         }
	  	      })
		
	})
	</script>
	

<style type="text/css">

</style>
<center>
 <img src="/resources/image/mainImage.png" width="700" height="400">
</center>


<div id="result" class="result">
</div>

	
<%@ include file="/layout/footer.jsp"%>