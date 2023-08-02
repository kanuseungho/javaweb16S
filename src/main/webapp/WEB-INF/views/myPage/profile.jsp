<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style type="text/css">
    .container {
      margin-top: 150px;
    }
    .card {
      margin-bottom: 20px;
    }
  </style>
  <script type="text/javascript">

  function memberUpdate(idx) {
    let regName = /^[가-힣]+$/;
    let regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    let regTel = /^\d{3}-\d{3,4}-\d{4}$/;
    let name = document.getElementById("name").value;
    let email = document.getElementById("email").value.trim();
    let tel = document.getElementById("tel").value.trim();
    let birthday = document.getElementById("birthday").value;
    let maxSize = 1024 * 1024 * 2;  // 업로드할 회원사진의 용량은 2MByte까지로 제한한다.
    let fileInput = document.getElementById("fName");
    let file = fileInput.files[0];
    
    // 앞의 정규식으로 정의된 부분에 대한 유효성체크
    if (!regName.test(name)) {
      alert("이름은 한글만 가능합니다");
      document.getElementById("name").focus();
      return false;
    } else if (!regEmail.test(email)) {
      alert("이메일 형식에 맞게 입력해주세요");
      document.getElementById("email").focus();
      return false;
    } else if (!regTel.test(tel)) {
      alert("전화번호 형식에 맞게 해주세요 000-0000-0000");
      document.getElementById("tel").focus();
      return false;
    }
    
    if (file) {
      let fileSize = file.size;
      let ext = file.name.split('.').pop().toUpperCase();

      if (ext !== "JPG" && ext !== "GIF" && ext !== "PNG") {
        alert("업로드 가능한 파일은 'JPG/GIF/PNG' 파일입니다.");
        fileInput.value = "";  // 파일 선택 초기화
        return false;
      } else if (fileSize > maxSize) {
        alert("업로드 파일의 크기는 2MB를 초과할 수 없습니다.");
        fileInput.value = "";  // 파일 선택 초기화
        return false;
      }
    }
    
    document.getElementById("birthday").value = birthday.replace(" ", ""); // 공백 제거

    document.getElementById("myform").submit();
  }
  </script>
</head>
<body>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <jsp:include page="/WEB-INF/views/myPage/memberPage.jsp" />
  <div class="container">
    <form id="myform" name="myform" method="POST" enctype="multipart/form-data" action="${ctp}/myPage/profile?idx=${vo.idx}">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">프로필</h5>
          <img src="${ctp}/member/${vo.photo}" width="150px"/>
          <input type="file" name="fName" id="fName" class="form-control"  />
        </div>
        <div class="card-body">
          <h5 class="card-title">아이디</h5>
          <input class="form-control" value="${vo.mid}" required readonly="readonly">
        </div>
        <div class="card-body">
          <h5 class="card-title">이름</h5>
          <input type="text" class="form-control" id="name" name="name" value="${vo.name}">
        </div>
        <div class="card-body">
          <h5 class="card-title">닉네임</h5>
          <input type="text" class="form-control" id="nickName" name="nickName" readonly="readonly" value="${vo.nickName}">
        </div>  
        <div class="card-body">
          <h5 class="card-title">전화번호</h5>
          <input type="text" class="form-control" id="tel" name="tel" value="${vo.tel}">
        </div>   
        <div class="card-body">
          <h5 class="card-title">포인트</h5>
          <input class="form-control" value="${vo.point}" readonly="readonly">
        </div>
        <div class="card-body">
          <h5 class="card-title">레벨</h5>
          <input class="form-control" value="${vo.level}" readonly="readonly">
        </div>  
        <div class="card-body">
          <h5 class="card-title">이메일</h5>
          <input type="email" class="form-control" id="email" name="email" value="${vo.email}">
        </div>
        <div class="card-body">
          <h5 class="card-title">총방문횟수</h5>
          <input class="form-control" value="${sVisiCnt}" readonly="readonly">
        </div>
        <div class="card-body">
          <h5 class="card-title">생일</h5>
          <input type="date" class="form-control" id="birthday" name="birthday" value="${fn:substring(sBirthday,0,10)}">
        </div>
        <div class="card-body">
          <h5 class="card-title">성별</h5>
          <label>
            <input type="radio" name="gender" value="남자" ${vo.gender == '남자' ? 'checked' : ''}>
            남자
          </label>
          <label>
            <input type="radio" name="gender" value="여자" ${vo.gender == '여자' ? 'checked' : ''}>
            여자
          </label>
        </div>
        <div class="card-body">
          <h5 class="card-title">가입일</h5>
          <input class="form-control"  value="${sStartDate}" readonly="readonly">
        </div>
      </div>
      <button type="button" onclick="memberUpdate(${vo.idx})" class="btn btn-primary">수정하기</button>
      <button type="button" class="btn btn-primary" onclick="location.href='${ctp}/';">돌아가기</button>
  </form>
</div>
</body>
</html>
