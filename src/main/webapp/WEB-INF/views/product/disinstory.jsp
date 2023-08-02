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
  	.mainPhoto img{
  		width: 100%;
  		margin-top: 30px;
  	}  	  
  	.banner{
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
  	.checkFont h3 {
  		font-family: 'Montserrat', sans-serif;
		  font-size: 17px;
		  font-weight: lighter;
		  width: 65%;
		  margin: 0 auto;
		  padding: 20px;		  
  	}
  	.checkFont p {
  		font-family: 'Montserrat', sans-serif;
		  font-size: 14px;
		  font-weight: lighter;
		  width: 65%;
		  margin: 0 auto;
		  padding: 20px;		  
  	}
  	.button-item {
		  text-align: center;
		  padding: 20px;
		  margin-top: 15px;
		}
		
		.button {
		  display: inline-block;
		  padding: 10px 20px;
		  border: 1px solid #ccc;
		  border-radius: 5px;
		  background-color: white;
		  color: black;
		  text-decoration: none;
		  transition: background-color 0.3s ease;
		 	margin: 10px;
		}
		
		.button:hover {
		  background-color: #f5f5f5;
		}
		.twoPhoto{
			width: 80%;
			margin: 0 auto;
		}
		.bottom-item{
			width: 100%;
			background-color: #f5f5f5; 
			align-items: center;
			text-align: center;
		}
		.bottom-photo-item img{
			margin: 10px;
		}
		.threePhoto{
			width: 80%;
			margin: 0 auto;
		}
  </style>
  <script type="text/javascript">
	  function intCheck() {
		  	 let posiction = myform.posiction.value;
		  	 let fSNAme = myform.fSNAme.value;
		  	 let maxSize = 1024 * 1024 * 2; 	// 업로드할 회원사진의 용량은 2MByte까지로 제한한다.
				 let ext = fSNAme.substring(fSNAme.lastIndexOf(".")+1).toUpperCase();	
		  	 if(posiction==""){
		  		 alert("위치를 선택하세요");
		  		 return false;  		 
		  	 }
		  	 else if(fSNAme.trim() == "") {
		  		 alert("사진을 넣어주세요");
		  		 return false;
					} 
				  else {
				  let fileInput = document.getElementById("fSNAme");
				  let file = fileInput.files[0];
				  let fileSize = file.size;
				
				  if(ext != "JPG" && ext != "GIF" && ext != "PNG") {
				    alert("업로드 가능한 파일은 'JPG/GIF/PNG'파일 입니다.");
				    return false;
				  } 
				  else if(fSNAme.indexOf(" ") != -1) {
				    alert("업로드 파일명에 공백을 포함할 수 없습니다.");
				    return false;
				  }
				  else if(fileSize > maxSize) {
				    alert("업로드 파일의 크기는 2MByte를 초과할 수 없습니다.");
				    return false;
				  }
				  else{
					  myform.submit();
				  }
				}
		  	 
				}
  </script>
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   	<div class="banner">[썸머 핫딜]-72시간 특가 바로가기</div>
		<div class="mainPhoto">
			<img src="${ctp}/images/disin.jpg"/>
		</div>
		
		<div class="button-item">
			<button class="button" onclick="location.href='${ctp}/product/disinstory';">디자인 스토리</button>
			<button class="button" onclick="location.href='${ctp}/product/intairastory';">인테리어 팁</button>
			<button class="button" onclick="location.href='${ctp}/product/shoppingstory';">쇼핑 스토리</button>
		</div>		
		<div class="bottom-item">
			<h4>인기 콘텐츠</h4>
			<div class="bottom-photo-item">
			
			
				<c:if test="${sLevel == 1 }">
					<form name="myform" enctype="multipart/form-data" method="post" action="${ctp}/product/intairastory">
						<select name="posiction" id="posiction" >
							<option value="">위치선택</option>
							<option value="1">디자인스토리</option>
							<option value="2">인테리어팁</option>
							<option value="3">쇼핑스토리</option>
							<option value="4">기타 스타일</option>
						</select>
						<input type="file" name="fSNAme" id="fSNAme"/>
						<input type="button" onclick="intCheck()" class="btn btn-primary btn-sm"  value="전송"/>						
					</form>
				</c:if>								
				<c:forEach var="vo" items="${intaVOS}">
					<c:if test="${vo.posication == 1 }">				
						<a href="${ctp}/product/disinstory"><img src="${ctp}/data/magagin/${vo.photo}"></a>
					</c:if>
					<c:if test="${vo.posication == 2 }">				
						<a href="${ctp}/product/inspirationTips"><img src="${ctp}/data/magagin/${vo.photo}"></a>
					</c:if>
					<c:if test="${vo.posication == 3 }">				
						<a href="${ctp}/product/shoppingstory"><img src="${ctp}/data/magagin/${vo.photo}"></a>
					</c:if>
					<c:if test="${vo.posication == 4 }">				
						<a href="${ctp}/product/outTip"><img src="${ctp}/data/magagin/${vo.photo}"></a>
					</c:if>
				</c:forEach>				
			</div>
			<div class="bottom-photo-item">
				<h4>개별 콘텐츠</h4>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q1.jpg"></a>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q2.jpg"></a>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q14.jpg"></a>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q4.jpg"></a>
			</div>
			<div class="bottom-photo-item">
				<h4>브랜드 콘텐츠</h4>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q5.jpg"></a>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q6.jpg"></a>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q7.jpg"></a>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q8.jpg"></a>
			</div>
			<div class="bottom-photo-item">
				<h4>기타 콘텐츠</h4>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q9.jpg"></a>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q10.jpg"></a>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q11.jpg"></a>
				<a href="${ctp}/product/disinstory"><img src="${ctp}/images/q12.jpg"></a>
			</div>
		</div>
		<div class="threePhoto">
			<img src="${ctp}/images/magagin.jpg"/>
		</div>
	 <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px; margin-top: 100px;" />
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>