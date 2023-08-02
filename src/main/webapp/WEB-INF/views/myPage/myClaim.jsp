<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style type="text/css">
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    
    .container {
      margin-top: 150px;
    }
    
    .modal-body {
      padding: 20px;
    }
    
    table {
      width: 100%;
      border-collapse: collapse;
    }
    
    th, td {
      padding: 10px;
      text-align: left;
    }
    
    th {
      background-color: orange;
    }
    
    img.product-image {
      width: 50px;
      height: 50px;
    }
    
    .card {
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
      transition: 0.3s;
      border-radius: 5px;
      margin-bottom: 10px;
    }
    
    .card:hover {
      box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
    }
    
    .card-body {
      padding: 15px;
    }
    
    input.form-control {
      width: 100%;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    
    input.btn {
      padding: 8px 12px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    
    .btn-primary {
      background-color: #007bff;
      color: #fff;
    }
    
    .btn-primary:hover {
      background-color: #0056b3;
    }
    
    .btn-sm {
      font-size: 12px;
    }
    
    footer {
      background-color: #f2f2f2;
      padding: 20px;
      text-align: center;
    }
  </style>
  <script type="text/javascript">
	  function sendCheck(value,idx) {
	      // 여기에서 value 변수를 이용하여 필요한 처리를 수행합니다.               	
	      // 값을 서버로 보내거나 다른 동작을 수행할 수 있습니다.
	      $.ajax({
	      	type : "post",
	        url  : "${ctp}/myPage/claimUpdate",
	        data : {value : value , idx : idx}, 
	        success: function(response) {
	    	    // 서버 응답을 받아와서 화면을 업데이트
	    	    alert("감사합니다");	    	    
	    	  },
	        error:function(){
	      	  alert("전송에러");
	        }
	      });
	   }
  </script>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <jsp:include page="/WEB-INF/views/myPage/memberPage.jsp" />
<div class="container">
 	<div class="card">
		<div class="card-body">
    	<div class="modal-body">
      	<table>
        	<thead>
          	<tr>
            	<th>제품</th>
            	<th>순서</th>
	            <th>아이디</th>
	            <th>제폼코드</th>
	            <th>이메일</th>
	            <th>문의분류</th>
	            <th>내용</th>
	            <th>답변</th>
	            <th>확인</th>
          	</tr>
        	</thead>
        	<tbody>
         	 <c:forEach var="vo" items="${returnVOS}">
         	 <c:if test="${vo.returnStus !='미답장' && vo.memberReCheck =='OK' }">         	 
	           	 <tr>
	             	 <td>               
	                 <img src="${ctp}/member/${vo.FName}" class="product-image" />                
		              </td>
		              <td>${vo.idx}</td>
		              <td>${vo.mid}</td>
		              <td>${vo.productCode}</td>
		              <td>${vo.email}</td>
		              <td>
		              	<c:if test="${vo.category =='productCom'}">제품문제</c:if>
		              	<c:if test="${vo.category =='pointCom'}">포인트문제</c:if>
		              	<c:if test="${vo.category =='baesongCom'}">배송문제</c:if>
		              	<c:if test="${vo.category =='returnCom'}">환불/반품</c:if>
		              	<c:if test="${vo.category =='outSideCom'}">기타문제</c:if>
		              </td>
		              <td>${vo.message}</td>
		              <td>${vo.reMessage}</td>              
		              <td>
		              	<div class="btn-group-vertical">
	                  	<input type="button" value="만족" class="btn btn-warning btn-sm" onclick="sendCheck('만족','${vo.idx}')" />
	                  	<input type="button" value="불만족" class="btn btn-danger btn-sm" onclick="sendCheck('불만족','${vo.idx}')" />
	                	</div>
		              </td>              
		            </tr>
	          </c:if>  
	          </c:forEach>
	        </tbody>
	      </table>
    	</div>
   </div>
  </div>
</div>
  <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
