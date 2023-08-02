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
  <title>dbShopList.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script type="text/javascript">
	function productDelete() {
  	  let checkRows = []; // idx 값을 저장할 배열
  	  
  	  // 체크된 체크박스의 값을 배열에 추가
  	  $("input[name='checkRow']:checked").each(function() {
  	    checkRows.push($(this).val());
  	  });

  	  if (checkRows.length === 0) {
  	    alert("삭제할 대상을 선택하세요.");
  	    return false;
  	  }			
  	  if (confirm("삭제 하시겠습니까?")) {
  	    $.ajax({
  	      type: "post", 
  	      url: "${ctp}/product/productDelete",
  	      data: { checkRows: checkRows }, // 배열 형태로 전달
  	      success: function(res) {
  	        if (res === "1") {
  	          alert("삭제되었습니다.");
  	          location.reload();
  	        }
  	      },
  	      error: function() {
  	        alert("전송 오류! 재시도 부탁드립니다.");
  	      }
  	    });
  	  }
  	}

  function toggleCheckboxes(checkbox) {
      var checkboxes = document.querySelectorAll('input[name="checkRow"]');
      checkboxes.forEach(function (cb) {
          cb.checked = checkbox.checked;
      });
  }

	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/adminLeft.jsp" />
<p><br/></p>
<div class="container">
  <span>[<a href="${ctp}/dbShop/dbShopList">전체보기</a>]</span> /
  <c:forEach var="subTitle" items="${subTitleVOS}" varStatus="st">
  	<span>[<a href="${ctp}/dbShop/dbShopList?part=${subTitle.categorySubName}">${subTitle.categorySubName}</a>]</span>
	  <c:if test="${!st.last}"> / </c:if>
  </c:forEach>
  <hr/>
  <div class="row">
    <div class="col">
	    <h4>상품 리스트 : <font color="brown"><b>${part}</b></font></h4>
	    <input type="checkbox" id="selectAll" onclick="toggleCheckboxes(this)">전체선택(삭제)
	    <input type="button" onclick="productDelete()" value="Delete" class="btn-danger" />
    </div>
    <div class="col text-right">
		  <button type="button" class="btn btn-primary" onclick="location.href='${ctp}/dbShop/dbProduct';">상품등록하러가기</button>
    </div>
  </div>
  <hr/>
  <c:set var="cnt" value="0"/>
  <div class="row mt-4">
    <c:forEach var="vo" items="${productVOS}">
      <div class="col-md-4">
        <div style="text-align:center">
          <a href="${ctp}/dbShop/dbShopContent?idx=${vo.idx}">
            <img src="${ctp}/dbShop/product/${vo.FSName}" width="200px" height="180px"/>
            <div><font size="2">${vo.productName}</font><input type="checkbox" name="checkRow" value="${vo.idx}" style="margin-left: 7px;" ></div>
            <div><font size="2" color="orange"><fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/>원</font></div>
            <div><font size="2">${vo.detail}</font></div>
          </a>
        </div>
      </div>
      <c:set var="cnt" value="${cnt+1}"/>
      <c:if test="${cnt%3 == 0}">
        </div>
        <div class="row mt-5">
      </c:if>
    </c:forEach>
    <div class="container">
      <c:if test="${fn:length(productVOS) == 0}"><h3>제품 준비 중입니다.</h3></c:if>
    </div>
  </div>
  <hr/>
  <div class="text-right">
	  <button type="button" class="btn btn-primary" onclick="location.href='${ctp}/dbShop/dbProduct';">상품등록하러가기</button>
  </div>
<p><br/></p>
</body>
</html>