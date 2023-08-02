<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800;900&display=swap" rel="stylesheet">
	<style>
		body {
			font-family: 'Montserrat', sans-serif;
		}
		.mySlides {display: none}
		.bener{
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
		.sale-overlay {
			position: absolute;
			top: 10px;
			right: 10px;
			padding: 5px 10px;
			background-color: red;
			color: white;
			font-weight: bold;
		}
		.w3-cards {
			position: relative;
		}
		.salebener{
			text-align: center;
		}
		    /* 이미지 컨테이너를 가로로 배열하도록 수정 */
    .w3-container {
        display: inline-block;
    }

    /* 이미지 컨테이너의 너비와 간격 조정 */
    .w3-container {
        width: 25%; /* 4개의 컨테이너가 한 줄에 나오도록 25%로 설정 */
        vertical-align: top; /* 이미지 컨테이너를 상단 정렬로 배치 */
        max-width: 410px;
        max-height: 410px;
  
    }
    .mediumSize{
    	display: flex;
		  justify-content: center;
		  gap: 30px; /* 적당한 간격 설정 */
		  
	 }
    .mediumSize img{    
		  width: 100%;
		  height: 100%;
		  max-height: 700px; 
		  max-width: 700px; 
	 }
	 .salebener2{
	 	margin-top: 100px;
	 	text-align: center;
	 	
	 }
	 .orange-footer {
	  background-color: orange;
	  padding: 20px;
	  text-align: center;
	  color: white;
	  font-weight: bold;
	}
	.photowhich{
	  align-items: center;
		text-align: center;
	}
	
        
	</style>
</head>
<body>
<!-- 메뉴(nav)... -->
<jsp:include page="/WEB-INF/views/include/nav.jsp" />

<div class="bener">
	<a href="#">${noticeVO.topBanner}</a>
</div>

<jsp:include page="/WEB-INF/views/include/slide.jsp" />

<div class="salebener">
	<h2>
		<c:forEach var="vo" items="${subTitleVOS}">
			<c:if test="${vo.homeSubTitle=='middleSubTitle1'}">
				${vo.homeSubTitleText}
			</c:if>
		</c:forEach>
	</h2>
</div>
<div class="photowhich">
	<c:forEach var="bannerVO" items="${bannerVOS}">
	    <c:if test="${bannerVO.photoPosition == 'tableWerePart1' || bannerVO.photoPosition == 'tableWerePart2' || bannerVO.photoPosition == 'tableWerePart3' || bannerVO.photoPosition == 'tableWerePart4'}">
	        <div class="w3-container">
	            <div class="w3-cards" style="position: relative;">
	                <a href="${ctp}/product/productDetailed?idx=${bannerVO.photoRoute}"><img src="${ctp}/data/banner/${bannerVO.imageFile}" style="max-width:100%; max-height: 40%;"></a>                
	                <c:if test="${bannerVO.sale=='YES'}">
	                	<div class="sale-overlay">SALE</div>
	                </c:if>
	            </div>
	        </div>
	    </c:if>
	</c:forEach>
</div>
<div class="salebener2">
	<h2>
		<c:forEach var="vo" items="${subTitleVOS}">
			<c:if test="${vo.homeSubTitle=='middleSubTitle2'}">
				${vo.homeSubTitleText}
			</c:if>
		</c:forEach>
	</h2>
</div>
<div class="mediumSize">
	<c:forEach var="bannerVO" items="${bannerVOS}">
		<c:if test="${bannerVO.photoPosition == 'MediumSizedPhoto1' || bannerVO.photoPosition == 'MediumSizedPhoto2'}">
			<a href="${ctp}/product/productDetailed?idx=${bannerVO.photoRoute}" ><img src="${ctp}/data/banner/${bannerVO.imageFile}"/></a>
		</c:if>
	</c:forEach>
</div>
<!-- footer -->
<footer class="orange-footer">
  <p>This is the footer content.</p>
  <p>Design: Han Seung Ho , Programming: Han Seung Ho......</p>
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
</footer>
</body>
</html>
