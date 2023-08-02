<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원 정보 및 주문 상품</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style type="text/css">
    .containesr {
      margin-top: 100px;
      width: 80%;
      margin-right: 4%;
      margin-left: auto;
    }
    
    .cards {
      padding: 20px;
      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
      transition: 0.3s;
      border-radius: 5px;
      background-color: #f2f2f2;
      margin-bottom: 20px;
    }
    
    .cards-header {
      font-weight: bold;
      font-size: 20px;
      margin-bottom: 20px;
      background-color: #e9ecef;
      padding: 10px;
      border-radius: 5px; 
    }
    
    .cards-content {
      margin-bottom: 10px;
    }
    
    .products-list {
      list-style-type: none;
      padding: 0;
    }
    
    .products-item {
      margin-bottom: 10px;
    }
    .profile-photo img {
      width: 200px;
      height: 200px;
      object-fit: cover;
      border-radius: 50%;
      margin-bottom: 10px;
    }
    
    /* 애니메이션 효과 */
    @keyframes fade-in {
      from { opacity: 0; }
      to { opacity: 1; }
    }
    
    .fade-in-animation {
      animation: fade-in 0.5s ease-in;
    }
    
    /* 주문 상품 테이블 스타일 */
    .order-table {
      width: 100%;
      border-collapse: collapse;
    }
    
    .order-table th, .order-table td {
      padding: 8px;
      border-bottom: 1px solid #ddd;
      text-align: left;
    }
    
    .order-table th {
      background-color: #f2f2f2;
    }
    
    /* 장바구니 상품 테이블 스타일 */
    .cart-table {
      width: 100%;
      border-collapse: collapse;
    }
    
    .cart-table th, .cart-table td {
      padding: 8px;
      border-bottom: 1px solid #ddd;
      text-align: left;
    }
    
    .cart-table th {
      background-color: #f2f2f2;
    }
    .imageU img{
     	width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 50%;
      margin-bottom: 10px;
    }
  </style>
  <script type="text/javascript">
  	function levelCheck() {
	    document.getElementById("levelForm").submit();
	  }
  </script>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <jsp:include page="/WEB-INF/views/admin/adminLeft.jsp" />
  <p><br/></p>
  <div class="containesr">
    <div class="cards">
      <div class="cards-header">회원 정보</div>
      <div class="cards-content fade-in-animation">
        <div class="profile-photo">
        	<img src="${ctp}/member/${vo.photo}" alt="프로필 사진">
        </div>
        <table class="order-table">
          <tr>
            <th>이름</th>
            <td>${vo.name}</td>
            <th>아이디</th>
            <td>${vo.mid }</td>
          </tr>
          <tr>
            <th>닉네임</th>
            <td>${vo.nickName}</td>
            <th>성별</th>
            <td>${vo.gender}</td>
          </tr>
          <tr>
            <th>생일</th>
            <td>${vo.birthday }</td>
            <th>전화번호</th>
            <td>${vo.tel }</td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>${vo.email}</td>
            <th>탈퇴 상태</th>
            <td>${vo.userDel}</td>
          </tr>
          <tr>
            <th>포인트</th>
            <td>${vo.point}</td>
            <th>회원 등급</th>
            <td>
	          	<form id="levelForm" action="${ctp}/admin/adminLevelUpdate?idx=${vo.idx}" method="POST">
					  		<select name="levelUp" id="levelUp" onchange="levelCheck()" class="form-control">
				          <option <c:if test="${vo.level== '1'}">selected</c:if> value="1">관리자</option>
				          <option <c:if test="${vo.level== '2'}">selected</c:if> value="2">우수회원</option>
				          <option <c:if test="${vo.level== '3'}">selected</c:if> value="3">상급회원</option>					          
				          <option <c:if test="${vo.level== '4'}">selected</c:if> value="4">일반회원</option>				          					         
					      </select>
					      <input type="hidden" value="${vo.idx}" name="idx" id="idx"/>
				      </form>					  	
            </td>
          </tr>
          <tr>
            <th>방문 횟수</th>
            <td>${vo.visitCnt }</td>
            <th>가입일</th>
            <td>${vo.startDate}</td>
          </tr>
          <tr>
            <th>오늘 방문 일자</th>
            <td>${vo.todayCnt }</td>
            <td></td>
            <td></td>
          </tr>
        </table>
      </div>
    </div>
    
    <div class="cards">
      <div class="cards-header">주문한 상품</div>
      <div class="cards-content fade-in-animation">
        <table class="order-table">
          <tr>
            <th>상품 이미지</th>
            <th>ID</th>
            <th>주문자</th>
            <th>주소</th>
            <th>전화번호</th>
            <th>배송메시지</th>
            <th>결제방법</th>
            <th>카드번호</th>
            <th>상태</th>
            <th>금액</th>
          </tr>
          <c:forEach var="vo" items="${baesongVOS}">
            <tr>
              <td class="imageU"><img src="${ctp}/product/${vo.baesongImg}" alt="상품 이미지"></td>
              <td>${vo.mid}</td>
              <td>${vo.name}</td>
              <td>${vo.address}</td>
              <td>${vo.tel}</td>
              <td>${vo.message}</td>
              <td>${vo.payment}</td>
              <td>${vo.payMethod}</td>
              <td>${vo.orderStatus}</td>
              <td>${vo.orderTotalPrice}</td>
            </tr>
          </c:forEach>
        </table>
      </div>
    </div>
    
    <div class="cards">
      <div class="cards-header">카드에 담아둔 상품</div>
      <div class="cards-content fade-in-animation">
        <table class="cart-table">
          <tr>
            <th>상품 이미지</th>
            <th>주문자</th>
            <th>상품 번호</th>
            <th>상품명</th>
            <th>본 가격</th>
            <th>옵션 번호</th>
            <th>옵션명</th>
            <th>옵션 가격</th>
            <th>옵션 수량</th>
            <th>총 가격</th>
            <th>장바구니 등록일</th>
          </tr>
          <c:forEach var="vo" items="${cartVOS}">
            <tr>
              <td class="imageU"><img src="${ctp}/product/${vo.thumbImg}" alt="상품 이미지"></td>
              <td>${vo.mid}</td>
              <td>${vo.productIdx}</td>
              <td>${vo.productName}</td>
              <td>${vo.mainPrice}</td>
              <td>${vo.optionIdx}</td>
              <td>${vo.optionName}</td>
              <td>${vo.optionPrice}</td>
              <td>${vo.optionNum}</td>
              <td>${vo.totalPrice}</td>
              <td>${vo.cartDate}</td>
            </tr>
          </c:forEach>
        </table>
      </div>
    </div>
  </div>
  <p><br/></p>
</body>
</html>
