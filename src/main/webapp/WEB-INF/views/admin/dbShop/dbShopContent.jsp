<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbShopContent.jsp (상품정보 상세보기)</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <style type="text/css">
    /* Add your custom styles here */
    .card {
      border-radius: 20px;
      box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }

    #content img {
      max-width: 24%;
      max-height: 250px;
      height: auto;       
      margin: 0.5%; 
    }

    body {
      font-family: 'Helvetica', Arial, sans-serif;
    }

    .btsn {
      background-color: #333;
      color: #fff;
      border: none;
    }

    .btsn:hover {
      background-color: #555;
    }

    .btsn-success {
      background-color: #333;
      color: #fff;
      border: none;
    }

    .btsn-success:hover {
      background-color: #555;
    }

    .btsn-warning {
      background-color: #333;
      color: #fff;
      border: none;
    }

    .btsn-warning:hover {
      background-color: #555;
    }

    .btsn-primary {
      background-color: #333;
      color: #fff;
      border: none;
    }

    .btsn-primary:hover {
      background-color: #555;
    }

    .btsn-info {
      background-color: #333;
      color: #fff;
      border: none;
    }

    .btsn-info:hover {
      background-color: #555;
    }

    .btsn-danger {
      background-color: #333;
      color: #fff;
      border: none;
    }

    .btsn-danger:hover {
      background-color: #555;
    }
  </style>
  <script>
    'use strict';

    // Function to display commas for thousands separator
    function numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function fCheck() {
      let brend = myform.brend.value;
      let disingenuous = myform.disingenuous.value;
      let recipe = myform.recipe.value;
      let size = myform.size.value;

      if (brend == "") {
        alert("브랜드 입력이 되지 않았습니다");
        myform.brend.focus();
        return false;
      } else if (disingenuous == "") {
        alert("디자이너를 입력하지 않았습니다");
        myform.disingenuous.focus();
        return false;
      } else if (recipe == "") {
        alert("개수를 입력하지 않았습니다");
        myform.recipe.focus();
        return false;
      } else if (size == "") {
        alert("크기를 입력하지 않았습니다");
        myform.size.focus();
        return false;
      } else {
        myform.submit();
      }
    }
  </script>
</head>

<body>
<jsp:include page="/WEB-INF/views/admin/adminLeft.jsp"/>
<p><br/></p>
<div class="container">
  <div class="row">
    <div class="col-lg-5">
      <!-- 상품메인 이미지 -->
      <div class="card mb-3">
        <img src="${ctp}/dbShop/product/${productVO.FSName}" class="card-img-top" alt="Product Image">
        <div class="card-body">
          <!-- 상품 기본정보 -->
          <h3 class="card-title">${productVO.detail}</h3>
          <h3 class="card-subtitle mb-2 text-orange"><fmt:formatNumber value="${productVO.mainPrice}"/>원</h3>
          <h3 class="card-text">${productVO.productName}</h3>
        </div>
      </div>
    </div>
    <div class="col-lg-7">
      <!-- 상품주문을 위한 옵션정보 출력 -->
      <div class="card">
        <div class="card-body">
          <form name="optionForm">  <!-- 옵션의 정보를 보여주기위한 form -->
            <select size="1" class="form-control mb-3" id="selectOption">
              <option value="" disabled selected>상품옵션선택</option>
              <option value="0:기본품목_${productVO.mainPrice}">기본품목</option>
              <c:forEach var="vo" items="${optionVos}">
                <option value="${vo.idx}:${vo.optionName}_${vo.optionPrice}">${vo.optionName}</option>
              </c:forEach>
            </select>
          </form>
          <div class="text-right">
            <input type="button" value="옵션등록" onclick="location.href='${ctp}/dbShop/dbOption2?productName=${productVO.productName}';" class="btsn btsn-success mr-2"/>
            <button type="button" class="btsn btsn-warning" data-toggle="modal" data-target="#myModal">
              상세 정보 등록
            </button>
            <input type="button" value="돌아가기" onclick="location.href='${ctp}/dbShop/dbShopList';" class="btsn btsn-primary mr-2"/>
            <input type="button" value="수정하기" class="btsn btsn-info" onclick="location.href='${ctp}/admin/dbShop/dbShopRedefinedUpdate?idx=${productVO.idx}';"/>             						  
          </div>
        </div>
      </div>
    </div>
  </div>
  <br/><br/>
  <div id="content">    
    ${productVO.content}    
  </div>
</div>
<p><br/></p>
<div class="container">
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered modal-xl">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">상세 정보 입력</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <form name="myform" method="post">
          <div class="modal-body">
            <input type="text" class="form-control  mt-5" id="brend" name="brend" placeholder="브랜드 정보"/>
            <input type="text" class="form-control  mt-5" id="disingenuous" name="disingenuous" placeholder="디자이너 정보"/>
            <input type="number" class="form-control  mt-5" id="recipe" name="recipe" placeholder="개수"/>
            <input type="text" class="form-control  mt-5" id="size" name="size" placeholder="상세정보"/>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" onclick="fCheck()" class="btsn btsn-info">Check</button>
            <button type="button" class="btsn btsn-danger" data-dismiss="modal">Close</button>
          </div>
          <input type="hidden" name="idx" id="idx" value="${productIdx}" />
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
