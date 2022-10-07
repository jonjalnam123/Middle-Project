<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="/layout/header.jsp"%>

    
    <style type="text/css">
    
    #back {
    border:1px solid black;
    width: 800px;
	height: 900px;
	position: absolute;
	top: 55%;
	left: 50%;
	transform: translate(-50%, -50%);
    background: lightgray;
    }
    
    #button{
    text-align: center;
    
    }
    
    #list1 img {
   
	width: 500px;
	height: 200px;
	position: absolute;
	top: 15%;
	left: 50%;
	transform: translate(-50%, -50%);
    }
    
    #list2 img{
    width: 500px;
	height: 200px;
	position: absolute;
	top: 47%;
	left: 50%;
	transform: translate(-50%, -50%);
    }
    
    #list3 img{
   
	width: 500px;
	height: 200px;
	position: absolute;
	top: 80%;
	left: 50%;
	transform: translate(-50%, -50%);
    }
    
    #ex1{
    	position: absolute;
	top: 30%;
	left: 50%;
	transform: translate(-50%, -50%);
    }
    </style>
   
    
    
    <div id=back>
    
    <div id=button>
    <button>낮은 가격순</button>
    <button>높은 가격순</button>
    <button>리뷰 많은순</button>
    </div><br>
    
    <div id=list1>
    <a href="#"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MDVfMTQ3%2FMDAxNjI1NDg5MjE1NzEy.2yovtiQdxCcRAnN2sEehW2qYfWiSFgK9FVqQs_-_gpgg.DliWzZs0G2KXQQpv8N-quQBr47vLhEM9DbvcfyX9DK8g.JPEG.tesslove2000%2F112.jpg&type=a340"></a>    
    </div>
    
    <div id=ex1>    

    </div>
	
	<div id=list2>
	<a href="#"><img src="https://ldb-phinf.pstatic.net/20190212_66/1549945977305nNUCX_JPEG/jAcHTcXXNgO2Sznd43k2qtBE.jpg"></a>
	</div>
	<div id=ex2>
    
    </div>
	
	<div id=list3>
	<a href="#"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fwww.hotelscombined.co.kr%2Frimg%2Fhimg%2Ff8%2F55%2F45%2Frevato-12950-13687875-568470.jpg%3Fwidth%3D720%26height%3D576%26crop%3Dtrue&type=sc960_832"></a>
	</div>
 	<div id=ex3>
   
    </div>
    
    </div>
   
    
    
    
    <%@ include file="/layout/footer.jsp"%>