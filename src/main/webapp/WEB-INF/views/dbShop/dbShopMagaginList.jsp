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
  	.checkFont h3 {
  		font-family: 'Montserrat', sans-serif;
		  font-size: 17px;
		  font-weight: lighter;
		  width: 65%;
		  margin: 0 auto;
		  padding: 20px;		   
  	}
  	.checkFont p {
  		font-family: 'Montserrat', sans-serif;
		  font-size: 14px; 
		  font-weight: lighter;
		  width: 65%;
		  margin: 0 auto; 
		  padding: 20px;		  
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
  </style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   	<div class="banner">[썸머 핫딜]-72시간 특가 바로가기</div>
		<div class="mainPhoto">
			<img src="${ctp}/images/magagin2.jpg"/>
		</div>
		<div class="checkFont">
			<h3>Get inspired</h3>
			<P>최신 인테리어 디자인 트렌드 및 다양한 인테리어 스타일을 확인해보세요.</P>
			<P>여러분의 공간을 돋보이게 하는 방법부터 어울리는 제품을 선택하는 방법에 이르기까지 다양한 인테리어 가이드가 준비되어 있습니다.</P>
			<P>이딸라 앤트레디션 등을 비롯한 유명 북유럽 브랜드, 디자이너 그리고 유럽의 유명 인플루언서와 관련한 독점 기사도 확인할 수 있으니 주기적으로 콘텐츠를 확인해보세요!</P>
		</div>
		<div class="button-item">
			<button class="button" onclick="location.href='${ctp}/product/disinstory';">디자인 스토리</button>
			<button class="button" onclick="location.href='${ctp}/product/intairastory';">인테리어 팁</button>
			<button class="button" onclick="location.href='${ctp}/product/shoppingstory';">쇼핑 스토리</button>
		</div>
		<div class="twoPhoto">
			<img src="${ctp}/images/magagin3.jpg"/>
		</div>
		<div class="bottom-item">
			<h4>인기 콘텐츠</h4>
			<div class="bottom-photo-item">
				<a href=""><img src="${ctp}/images/ewq1.jpg"></a>
				<a href=""><img src="${ctp}/images/ewq2.jpg"></a>
				<a href=""><img src="${ctp}/images/ewq3.jpg"></a>
				<a href=""><img src="${ctp}/images/ewq4.jpg"></a>
			</div>
		</div>
		<div class="threePhoto">
			<img src="${ctp}/images/magagin.jpg"/>
		</div>
	 <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px; margin-top: 100px;" />
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>