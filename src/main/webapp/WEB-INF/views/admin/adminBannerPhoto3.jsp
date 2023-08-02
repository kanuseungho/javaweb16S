<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
 	<style type="text/css">
 		.container {
 			margin-top: 100px;
 		}
 		.mainName {
 			text-align: center;
 		}
    .image-box {
      display: flex;
      flex-wrap: wrap;
      margin-top: 20px;
    }
    .image-container {
      width: 35%;
      height: 400px;
      border: 1px solid #ccc;
      margin: 10px;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer; 
    }
    .image-container img { 
      max-width: 100%;
      max-height: 100%;
    }
    .upload-box {
      display: none;
      margin-top: 20px;
    } 
    .subBanner {
    	width: 100%;
    	height: 10%;
    	background-color: orange;
    	text-align: center;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    }
    .subContainer {
   	  width: 60%;
      height: 400px;
      border: 1px solid #ccc;
      margin: 10px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      cursor: pointer;
    }
    /* Added styles */
    .subContainer span {
    	margin-bottom: 10px;
    }
    form {
    	margin-bottom: 20px;
    }
    form input[type="text"],
    form select {
    	width: 80%;
    	margin-right: 10px;
    }
    form input[type="submit"] {
    	width: 10%;
    }
 	</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   <jsp:include page="/WEB-INF/views/admin/adminLeft.jsp" />
   <p><br/></p>
   <div class="container">
   	<h2 class="mainName">home</h2>   
   	<h4 class="mainName">켈러셀</h4>
   	<div class="image-box">
      <div class="image-container" onclick="showUploadBox()">
        <img src="/path/to/image1.jpg" alt="캘러셀 1">
      </div>
      <div class="subContainer">
      	<span>사용방법</span>
      	<span>1. 어쩌구 저쩌구</span>    
      </div>
    </div>

    <div id="demo"></div>
    <form name="myform" action="${ctp}/admin/adminMainBannerTop" method="post">
	   	<div class="subBanner">
	   		<input type="text" id="topBanner" name="topBanner" placeholder="상단공지사항을 입력하세요" />
	   		<input type="submit" class="btn btn-info btn-sm" value="확인"/>
	   	</div>
   	</form>
   	
    <form name="subTitleform" action="${ctp}/admin/adminHomeSubTitle" method="post">
	   	<div class="subBanner">
	   		<select name="homeSubTitle" id="homeSubTitle">
	   			<option value="">보조제목 위치 선택</option>
	   			<option value="middleSubTitle1">1번</option>
	   			<option value="middleSubTitle2">2번</option>
	   			<option value="middleSubTitle3">3번</option>
	   			<option value="middleSubTitle4">4번</option>
	   			<option value="middleSubTitle5">5번</option>
	   		</select>
	   		<input type="text" id="homeSubTitleText" name="homeSubTitleText" placeholder="상단공지사항을 입력하세요" />
	   		<input type="button" class="btn btn-info btn-sm" onclick="subTitleCheck()" value="확인"/>
	   	</div>
   	</form>
   </div>

   <script>

     function showUploadBox() {
    	 let str = '';
    	 str += '<form action="${ctp}/admin/uploadImage" method="post" enctype="multipart/form-data" name="imageForm">';
    	 str += '  <input type="file" name="file" id="fName1" multiple />';
    	 str += '  <select name="photoPosition" id="photoPosition">';
  		 str += '  	<option value="">사진 위치 선택</option>';
			 str += '  	<option value="carousel1">켈러셀1</option>';
			 str += '  	<option value="carousel2">켈러셀2</option>';
			 str += '  	<option value="carousel3">켈러셀3</option>';
			 str += '  	<option value="tableWerePart1">접시 파트1</option>';
			 str += '  	<option value="tableWerePart2">접시 파트2</option>';
			 str += '  	<option value="tableWerePart3">접시 파트3</option>';
			 str += '  	<option value="tableWerePart4">접시 파트4</option>';			 
			 str += '  	<option value="MediumSizedPhoto1">중간보조사진1</option>';			 
			 str += '  	<option value="MediumSizedPhoto2">중간보조사진2</option>';			 
			 str += '  </select>';
			 str += '  <select name="photoRoute" id="photoRoute">';
			 str += '  	 <option value="">제품 경로</option>';
			 str += '  	 <c:forEach var="vo" items="${productVOS}">';
			 str += '   	 <option value="${vo.idx}">${vo.productName}</option>';	        		        
			 str += '    </c:forEach>';
			 str += '  </select>';
			 str += '  <input type="button" onclick="fCheck()" value="Upload">';
			 //str += '  <input type="submit" value="Upload">';
			 str += '</form>';
			 $("#demo").html(str);
     }
     function fCheck() {
  	    let imageFile = $("#fName1").val();
  	    let photoPosition = document.getElementById("photoPosition").value;
  	    let photoRoute = document.getElementById("photoRoute").value;
  	    let maxSize = 1024 * 1024 * 2; // 업로드할 회원사진의 용량은 2MByte까지로 제한한다.
  	    let ext = imageFile.substring(imageFile.lastIndexOf(".") + 1).toUpperCase(); // 파일 확장자 발췌후 대문자로 변환

  	    if (imageFile.trim() == "") {
  	      document.getElementById("photo").value = "noimage.jpg";
  	    } 
  	    else {
  	      let fileInput = document.getElementById("fName1");
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
  	      else if(photoPosition=="") {
  	    	  alert("어디에 사진을 넣을까요?");
  	    	  return false;
  	      }
  	      else if(photoRoute=="") {
  	    	  alert("사진 클릭 시 어떤 제품으로 보낼까요?");
  	    	  return false;
  	      }
  	    }
  	    
  	    imageForm.submit();
  	  }
    	function subTitleCheck() {
				let homeSubTitle = subTitleform.homeSubTitle.value;
				let homeSubTitleText = subTitleform.homeSubTitleText.value;
				if(homeSubTitle==""){
					alert("변경 경로를 지정해주세요");
					subTitleform.homeSubTitle.focus();
					return false;
				}
				else if(homeSubTitleText==""){
					alert("변경 내용을 작성해주세요");
					subTitleform.homeSubTitleText.focus();
					return false;
				}
				else{
					subTitleform.submit();
				}
			}
   </script>
</body>
</html>
