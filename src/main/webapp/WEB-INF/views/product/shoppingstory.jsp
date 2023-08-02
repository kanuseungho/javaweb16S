<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style type="text/css">
  	.mainPhoto img{
  		width: 100%;
  		margin-top: 30px;
  	}  	  
  	.banner{
  		width: 100%;
		  height: 30px;
		  background-color: orange;
		  text-align: center;
		  color: white;
		  margin-top: 145px;
		  font-family: 'Montserrat', sans-serif;
		  font-size: 14px;
		  font-weight: bold;
		  display: flex;
		  align-items: center;
		  justify-content: center;
  	}

  	
  	.button-item {
		  text-align: center;
		  padding: 20px;
		  margin-top: 15px;
		}
		
		.button {
		  display: inline-block;
		  padding: 10px 20px;
		  border: 1px solid #ccc;
		  border-radius: 5px;
		  background-color: white;
		  color: black;
		  text-decoration: none;
		  transition: background-color 0.3s ease;
		 	margin: 10px;
		}
		
		.button:hover {
		  background-color: #f5f5f5;
		}
		.twoPhoto{
			width: 80%;
			margin: 0 auto;
		}
		.bottom-item{
			width: 100%;
			background-color: #f5f5f5; 
			align-items: center;
			text-align: center;
		}
		.bottom-photo-item img{
			margin: 10px;
		}
		.threePhoto{
			width: 80%;
			margin: 0 auto;
		}
		.checkFont {
   	 width: 80%;
    	margin: 0 auto;
    	margin-top: 100px;
	 }

  </style>


</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   	<div class="banner">[썸머 핫딜]-72시간 특가 바로가기</div>
		<div class="mainPhoto">
			<img src="${ctp}/images/shopping.jpg"/>
		</div>
		<div class="checkFon" >
			<p>노르딕네스트에서 판매하는 브랜드, 카테고리 및 콜렉션에 대한 다양한 정보를 모았습니다. 똑똑한</p>
			<p>쇼핑을 도와주는 알찬 정보, 지금 바로 확인해보세요!</p>
		</div>
		<div class="mainPhoto">
			<img src="${ctp}/images/shopping2.jpg"/>
		</div>
		
		
	 <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px; margin-top: 100px;" />
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>