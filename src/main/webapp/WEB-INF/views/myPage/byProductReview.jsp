<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style type="text/css">
  	 .memberInfo {
      margin-top: 100px;
      background-color: black;
      padding: 20px;
      border-radius: 5px;
    }
    
    .memberHead {       
      margin-bottom: 20px;
    }
    
    .memberHead h3 {
      color: white;
      font-weight: bold;
      font-size: 15px;
    }
    
    .member-List {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .memberImg img {
      margin-left: 50px;
      width: 150px;
      height: 150px;
      border-radius: 50%;
      object-fit: cover;
    }
    
    .memberNLD {
      margin-left: 20px;
    }
    
    .memberName {
      font-size: 50px;
      font-weight: bold;
      color: #333;
      margin-bottom: 5px;
      color: white;
    }
    
    .memberLevel {
      font-size: 16px;
      font-weight: bold;
      margin-bottom: 5px;
      color: white;
    }
    
    .memberDate {
      font-size: 14px;
      font-weight: bold;
      color: #999;
    }
    
    .memberPoint {
      text-align: center;
      font-size: 18px;
      color: white;
      margin: 20px;
    }
    
    .magin {
      margin-left: 40%;
    }
     .title-banner {
		    display: grid;
		    grid-template-columns: repeat(8, 1fr);
		    font-weight: bold;
		    background-color: #f2f2f2;
		    padding: 5px;
		    border-bottom: 1px solid #ddd;
		  }
		
		  .title-banner > div {
		    padding: 5px;
		    text-align: center;
		  }
		
		  .title-item {
		    display: grid;
		    grid-template-columns: repeat(8, 1fr);
		    padding: 5px;
		  }
		
		  .title-item > div {
		    padding: 5px;
		    text-align: center;
		  }
		    
  </style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <jsp:include page="/WEB-INF/views/myPage/memberPage.jsp" />
 
  
  <c:forEach var="vo" items="${baesongVOS}">
  <c:if test="${vo.orderStatus == '배송완료'}">
      <c:set var="count" value="${count + 1}" />
  </c:if>
	</c:forEach>
	
  <p><br/></p>
  
   <div style="width: 80%; float: right; margin-right: 100px;">
    <div class="memberInfo">                 
      <div class="memberHead">
        <h3>My Page</h3>
      </div>
      <div class="member-List">
        <div class="memberImg">
          <img src="${ctp}/member/${memberVO.photo}" />
        </div>
        <div class="memberNLD">
          <div class="memberName">${memberVO.name}</div>
          <div class="memberLevel">Lv.${memberVO.level} 멤버</div>
          <div class="memberDate">${fn:substring(memberVO.startDate,0,10)}</div>
        </div>
        <div class="magin"><img src="${ctp}/images/point.jpg"/></div>
        <div class="memberPoint"><fmt:formatNumber value="${memberVO.point}" pattern="#,###원" /></div>
        	<a href="${ctp}/myPage/byProductReview"><div><img src="${ctp}/images/hugi.jpg"/></div></a>
        	<a href="${ctp}/myPage/byProductReview"><div class="memberPoint"  >${count}</div></a>
      </div>        
    </div>
    
    <div class="item-content">
      <div class="title-banner">
        <div>제품사진</div>
        <div>제품코드</div>
        <div>받는 분</div>        
        <div>전화번호</div>
        <div>메시지</div>
        <div>결제도구</div>                                 
        <div>총가격</div>
        <div>후기작성</div>
      </div>
      
      <c:forEach var="vo" items="${baesongVOS}">
        <c:if test="${vo.orderStatus == '배송완료'}">
          <div class="title-item">
            <div><img alt="제품 사진" src="${ctp}/product/${vo.baesongImg}" style="width: 100px; height: 100px;" /></div>
            <div>${vo.orderIdx}</div>
            <div>${vo.name}</div>            
            <div>${vo.tel}</div>
            <div>${vo.message}</div>
            <div>${vo.payment}</div>
            <div>${vo.orderTotalPrice}원</div>
            <div>
            	<input type="button" onclick="location.href='${ctp}/myPage/review?idx=${vo.idx}';" value="상품 후기" class="btn btn-outline-primary"/>
            </div>                                       
          </div>
        </c:if>
      </c:forEach>
    </div>
       
	 </div>
  
</body>
</html>