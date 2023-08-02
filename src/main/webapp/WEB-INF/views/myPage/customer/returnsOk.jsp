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
 <style>
  .card {
    background-color: orange;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    transition: 0.3s;
    margin-bottom: 20px;
  }
  .card:hover {
    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
  }
  .form-group {
    margin-bottom: 20px;
  }
  .btn {
    margin-right: 10px;
  }
  
  .file-input {
    position: relative;
    display: inline-block;
  }
  
  .input-file {
    position: absolute;
    left: 0;
    top: 0;
    opacity: 0;
    width: 0.1px;
    height: 0.1px;
    z-index: -1;
  }
  
  .input-file + .btn {
    border: none;
    padding: 8px 20px;
    background-color: orange;
    color: white;
    transition: background-color 0.3s;
  }
  
  .input-file:focus + .btn,
  .input-file + .btn:hover {
    background-color: darkorange;
    cursor: pointer;
  }
  
  .file-label {
    display: inline-block;
    margin-left: 5px;
    font-size: 14px;
    color: #555;
  }
</style>

<script>
  function showFileName() {
    let fileInput = document.getElementById('photo');
    let fileLabel = document.getElementById('file-label');
    
    if (fileInput.files.length > 0) {
      fileLabel.textContent = fileInput.files[0].name;
    } else {
      fileLabel.textContent = '파일 선택됨';
    }
  }
  
  function openFileSelection() {
    let fileInput = document.getElementById('photo');
    fileInput.click();
  }
  function returnsCheck() {
		let category = myform.category.value;
		let message = myform.message.value;
		let photo = myform.photo.value;
		let email = myform.email.value;
		
		let emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
		
		let maxSize = 1024 * 1024 * 2; 	// 업로드할 회원사진의 용량은 2MByte까지로 제한한다.  	
  	let ext = photo.substring(photo.lastIndexOf(".")+1).toUpperCase();	// 파일 확장자 발췌후 대문자로 변환
		if(category == ""){
			alert("분류를 선택해주세요");
			return false;
		}
		else if (message==""){
			alert("상세 정보를 입력하세요");
			return false;
		}
		else if (email==""){
			alert("이메일을 입력하세요");
			return false;
		}
		else if (!emailRegex.test(email)){
			alert("정상적인 이메일이 아닙니다");
			return false;
		}
		else if(photo.trim() == "") {
			myform.fName.value = "noimage.jpg";		
		}
		else {
			let fileSize = document.getElementById("photo").files[0].size;
			
			if(ext != "JPG" && ext != "GIF" && ext != "PNG") {
				alert("업로드 가능한 파일은 'JPG/GIF/PNG'파일 입니다.");
				return false;
			}
			else if(photo.indexOf(" ") != -1) {
				alert("업로드 파일명에 공백을 포함할 수 없습니다.");
				return false;
			}
			else if(fileSize > maxSize) {
				alert("업로드 파일의 크기는 2MByte를 초과할수 없습니다.");
				return false;
			}
  	}
  	myform.submit();
	}
</script>

</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   <jsp:include page="/WEB-INF/views/myPage/memberInquire.jsp" />
   <p><br/></p>
   <div class="container">
     <div class="card">
       <h3>고객 문의 사항</h3>
       <form  method="post" enctype="multipart/form-data" name="myform" action="${ctp}/myPage/adminReturnReport">
         <div class="form-group">
           <label for="category">문의 유형:</label>
           <select class="form-control" id="category" name="category">
             <option value="">문의 선택</option>
             <option value="productCom">제품 관련</option>
             <option value="pointCom">포인트 관련</option>
             <option value="baesongCom">배송 관련</option>
             <option value="returnCom">환불/반품</option>
             <option value="outSideCom">기타 사항</option>
           </select>
         </div>
         <div class="form-group">
           <label for="message">문의 내용:</label>
           <textarea class="form-control" id="message" name="message" rows="4"></textarea>
         </div>
   			 <div class="form-group">
				   <label for="photo">사진 첨부:</label>
				   <div class="file-input">
				     <input type="file" id="photo" name="photo" class="input-file" onchange="showFileName()">
				     <button type="button" class="btn btn-primary" onclick="openFileSelection()">파일 선택</button>
				   </div>
				   <span id="file-label" class="file-label">파일 선택됨</span>
				 </div>

         <div class="form-group">
           <label for="email">이메일:</label>
           <input type="email" class="form-control" id="email" name="email" value="${sEmail}" required>
         </div>
         <button type="button" class="btn btn-warning" onclick="returnsCheck()">확인</button>
         <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/myPage/customer/memberInquire2';">취소</button>
         <input type="hidden" name="fName"/>
         <input type="hidden" name="mid" value="${sMid}"/>
         <input type="hidden" name="productCode" value="${sProductCode}"/>
       </form>
     </div>
   </div>
   <p><br/></p>
   <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px;" />
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
