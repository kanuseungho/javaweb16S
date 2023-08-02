<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Include necessary Bootstrap scripts and stylesheets here -->
  <!-- Example: -->
  <!-- <link rel="stylesheet" href="${ctp}/css/bootstrap.css"> -->
  <!-- <script src="${ctp}/js/bootstrap.js"></script> -->
 <style type="text/css">
	  .product-list {
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: flex-start;
	    gap: 20px;
	    margin-bottom: 20px;
	  }
	
	  .product-item {
	    width: calc(33.33% - 20px);
	    padding: 10px;
	    background-color: #f1f1f1;
	    border-radius: 5px;
	    text-align: center;
	    position: relative;
	    height: 400px;
	  }
	  
	  .product-image {
	    width: 100%;
	    max-width: 300px;
	    margin: 0 auto;
	    background-color: #ccc;
	    height: calc(85% - 60px);
	  } 
	
	  .product-name {
	    margin-top: 10px;
	    font-weight: bold;
	    font-size: 13px;
	    text-align: left; /* Updated */
	  }
	
	  .product-price {
	    margin-top: 5px;
	    color: #888;
	    font-size: 12px;
	    text-align: left; /* Updated */
	  }
	  
	  .sale-banner {
	    position: absolute;
	    top: 10px;
	    right: 10px;
	    background-color: red;
	    color: white;
	    padding: 5px 10px;
	    font-weight: bold;
	  }
	  
	  .stock-status {
	    position: absolute;
	    top: calc(90% + 10px);
	    left: 50%;
	    transform: translateX(-50%);
	    width: 10px;
	    height: 10px;
	    border-radius: 50%;
      display: inline-block;
		 	white-space: nowrap;
      text-align: left; /* Updated */
	  }
	  
	  .stock-yes {
	    background-color: red;	    
	  }
	  
	  .stock-no {
	    background-color: green;
	  }
	  .product-code{
	 		margin-top: 5px;
	    color: #888;
	    font-size: 12px;
	  	text-align: left;
	  }
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
		.containers{
			margin-top: 0;
      width: 70%;
      margin: 0 auto;
      box-sizing: border-box;
		}
		
</style>

  <script>
  function numberWithCommas(x) {
  	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
  }
  </script>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <div class="bener">
		<a href="#">${noticeVO.topBanner}</a>
	</div>
  <jsp:include page="/WEB-INF/views/include/slide.jsp" />
  <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
  <div class="containers">
    <div class="product-list">
      <c:forEach var="vo" items="${vos}">
        <div class="product-item">
         <a href="${ctp}/product/tableWere/dishContent?idx=${vo.idx}">
         	<c:if test="${vo.sale == 'YES'}">         	        	        
         		<div class="sale-banner">SALE</div>
         	</c:if>          
          <div class="product-image"><img src="${ctp}/dbShop/product/${vo.FSName}" style="height: 100%; width: 100%;"/></div>
          <div class="product-code" style="text-align: left;">${vo.productCode}</div>
          <div class="product-name" style="text-align: left;" >${vo.productName}</div>
          <div class="product-price">
          	<c:if test="${vo.sale=='YES'}">
						  <font color="red">
						    <i class="fa-solid fa-won-sign"></i>
						    <fmt:formatNumber value="${vo.salePrice}" pattern="#,###"/>
						  </font>
						  <span style="text-decoration: line-through;">
						    <i class="fa-solid fa-won-sign"></i>
						    <fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/>
						  </span>
					  </c:if>
					  <c:if test="${vo.sale=='NO'}">					  	
					    <i class="fa-solid fa-won-sign"></i>
					    <fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/>
					  </c:if>
					</div>
          <c:if test="${vo.productDel eq 'NO'}">
            <div style="text-align: left;"><img src="${ctp}/images/box.jpg" /></div>
          </c:if>
          <c:if test="${vo.productDel eq 'YES'}">
            <div style="text-align: left;"><img src="${ctp}/images/unbox.jpg" /></div>
          </c:if>
         </a>
        </div>
      </c:forEach>
    </div>
  </div>
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
