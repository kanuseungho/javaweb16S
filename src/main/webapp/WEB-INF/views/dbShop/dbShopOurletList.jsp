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


  </style>

</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" /> 
   	<div class="banner">[썸머 핫딜]-72시간 특가 바로가기</div>
		<div class="mainPhoto">
			<img src="${ctp}/images/ourlet.jpg"/>
		</div>
		 
	

	 <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px; margin-top: 100px;" />
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>