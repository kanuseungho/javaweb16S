<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style type="text/css">
	.bener{
  		width: 100%;
  		height: 30px;
  		background-color:orange;
  		text-align: center;
  		color: white;
  		margin-top: 130px;
  	}
  </style>
</head>
<body>
<p><br/></p>
<div class="container">

</div>
<!-- 메뉴(nav)... -->
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="bener">
	여름맞이 기획전 모아보기 - 최대 50% OFF
</div>
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
 
<!-- Page content -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  <!-- The Band Section -->
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:1200px" id="band">
    <h2 class="w3-wide">북유럽 감성 조명 특가모음</h2>
    <p class="w3-opacity"><i>sale</i></p>
    <p class="w3-justify">     
    <div class="w3-row w3-padding-32">
    
	 <div class="w3-quarter">
	  <div style="position: relative; ">
	    <a href="#">
	      <img src="${ctp}/images/photo1.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width: 300px; height: 400px;">
	      <p style="position: absolute; top: 0; right: 0; background-color: red; color: white; padding: 5px;">SALE</p>
	    </a>
	  </div>
		</div>
		<div class="w3-quarter">
		  <div style="position: relative; ">
		    <a href="#">
		      <img src="${ctp}/images/photo2.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width: 300px; height: 400px;">
		      <p style="position: absolute; top: 0; right: 0; background-color: red; color: white; padding: 5px;">SALE</p>
		    </a>
		  </div>
		</div>
		<div class="w3-quarter">
		  <div style="position: relative; ">
		    <a href="#">
		      <img src="${ctp}/images/photo3.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width: 300px; height: 400px;">
		      <p style="position: absolute; top: 0; right: 0; background-color: red; color: white; padding: 5px;">SALE</p>
		    </a>
		  </div>
		</div>
		<div class="w3-quarter">
		  <div style="position: relative;">
		    <a href="#">
		      <img src="${ctp}/images/photo4.jpg" class="w3-round w3-margin-bottom" alt="Random Name" style="width: 300px; height: 400px;">
		      <p style="position: absolute; top: 0; right: 0; background-color: red; color: white; padding: 5px;">SALE</p>
		    </a>
		  </div>
		</div>
	</div>
	</div>
</div>

<!-- Image of location/map -->
<img src="${ctp}/images/map.jpg" class="w3-image w3-greyscale-min" style="width:100%; height: 400px">
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>