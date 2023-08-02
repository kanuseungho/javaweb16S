<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminLeft.jsp</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <style type="text/css">
  body {
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
    font-size: 0.8em;
  }
  #accordion {
    width: 10%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    background-color: #ffffff;
    padding: 20px;
    margin-top: 150px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
  }
  #accordion h3 {
    font-size: 18px;
    font-weight: bold; 
    margin-bottom: 20px;
    color: #333333;
  }
  #accordion hr {
    border-color: #ccc;
    margin-top: 10px;
    margin-bottom: 10px; 
  }
  #accordion p {
    margin: 5px 0;
    margin-bottom: 10px; 
	  padding: 10px;
	  background-color: #ffffff;
	  border-top: 5px solid #cccccc;
	  border-bottom: 5px solid #cccccc;
	  transition: background-color 0.3s ease;
  }
  #accordion a {
    color: #333;
    text-decoration: none;
  }
  #accordion a:hover {
    color: #666;
    text-decoration: underline;
  }
  .card-header {    
    color: #333;
    padding: 5px 10px;
    cursor: pointer;
    
  }
  .card-body {
    padding: 5px 10px;
  }
  .card-body a {
    display: block;
    color: #666;
    text-decoration: none;
    transition: color 0.3s;
  }
  .card-body a:hover {
    color: #333;
  }

  </style>
</head>
<body>
<p><br/></p>
<div class="text-center card-hover" id="accordion">
  <h3>관리자 메뉴</h3>
  <p><a href="${ctp}/" target="_top">홈으로</a></p>  
  <p><a href="${ctp}/admin/chart/chart">매출차트확인</a></p> 
  <p><a href="${ctp}/admin/adminBannerPhoto" >베너사진수정</a></p>
  <p><a href="${ctp}/admin/adminMemberList">회원리스트</a></p>
  <div class="card">
    <div class="card-header  m-0 p-2" style="background-image: url('${ctp}/images/bardleft2.jpg'); background-size: cover; background-position: center;">
      <a class="card-link" data-toggle="collapse" href="#collapseOne">
        배송&가이드
      </a>
    </div>
    <div id="collapseOne" class="collapse">
      <div class="card-body m-2 p-1">
        <a href="${ctp}/admin/adminDilivery" target="adminContent">배송 변경</a>
      </div>
      <div class="card-body m-2 p-1">
        <a href="${ctp}/admin/adminCS" target="adminContent">배송 CS</a>
      </div>
      <div class="card-body m-2 p-1">
        <a href="${ctp}/dbShop/dbMyOrder" target="adminContent">배송 리스트</a>
      </div>
    </div>
  </div>
  <hr/>
  <div class="card">
    <div class="card-header m-0 p-2" style=" background-image: url('${ctp}/images/bard2.jpg'); background-size: cover; background-position: center;">
      <a class="card-link" data-toggle="collapse" href="#collapseTwo">
        상품관리
      </a>
    </div>
    <div id="collapseTwo" class="collapse">
      <div class="card-body m-2 p-1">
        <a href="${ctp}/dbShop/dbCategory" target="adminContent">상품분류등록</a>
      </div>
      <div class="card-body m-2 p-1">
        <a href="${ctp}/dbShop/dbProduct" target="adminContent">상품등록</a>
      </div>
      <div class="card-body m-2 p-1">
        <a href="${ctp}/dbShop/dbShopList" target="adminContent">상품리스트</a>
      </div>
      <div class="card-body m-2 p-1">
        <a href="${ctp}/dbShop/dbOption" target="adminContent">옵션등록관리</a>
      </div>
    </div>
  </div>
  <hr/>
</div>
<p><br/></p>
</body>
</html>
