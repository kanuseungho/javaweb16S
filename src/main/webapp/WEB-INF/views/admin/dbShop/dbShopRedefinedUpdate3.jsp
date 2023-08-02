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
  <script src="${ctp}/ckeditor/ckeditor.js"></script>
  <style type="text/css">
  	.container {
  		display: flex;
  		justify-content: space-between;
  	}

  	.leftUpdate {
  		width: 50%;
  		margin-left: 10%;
  	}

  	.middleUpdate {
  		width: 70%;
  		padding: 20px;
  	}

  	.imageUpdate img {
  		width: 50%;
  		height: 50%;
  	}

  	.form-group {
  		display: flex;
  		align-items: center;
  	}
 
  	.form-group input[type="text"],
  	.form-group textarea {
  		flex: 1;
  		margin-right: 10px;
  	}

  	.form-group .btn {
  		margin-left: 10px;
  	} 

  	#contentImage img {
  		max-width: 100%;
  		max-height: 1500px;  		
  		
  		margin: 0.5%;
  	}

  	table {
  		width: 100%;
  		border-collapse: collapse;
  	}

  	th, td {
  		padding: 10px;
  		border: 1px solid #ddd;
  	}

  	@media (max-width: 768px) {
  		.container {
  			flex-direction: column;
  			align-items: center;
  		}

  		.leftUpdate, .middleUpdate {
  			width: 90%;
  			margin: 10px;
  		}
  	}
  </style>
  <script>
  	function openFilePicker() {
  		document.getElementById('fileInput').click();
  	}
  	
  	function mainImageCheck() {
  		let imageFile = $("#fileInput").val();
			let maxSize = 1024 * 1024 * 2; // 업로드할 회원사진의 용량은 2MByte까지로 제한한다.
	    let ext = imageFile.substring(imageFile.lastIndexOf(".") + 1).toUpperCase(); // 파일 확장자 발췌후 대문자로 변환
	    if (imageFile.trim() == "") {
	  	      alert("사진을 클릭하여 사진을 추가하세요");
	  	      return false;
	  	    } 
	  	    else {
	  	      let fileInput = document.getElementById("fileInput");
	  	      let file = fileInput.files[0];
	  	      let fileSize = file.size;

	  	      if (ext !== "JPG" && ext !== "GIF" && ext !== "PNG") {
	  	        alert("업로드 가능한 파일은 'JPG/GIF/PNG'파일 입니다.");
	  	        return false;
	  	      } 
	  	      else if (imageFile.indexOf(" ") !== -1) {
	  	        alert("업로드 파일명에 공백을 포함할 수 없습니다.");
	  	        return false;
	  	      } 
	  	      else if (fileSize > maxSize) {
	  	        alert("업로드 파일의 크기는 2MByte를 초과할 수 없습니다.");
	  	        return false;
	  	      }
	  	      else{
	  	    		productMainimageForm.submit();
	  	      }
	  	    }
			}
  	function salePercentCheck() {
			let ans = confirm("수정 시 메인가와 세일가는 자동으로 변경됩니다");
			if(!ans) return false; 
			salePercentForm.submit();
		}
  </script>
</head>
<body>
   <jsp:include page="/WEB-INF/views/admin/adminLeft.jsp" />
   <p><br/></p>
   <div class="container">
	   <div class="leftUpdate">
	     <div class="imageUpdate">
	     	<div>
	     		<form name="productMainimageForm" method="post" action="${ctp}/admin/adminProductMainimageUpdate?idx=${productVO.idx}"  enctype="multipart/form-data">
		     		<img src="${ctp}/product/${productVO.FSName}" onclick="openFilePicker()" />
		     		<input type="button" value="사진 수정" onclick="mainImageCheck()" class="btn btn-danger btn-sm"/>
		     		<input type="file" id="fileInput" name="fileInput" style="display: none;" />
		     	</form>
	     	</div>
	     	<div class="form-group" style="margin-top: 10px;">
	     	
	     		<form name="productNameForm" method="post" action="${ctp}/admin/adminProductNameUpdate?idx=${productVO.idx}">
	     			<input type="text" value="${productVO.productName}" name="productNameUpdate" id="productNameUpdate" class="form-control" />
	     			<input type="submit" value="이름 수정" class="btn btn-danger btn-sm" />
	     		</form>
	     	</div>
	     	<div class="form-group">
	     		<form name="detailForm" method="post" action="${ctp}/admin/adminDetailUpdate?idx=${productVO.idx}">
	     			<textarea rows="10" cols="30" id="productDetailUpdate" name="productDetailUpdate" class="form-control">${productVO.detail}</textarea>	     		
	     			<input type="submit" value="설명 수정" class="btn btn-danger btn-sm" />
	     		</form>
	     	</div>
	     	<div class="form-group">
	     		<form name="salePriceForm" method="post" action="${ctp}/admin/adminSalePriceUpdate?idx=${productVO.idx}">
	     			<input type="text" value="${productVO.salePrice}" id="salePriceUpdate" name="salePriceUpdate" class="form-control" />
	     			<input type="submit" value="세일가 수정" class="btn btn-danger btn-sm" />
	     		</form>
	     	</div>
	     	<div class="form-group">
	     		<form name="mainPriceForm" action="${ctp}/admin/adminMainPriceUpdate?idx=${productVO.idx}" method="post">
     				<input type="text" value="${productVO.mainPrice}" name="mainPriceUpdate" id="mainPriceUpdate"  class="form-control" />
     				<input type="submit" value="메인가 수정" class="btn btn-danger btn-sm" />
	     		</form>
	     	</div>
	     	<div>
	     		<form name="productDelForm" method="post" action="${ctp}/admin/adminProductDelUpdate?idx=${productVO.idx}">
		     			판매 상태 <c:if test="${productVO.productDel == 'NO' }"><font color="green" size="3px">(판매 중)</font></c:if><c:if test="${productVO.productDel == 'YES' }"><font color="red" size="3px">(판매 중지 중)</font></c:if>
		     			<select class="form-control" name="productDelUpdate" id="productDelUpdate">
		     				<option value="NO" >판매하기</option>
		     				<option value="YES">판매 중지</option>
		     			</select>
		     		<input type="submit" value="판매상태 변경" class="btn btn-danger btn-sm"/>
	     		</form>
	     	</div>
	     	<div>
	     		<form name="saleForm" method="post" action="${ctp}/admin/adminSaleUpdate?idx=${productVO.idx}">		     		
		     			세일 상태 <c:if test="${productVO.sale == 'NO' }"><font color="red" size="3px">(세일 중지)</font></c:if><c:if test="${productVO.sale == 'YES' }"><font color="green" size="3px">(세일 중)</font></c:if>
		     			<select class="form-control" name="saleUpdate" id="saleUpdate">
		     				<option value="YES" >세일 하기!</option>
		     				<option value="NO" >세일 중지!</option>
		     			</select>
		     		<input type="submit" value="세일상태 변경" class="btn btn-danger btn-sm"/>
	     		</form>
	     	</div>
	     	<div class="form-group">
	     		<form name="salePercentForm" action="${ctp}/admin/adminSalePercentUpdate?idx=${productVO.idx}" method="post">	     		
	     			<input type="text" value="${productVO.salePercent}" name="salePercentUpdate" id="salePercentUpdate" class="form-control" />%
	     			<input type="button" onclick="salePercentCheck()" value="세일 퍼센트 수정" class="btn btn-danger btn-sm" />
	     			<input type="hidden" value="${productVO.mainPrice}" name="mainPriceSalePercent" id="mainPriceSalePercent"/>	     			
	     		</form>
	     	</div>
	     	

			    
	     </div>
	   </div>
	   
	  <div class="middleUpdate">
	  <h3>옵션 수정</h3>
 			<c:forEach var="vo" items="${optionVOS}">
		  <form name="optionForm" action="${ctp}/admin/adminOptionUpdate?idx=${vo.idx}&productIdx=${productVO.idx}" method="post">
			  <table>
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>옵션 이름</th>
			        <th>옵션 가격</th>
			        <th>수정 확인</th>
			      </tr>
			    </thead>
			    <tbody>			      
		        <tr>			        	
		          <td>${vo.idx}</td>
		          <td><input type="text" value="${vo.optionName}" name="optionNameUpdate" id="optionNameUpdate" class="form-control" /></td>
		          <td><input type="text" value="${vo.optionPrice}" name="optionPriceUpdate" id="optionPriceUpdate" class="form-control" /></td>
		          <td><input type="submit" value="옵션 수정" class="btn btn-danger btn-sm" /></td>
		        </tr>			  
			    </tbody>
			  </table>
		  </form>
		  </c:forEach>
		  <h3>브랜드 및 상세 정보</h3>
		  <form name="brendForm" action="${ctp}/admin/adminBrendUpdate" method="post">
			  <table>
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>브랜드</th>
			        <th>디자이너</th>
			        <th>재료,소재</th>
			        <th>크기</th>
			        <th>수정 확인</th>
			      </tr>
			    </thead>
			    <tbody>
			        <tr>		        	
			          <td>${productVO.idx}<input type="hidden" value="${productVO.idx}" name="productContentIdx" id="productContentIdx"/></td>		          
			          <td><input type="text" value="${productVO.brend}" name="productContentBrend" id="productContentBrend" class="form-control" /></td>
			          <td><input type="text" value="${productVO.disingenuous}" name="productContentDisingenous" id="productContentDisingenous" class="form-control" /></td>
			          <td><input type="text" value="${productVO.recipe}" name="productContentRecipe" id="productContentRecipe" class="form-control" /></td>
			          <td><input type="text" value="${productVO.size}" name="productContentSize" id="productContentSize" class="form-control" /></td>
			          <td><input type="submit" value="옵션 수정" class="btn btn-danger btn-sm" /></td>
			        </tr>
			    </tbody>
			  </table>
		  </form>
			<form name="contentForm" method="post" action="${ctp}/admin/adminContentImageUpdate?idx=${productVO.idx}">	    
    		<textarea rows="5" name="content" id="CKEDITOR" class="form-control" required>${productVO.content}</textarea>
				 	<script>
				    CKEDITOR.replace("content",{
				    	uploadUrl:"${ctp}/dbShop/imageUpload",
				    	filebrowserUploadUrl: "${ctp}/dbShop/imageUpload",
				    	height:460
				    });
				  </script>		    
		    <input type="submit" value="사진 수정" class="btn btn-danger btn-sm" />			    
			</form>	    
		</div>
	</div>
   <p><br/></p>
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
