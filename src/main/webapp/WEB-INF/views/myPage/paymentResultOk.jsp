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

  <style>
    .container {
      max-width: 800px;
      margin: 0 auto;
    }
    
    .card {
      margin-bottom: 20px;
    }
    
    .card-header {
      background-color: #f8f9fa;
      padding: 10px;
      font-weight: bold;
    }
    
    .card-body {
      padding: 20px;
    }
    
    .step {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .step-icon {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background-color: #007bff;
      color: #fff;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      font-size: 15px;
      margin-right: 10px;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
    }
    
    .step-title {
      font-weight: bold;
    }
    
    .step-description {
      margin-top: 5px;
    }
    
    .accordion {
      width: 100%;
    }
    
    .item {
      border: 1px solid #ddd;
      margin-bottom: 5px;
    }
    
    .item-header {
      background-color: #FFFFFF;
      padding: 10px;
      cursor: pointer;
      display: flex;
      align-items: center;
    }
    
    .step-arrow {
      margin-left: auto;
      display: flex;
      align-items: center;
    }
    
    .item-content {
      max-height: 0;
      overflow: hidden;
      transition: max-height 0.5s ease; /* max-height에 애니메이션 효과 추가 */
    }
    
    /* 내용이 보이지 않을 때, 헤더 스타일을 변경하여 클릭 가능한 것임을 나타냄 */
    .item:not(.active) .item-header {
      background-color: #FFFFFF;
    }
    
    /* 내용이 펼쳐질 때, 헤더 스타일을 변경하여 활성화된 것임을 나타냄 */
    .item.active .item-header {
      background-color: #ddd;
    }
    
    .arrow {
      float: right; /* 화살표를 오른쪽으로 배치 */
      transition: transform 0.3s ease; /* 화살표 회전에 애니메이션 효과 추가 */
    }
    
    .rotate {
      transform: rotate(180deg); /* 아래 화살표를 회전하여 위 화살표로 변환 */
    }
    
    .item-content {
      flex-direction: row;
      justify-content: space-between;
      border: 1px solid #ddd;
      border-radius: 5px;
      margin-bottom: 20px;
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
  </style>
  
  <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
      const items = document.querySelectorAll('.item');
      
      items.forEach(item => {
        const header = item.querySelector('.item-header');
        const content = item.querySelector('.item-content');
        
        header.addEventListener('click', function () {
          item.classList.toggle('active');
          
          if (item.classList.contains('active')) {
            content.style.maxHeight = content.scrollHeight + 'px';
          } else {
            content.style.maxHeight = 0;
          }
        });
      });
    });
    
    function toggleAccordion(item) {
      item.classList.toggle('active');
      const arrow = item.querySelector('.arrow');
      arrow.classList.toggle('rotate');
    }
  </script>
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
  
    <h2 class="text-center" style="margin-top: 30px;"></h2>
    <p><br/></p>
    
    <c:if test="${! empty baesongVOS}">
      <div class="card">
        <div class="card-header">
          주문번호:
        </div>
        
        <div class="accordion">
          <div class="item">
            <div class="item-header" onclick="toggleAccordion(this)">
              <div class="fa-regular fa-circle-check" style="color: #FFFF00;">Payment<br/>Completed</div>
              <div class="step-arrow">
                <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span>
              </div>
            </div>
            
            <div class="item-content">
              <div class="title-banner">
                <div>제품사진</div>
                <div>제품코드</div>
                <div>받는 분</div>
                <div>주소</div>
                <div>전화번호</div>
                <div>메시지</div>
                <div>결제도구</div>                                 
                <div>총가격</div>
              </div>
              
              <c:forEach var="vo" items="${baesongVOS}">
                <c:if test="${vo.orderStatus == '결제완료'}">
                  <div class="title-item">
                    <div><img alt="제품 사진" src="${ctp}/product/${vo.baesongImg}" style="width: 100px; height: 100px;" /></div>
                    <div>${vo.orderIdx}</div>
                    <div>${vo.name}</div>
                    <div>${vo.address}</div>
                    <div>${vo.tel}</div>
                    <div>${vo.message}</div>
                    <div>${vo.payment}</div>
                    <div>${vo.orderTotalPrice}원</div>                                       
                  </div>
                </c:if>
              </c:forEach>
            </div>
          </div>
          
          <div class="item">
            <div class="item-header" onclick="toggleAccordion(this)">
              <div class="fa-solid fa-circle-check fa" style="color: #33FF33">In<br/>Transit</div> 
              <div class="step-arrow">
                <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span>
              </div>
            </div>
            
            <div class="item-content">
              <div class="title-banner">
                <div>제품사진</div>
                <div>제품코드</div>
                <div>받는 분</div>
                <div>주소</div>
                <div>전화번호</div>
                <div>메시지</div>
                <div>결제도구</div>                                 
                <div>총가격</div>
              </div>
              
              <c:forEach var="vo" items="${baesongVOS}">
                <c:if test="${vo.orderStatus == '배송중'}">
                  <div class="title-item">
                    <div><img alt="제품 사진" src="${ctp}/product/${vo.baesongImg}" style="width: 100px; height: 100px;" /></div>
                    <div>${vo.orderIdx}</div>
                    <div>${vo.name}</div>
                    <div>${vo.address}</div>
                    <div>${vo.tel}</div>
                    <div>${vo.message}</div>
                    <div>${vo.payment}</div>
                    <div>${vo.orderTotalPrice}원</div>                                 
                  </div>
                </c:if>
              </c:forEach>
            </div>
          </div>
          
          <div class="item">
            <div class="item-header" onclick="toggleAccordion(this)">
              <div class="fa-solid fa-circle-check">Delivered</div> 
              <div class="step-arrow">
                <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span>
              </div>
            </div>
            
            <div class="item-content">
              <div class="title-banner">
                <div>제품사진</div>
                <div>제품코드</div>
                <div>받는 분</div>
                <div>주소</div>
                <div>전화번호</div>
                <div>메시지</div>
                <div>결제도구</div>                                 
                <div>총가격</div>
              </div>
              
              <c:forEach var="vo" items="${baesongVOS}">
                <c:if test="${vo.orderStatus == '배송완료'}">
                  <div class="title-item">
                    <div><img alt="제품 사진" src="${ctp}/product/${vo.baesongImg}" style="width: 100px; height: 100px;" /></div>
                    <div>${vo.orderIdx}</div>
                    <div>${vo.name}</div>
                    <div>${vo.address}</div>
                    <div>${vo.tel}</div>
                    <div>${vo.message}</div>
                    <div>${vo.payment}</div>
                    <div>${vo.orderTotalPrice}원</div>                                       
                  </div>
                </c:if>
              </c:forEach>
            </div>
          </div>
          <div class="item">
            <div class="item-header" onclick="toggleAccordion(this)">
              <div class="fa-solid fa-circle-check" style="color: red" >purchase<br/> confirmation</div> 
              <div class="step-arrow">
                <span class="arrow"><i class="fa-solid fa-arrow-down fa-xl" style="color: #424242"></i></span>
              </div>
            </div>
            
            <div class="item-content">
              <div class="title-banner">
                <div>제품사진</div>
                <div>제품코드</div>
                <div>받는 분</div>
                <div>주소</div>
                <div>전화번호</div>
                <div>메시지</div>
                <div>결제도구</div>                                 
                <div>총가격</div>
              </div>
              
             <c:forEach var="vo" items="${baesongVOS}">
			        	<c:if test="${vo.orderStatus == '리뷰작성완료'}">
			      		  <div class="title-item">
			              <div><img alt="제품 사진" src="${ctp}/product/${vo.baesongImg}" style="width: 100px; height: 100px;" /></div>
			              <div>${vo.orderIdx}</div>
			              <div>${vo.name}</div>
			              <div>${vo.address}</div>
			              <div>${vo.tel}</div>
			              <div>${vo.message}</div>
			              <div>${vo.payment}</div>
			              <div>${vo.orderTotalPrice}원</div>                                       
			            </div>
			        	</c:if>
			        </c:forEach>
            </div>
          </div>
        </div>
        
        
        <div style="text-align: right; margin-right: 50px;">
          <input type="button" value="홈으로" class="btn btn-primary" onclick="location.href='${ctp}/';">
        </div>
      </div>
    </c:if>
    
    <c:if test="${empty baesongVOS}">
      <div class="container">
        <div class="card" style="background-image: url(${ctp}/images/라이언.jpg);">
          <div class="card-header">
            <h3 class="text-center">주문한 상품이 없습니다.</h3>
          </div>
          <div class="card-body" style="height: 500px;">
            <p class="text-center">주문하신 상품이 없습니다. 쇼핑을 계속하시려면 홈으로 이동해주세요.</p>
            <div class="text-center">
              <input type="button" value="홈으로" class="btn btn-primary" onclick="location.href='${ctp}/';">
            </div>
          </div>
        </div>
      </div>
    </c:if>
  </div>
  
  <p><br/></p>
</body>
</html>
