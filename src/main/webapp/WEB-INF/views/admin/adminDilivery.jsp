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
  	.containers {  	  		
      max-width: 75%;
      margin: 0 auto;
    }
    
    .card {
      margin-bottom: 20px;
    }
    
    .card-header {
      background-color: #f8f9fa;

      font-weight: bold;
    }
    
    .card-body {

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
	  	 flex-direction: row;
	    	justify-content: space-between;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-bottom: 20px;
    }
    

    .title-banner {
        display: grid;
        grid-template-columns: repeat(11, 1fr);
        font-weight: bold;
        background-color: orange;
        padding: 5px;
        border-bottom: 1px solid #ddd;
    }

    .title-banner > div {
        padding: 5px;
        text-align: center;
        color: white;        
    }

    .title-item {
        display: grid;
        grid-template-columns: repeat(11, 1fr);
        padding: 5px;
    }

    .title-item > div {
        padding: 5px;
        text-align: center;
    }
  </style>
  <script type="text/javascript">
    'use strict';
	  function baesongCheck(idx) {
		  let baesongUp = document.getElementById("baesongUp"+idx).value;
		  //let baesongUp = baesongForm.baesongUp.value;
	
		  $.ajax({
		    type: "post",
		    url: "${ctp}/admin/adminDiliveryUpdate",
		    data: { idx: idx, baesongUp: baesongUp },
		    success(res) {
		      if (res == 1) {
		        alert("업데이트 완료");
		      } else {
		        alert("다시 시도해주세요");
		      }
		    },
		    error(jqXHR, textStatus, errorThrown) {
		      alert("전송 에러");
		    }
		  });
		}

  </script>
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />   
	 <jsp:include page="/WEB-INF/views/admin/adminLeft.jsp" />
   <p><br/></p>
	<div class="containers">
			<div class="card" style="margin-top: 150px;">     
				<div class="item-content">
				  <div class="title-banner">
				  	<div>주문번호</div>	  	
				  	<div>제품사진</div>
				  	<div>제품코드</div>
				  	<div>주문ID</div>				  					  
				  	<div>받는 분</div>
				  	<div>주소</div>
				  	<div>전화번호</div>
				  	<div>메시지</div>
				  	<div>결제도구</div>						    	
				  	<div>총가격</div>
				  	<div>주문상태</div>
				  </div>
				  <c:forEach var="vo" items="${baesongVOS}">
					  <div class="title-item">
					  	<div>${vo.idx}</div>
					  	<div><img alt="제품 사진" src="${ctp}/product/${vo.baesongImg}" style="width: 100px; height: 100px;" /></div>
					  	<div>${vo.orderIdx}</div>
					  	<div>${vo.mid}</div>
					  	<div>${vo.name}</div>
					  	<div>${vo.address}</div>
					  	<div>${vo.tel}</div>
					  	<div>${vo.message}</div>
					  	<div>${vo.payment}</div>
					  	<div>${vo.orderTotalPrice}원</div>						  						    
					  	<div>
					  	 
					  		<form id="baesongForm" name="baesongForm">
						  		<select name="baesongUp" id="baesongUp${vo.idx}" onchange="baesongCheck(${vo.idx})" class="form-control">
					          <option value="결제완료" <c:if test="${vo.orderStatus== '결제완료'}">selected</c:if>>결제완료</option>
					          <option value="배송중" <c:if test="${vo.orderStatus == '배송중'}">selected</c:if>>배송중</option>
					          <option value="배송완료" <c:if test="${vo.orderStatus == '배송완료'}">selected</c:if>>배송완료</option>					          
					          <option value="리뷰작성완료" <c:if test="${vo.orderStatus == '리뷰작성완료'}">selected</c:if>>리뷰작성완료</option>					          
						      </select>						      
					      </form>					  						  	
					  	</div>						    	
					  </div>
					  <hr/>
				  </c:forEach>
				</div>
			</div>							
   </div>
   <p><br/></p>   
</body>
</html>