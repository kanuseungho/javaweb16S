<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />

<!-- Navbar -->
<html>
<head>
  <script src="https://kit.fontawesome.com/f31f2dda49.js" crossorigin="anonymous"></script>
  <style type="text/css">
    #mainHead {
      display: flex;
      align-items: center;
      height: 100px;
      text-align: center;
      background-color: #FFFFFF;
      margin-top: 0;
      width: 88%;
      margin: 0 auto;
      box-sizing: border-box;
    }

    #mainHead a {
      margin-left: 10px;
      font-size: 16px; /* Decreased font size */
      color: inherit;
      text-decoration: none;
    }

    #mainHead .ml-4 {
      margin-right: 5%;
      margin-left: 5%;
    }

    #icon {
      margin-left : 20%; 
      display: flex;
    }
    .headerImg{
    	margin-left: 24%;
    }
		/* 아이콘들끼리의 간격 */
    #icon > div {
      margin-left: 15px;
    }

    /* Updated CSS for the text box */
    #itemSearch {
      border-radius: 20px;
      padding: 8px 16px;
      border: 1px solid #ccc;
      font-size: 16px;
    }

    /* Updated CSS for the navbar menu */
    .w3-bar-item {
      padding: 8px 12px; /* Adjust padding as needed */
    }

    .w3-dropdown-hover .w3-button {
      /* padding-right: 8px; /* Adjust padding as needed */
      padding-left: 8px; /* Adjust padding as needed */ */
    }

    /* Added margin to the navbar menu items */
    .w3-dropdown-content.w3-bar-block a.w3-bar-item {
      /* margin: 8px; */
    }

    @media only screen and (max-width: 600px) {
      #mainHead a {
        margin-left: 10px;
      }

      #icon {
        margin-left: 10px;
      }
    }

    .w3-padding-large {
      font-size: 12px;
    }
		
    .w3-card {
      width: 80%;
      margin: 0 auto;
      box-sizing: border-box;
    }
    .w3-top{
    	width: 100%;
    	background: white;
    }
    .bar {
    	width: 88%;
      margin: 0 auto;
      box-sizing: border-box;
    }
		.cnt-parent {
		  position: relative;
		  display: inline-block;
		}
		
		.cnt {
		  position: absolute;
		  top: -15px;
		  right: 0;
		  width: 30px;
		  height: 30px;
		  border-radius: 50%;
		  background-color: #F3F781;
		  text-align: center;
		  font-weight: bold;
		  font-size: 15px;
		  line-height: 30px;
		  animation: bounce 1s infinite alternate;
		}
		
		@keyframes bounce {
		  0% {
		    transform: translateY(0);
		  }
		  100% {
		    transform: translateY(-10px);
		  }
		}
  </style>

  <script type="text/javascript">
    function handleSubmit(event) {
      event.preventDefault(); // 폼 제출 기본 동작 취소 	
      searchForm.submit();
      document.getElementById("searchForm").reset(); // 폼 리셋
    }
  </script>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>

<body>

<c:forEach var="vo" items="${returnVOS}">
  <c:if test="${vo.returnStus !='미답장' && vo.memberReCheck =='OK' }">
      <c:set var="count" value="${count + 1}" />
  </c:if>
</c:forEach>


  <div class="w3-top">
    <div id="mainHead">
      <div class="ml-4">
        <form id="searchForm" onsubmit="handleSubmit(event)" action="${ctp}/product/productItemSearch" method="post">
          <input type="text" placeholder="검색어를 입력하세요" id="itemSearch" name="itemSearch">
        </form> 
      </div>
      <div class="headerImg">
        <a href="${ctp}/"><img src="${ctp}/images/brend.jpg"/></a>
      </div>
      <div id="icon">
        <div>
          <a href="${ctp}/myPage/customer/memberInquire2"><img src="${ctp}/images/messge.jpg"/></a>
        </div>
        <div>
	      	<div class="cnt-parent">
					  <a href="${ctp}/myPage/paymentResultOk">
					    <img src="${ctp}/images/ple.jpg" alt="Logo" />
					    <c:if test="${!empty count && count != 0 }"><div class="cnt">${count}</div></c:if>
					  </a>
					</div>
        </div>
        <div>
          <a href="${ctp}/myPage/loveInProduct/"><img src="${ctp}/images/hert.jpg"/></a>
        </div>
        <div>
          <a href="${ctp}/myPage/myCart"><img src="${ctp}/images/cart.jpg"/></a>
        </div>
        <c:if test="${!empty sNickName}">
          <div>${sNickName}님</div>
        </c:if>
      </div>
    </div>
		<div class="bar">
	    <div class="w3-bar">
	      <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
	
	      <div class="w3-dropdown-hover w3-hide-small">
	        <button class="w3-padding-large w3-button" title="More">테이블웨어 <i class="fa fa-caret-down"></i></button>     
	        <div class="w3-dropdown-content w3-bar-block w3-card-4">
	          <%-- <a href="${ctp}/admin/gtp" class="w3-bar-item w3-button">챗</a> --%>	          
	          <a href="${ctp}/product/tableWere/dish" class="w3-bar-item w3-button">접시</a>
	          <a href="${ctp}/product/tableWere/dish?part=머그컵" class="w3-bar-item w3-button">머그컵</a>
	          <a href="${ctp}/product/tableWere/dish?part=면기" class="w3-bar-item w3-button">볼&면기</a>
	          <a href="${ctp}/product/tableWere/dish?part=유리잔" class="w3-bar-item w3-button">유리잔&글래스</a>
	          <a href="${ctp}/product/tableWere/dish?part=서빙용주방용품" class="w3-bar-item w3-button">서빙용 주방용품</a>
	          <a href="${ctp}/product/tableWere/dish?part=카라페" class="w3-bar-item w3-button">저그&카라페</a>
	          <a href="${ctp}/product/tableWere/dish?part=커트러리" class="w3-bar-item w3-button">커트러리</a>
	          <a href="${ctp}/product/tableWere/dish?part=와인" class="w3-bar-item w3-button">와인&칵테일</a>        
	        </div>
	      </div>
	
	      <div class="w3-dropdown-hover w3-hide-small">
	        <button class="w3-padding-large w3-button" title="More">인테리어소품 <i class="fa fa-caret-down"></i></button>     
	        <div class="w3-dropdown-content w3-bar-block w3-card-4">
	          <a href="${ctp}/product/tableWere/dish?part=데코레이션" class="w3-bar-item w3-button">데코레이션</a>        
	          <a href="${ctp}/product/tableWere/dish?part=캔들스틱" class="w3-bar-item w3-button">캔들스틱</a>        
	          <a href="${ctp}/product/tableWere/dish?part=욕실용품" class="w3-bar-item w3-button">욕실용품</a>        
	          <a href="${ctp}/product/tableWere/dish?part=수납용품" class="w3-bar-item w3-button">수납용품</a>        
	          <a href="${ctp}/product/tableWere/dish?part=벽지" class="w3-bar-item w3-button">벽지&포스터</a>        
	          <%-- <a href="${ctp}/product/tableWere/dish?part=거울" class="w3-bar-item w3-button">거울</a>    --%>     
	        </div>
	      </div>
	
	      <div class="w3-dropdown-hover w3-hide-small">
	        <button class="w3-padding-large w3-button" title="More">주방 <i class="fa fa-caret-down"></i></button>     
	        <div class="w3-dropdown-content w3-bar-block w3-card-4">
	          <a href="${ctp}/product/tableWere/dish?part=주방용품" class="w3-bar-item w3-button">주방용품</a>
	          <a href="${ctp}/product/tableWere/dish?part=프라이팬" class="w3-bar-item w3-button">냄비&프라이팬</a>
	          <a href="${ctp}/product/tableWere/dish?part=주방수납" class="w3-bar-item w3-button">주방 수납</a>
	          <a href="${ctp}/product/tableWere/dish?part=주방패브릭" class="w3-bar-item w3-button">주방 패브릭</a>
	          <a href="${ctp}/product/tableWere/dish?part=베이킹" class="w3-bar-item w3-button">베이킹</a>
	          <%-- <a href="${ctp}/product/tableWere/dish?part=주방칼" class="w3-bar-item w3-button">주방칼&용품</a>
	          <a href="${ctp}/product/tableWere/dish?part=설거지" class="w3-bar-item w3-button">설거지&청소용품</a> --%>
	        </div>
	      </div>
	
	      <div class="w3-dropdown-hover w3-hide-small">
	        <button class="w3-padding-large w3-button" title="More">조명 <i class="fa fa-caret-down"></i></button>     
	        <div class="w3-dropdown-content w3-bar-block w3-card-4">
	          <a href="${ctp}/product/tableWere/dish?part=램프" class="w3-bar-item w3-button">램프</a>
	          <a href="${ctp}/product/tableWere/dish?part=조명용품" class="w3-bar-item w3-button">조명용품</a>
	          <a href="${ctp}/product/tableWere/dish?part=크리스마스조명" class="w3-bar-item w3-button">크리스마스 조명</a>
	          <a href="${ctp}/product/tableWere/dish?part=야외조명" class="w3-bar-item w3-button">야외 조명</a>        
	        </div>
	      </div>
	
	      <div class="w3-dropdown-hover w3-hide-small">
	        <button class="w3-padding-large w3-button" title="More">러그&패브릭 <i class="fa fa-caret-down"></i></button>     
	        <div class="w3-dropdown-content w3-bar-block w3-card-4">
	          <a href="${ctp}/product/tableWere/dish?part=쿠션류" class="w3-bar-item w3-button">쿠션류</a>
	          <a href="${ctp}/product/tableWere/dish?part=러그" class="w3-bar-item w3-button">러그</a>
	          <a href="${ctp}/product/tableWere/dish?part=담요" class="w3-bar-item w3-button">담요</a>
	          <a href="${ctp}/product/tableWere/dish?part=텍스타일" class="w3-bar-item w3-button">욕실 텍스타일</a>
	          <a href="${ctp}/product/tableWere/dish?part=침구" class="w3-bar-item w3-button">침구</a>
	          <%-- <a href="${ctp}/product/tableWere/dish?part=패브릭류" class="w3-bar-item w3-button">패브릭류</a>
	          <a href="${ctp}/product/tableWere/dish?part=커튼류" class="w3-bar-item w3-button">커튼류</a>
	          <a href="${ctp}/product/tableWere/dish?part크리스마스텍스타일" class="w3-bar-item w3-button">크리스마스 텍스타일</a>
	          <a href="${ctp}/product/tableWere/dish?part=테이블보" class="w3-bar-item w3-button">테이블보</a>
	          <a href="${ctp}/product/tableWere/dish?part=오일클로스" class="w3-bar-item w3-button">오일클로스</a>
	          <a href="${ctp}/product/tableWere/dish?part=테이블러너" class="w3-bar-item w3-button">테이블 러너</a>
	          <a href="${ctp}/product/tableWere/dish?part=면냅킨" class="w3-bar-item w3-button">리넨&면냅킨</a> --%>
	        </div>
	      </div>
	
	      <div class="w3-dropdown-hover w3-hide-small">
	        <button class="w3-padding-large w3-button" title="More">수납&가구 <i class="fa fa-caret-down"></i></button>     
	        <div class="w3-dropdown-content w3-bar-block w3-card-4">
	          <a href="${ctp}/product/tableWere/dish?part=정원용가구" class="w3-bar-item w3-button">야외 가구 및 정원용 가구</a>
	          <a href="${ctp}/product/tableWere/dish?part=선반수납" class="w3-bar-item w3-button">선반&수납</a>
	          <a href="${ctp}/product/tableWere/dish?part=가구용품" class="w3-bar-item w3-button">가구 용품</a>
	          <a href="${ctp}/product/tableWere/dish?part=의자스툴" class="w3-bar-item w3-button">의자&스툴</a>
	          <a href="${ctp}/product/tableWere/dish?part=테이블" class="w3-bar-item w3-button">테이블</a>
	          <%-- <a href="${ctp}/product/tableWere/dish?part=소파암체어" class="w3-bar-item w3-button">소파&암체어</a> --%>        
	        </div>
	      </div>
	      <div class="w3-right">
	        <a href="${ctp}/dbShop/dbShopNewList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">신상품</a>
	        <a href="${ctp}/dbShop/dbShopBrendList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">브랜드</a>
	        <a href="${ctp}/dbShop/dbShopEventList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">기획전</a>
	        <a href="${ctp}/dbShop/dbShopMagaginList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">메거진</a>
	        <a href="${ctp}/dbShop/dbShopOurletList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">아울렛</a>
	        <c:if test="${sLevel == 1 }">
	          <a href="${ctp}/admin/chart/chart" class="w3-bar-item w3-button w3-padding-large w3-hide-small">관리자</a>
	        </c:if> 
	        <c:if test="${empty sLevel}">
	          <a href="${ctp}/member/memberLogin" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Login&Sign up</a>
	        </c:if> 
	        <c:if test="${!empty sLevel}">
	          <a href="${ctp}/member/memberLogout" class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그아웃</a>
	        </c:if> 
	      </div>
	    </div>
    </div>
  </div>

  <!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
  <div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
    <a href="${ctp}/guest/guestList" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">테이블웨어</a>
    <a href="#tour" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">인테리어소품</a>
    <a href="#contact" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">주방</a>
    <a href="${ctp}/study/" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">조명</a>
    <a href="${ctp}/study/password/aria" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">러그&패브릭</a>
    <a href="${ctp}/study/password/bCryptPassword" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">수납&가구</a>
  </div>
</body>
</html>
