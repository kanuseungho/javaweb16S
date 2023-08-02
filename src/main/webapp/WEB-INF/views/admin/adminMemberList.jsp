<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Member List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
      /* CSS reset */
      * {
          box-sizing: border-box;
          margin: 0;
          padding: 0;
      }
      
      /* Page styles */
      body {
          font-family: Arial, sans-serif;
          line-height: 1.6;
          background-color: #f9f9f9;
          padding: 20px;
      }
      
      .box {
          max-width: 100%;
          margin: 0 auto;
          background-color: #fff;
          padding: 20px;
          border-radius: 5px; 
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
          margin-left: 10%;
          margin-top: 60px;
      }
      
      .profileBanner {
          /* Add your custom styles for the profile banner here */
      }
       
      .member-box {
          margin-top: 20px;
      }
      
      .member-header {
          display: grid;
          grid-template-columns: repeat(14, 1fr);
          font-weight: bold;
          align-items: center;
          background-color: #f0f0f0;
          padding: 10px;
          white-space: nowrap; /* 글자 줄바꿈 방지 */
          overflow: hidden; /* 넘치는 부분 감춤 */
          text-overflow: ellipsis; 
      }
      
      .search-box {
          margin-bottom: 10px;
      }
      
      .member-row {
          display: grid;
          grid-template-columns: repeat(14, 1fr);
          align-items: center;
          border-bottom: 1px solid #ddd;
          padding: 10px;
          white-space: nowrap; /* 글자 줄바꿈 방지 */
          overflow: hidden; /* 넘치는 부분 감춤 */
          text-overflow: ellipsis; 
      }
      
      .member-row img {
          max-width: 60px;
          max-height: 60px;
          border-radius: 50%;
      }
      
      .member-row:nth-child(even) {
          background-color: #f9f9f9;
      }
      
      /* Responsive styles */
      @media (max-width: 768px) {
          .member-header,
          .member-row {
              grid-template-columns: repeat(8, 1fr);
          }
      }
      
      @media (max-width: 480px) {
          .member-header,
          .member-row {
              grid-template-columns: repeat(4, 1fr);
          }
          
          .member-row img {
              max-width: 80px;
              max-height: 80px;
          }
      }
      
      
    /* 검색어 입력란 및 필터 스타일 */
			.search-container {
			  display: flex;
			  align-items: center;
			  justify-content: space-between;
			  background-color: #f5f5f5;
			  border-radius: 8px;
			  padding: 16px;
			  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
			}
			
			#search-input, #search-filter {
			  flex: 1;
			  margin: 8px;
			  padding: 8px;
			  border: 1px solid #ccc;
			  border-radius: 4px;
			}
			
			.search-date {
			  display: flex;
			  align-items: center;
			  gap: 8px;
			}
			
			#startDate, #endDate {
			  padding: 8px;
			  border: 1px solid #ccc;
			  border-radius: 4px;
			}
			
			#search-btn {
			  margin-left: 8px;
			  padding: 12px;
			  background-color: #4CAF50;
			  color: white;
			  border: none;
			  border-radius: 4px;
			  cursor: pointer;
			  transition: background-color 0.3s ease;
			}
			#searchDatebtn {
			  margin-left: 8px;
			  padding: 12px;
			  background-color: #4CAF50;
			  color: white;
			  border: none;
			  border-radius: 4px;
			  cursor: pointer;
			  transition: background-color 0.3s ease;
			}
			
			#search-btn:hover {
			  background-color: #45a049;
			}
			/* 검색 결과 목록 스타일 */
			#search-results {
			  position: absolute;
			  top: 100%;
			  left: 0;
			  width: 100%;
			  background-color: #f5f5f5;
			  list-style: none;
			  padding: 0;
			  margin: 0;
			  border: 1px solid #ccc;
			  border-top: none;
			  display: none;
			  border-radius: 0 0 4px 4px;
			  overflow-y: auto;
			  max-height: 200px;
			  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			}
			
			#search-results li {
			  padding: 12px;
			  border-bottom: 1px solid #ccc;
			}
			
			#search-results li:last-child {
			  border-bottom: none;
			}

    </style>
    <script type="text/javascript">
    function userDelete() {
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
    	      url: "${ctp}/member/memberDelete",
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
		 


		function memberSearchCheck() {
			let searchInput = membertypingForm.searchInput.value;
			if(searchInput.trim() == ""){
				alert("검색할 내용을 쓰세요");
				return false;
			}
			membertypingForm.submit();
		}
		
		
		
		function memberDateSearchCheck() {
			let startDate = memberDateForm.startDate.value;
			let endDate = memberDateForm.endDate.value;
			if(startDate == ""){
				alert("며칠부터 검색하실건가요?");
				return false;
			}
			else if(endDate == ""){
				alert("며칠부터 검색하실건가요?");
				return false;
			}
				memberDateForm.submit();
				
			}
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/admin/adminLeft.jsp" />
    <div class="box">
        <div class="profileBanner">
        	
	          <div class="search-container">
	          <form name="membertypingForm" method="post" action="${ctp}/admin/adminMemberSearch">
						  <select id="searchFilter" name="searchFilter">
						    <option value="mid">아이디</option>
						    <option value="nickName">닉네임</option>
						    <option value="name">이름</option>
						  </select>
						  <input type="text" id="searchInput" name="searchInput" placeholder="검색어를 입력하세요">
						  <button id="search-btn" type="button" onclick="memberSearchCheck()">검색</button>
						</form>
						<div class="search-date">
							<form name="memberDateForm" method="post" action="${ctp}/admin/adminMemberDateSearch">
							  <input type="date" id="startDate" name="startDate" placeholder="가입 시작일">
							  <input type="date" id="endDate" name="endDate" placeholder="가입 종료일">
							  <button id="searchDatebtn" type="button" onclick="memberDateSearchCheck()">날짜검색</button>
							</form>
						</div>
						</div>
						 
						

					
        </div>
        
        <div class="member-box">
            <div class="member-header text-center">
                <div>number</div>
                <div>profile</div>
                <div>ID</div>
                <div>nickName</div>
                <div>Name</div>
								<div>userDel</div>
                <div>level</div>
                <div>
						    	<input type="checkbox" id="selectAll" onclick="toggleCheckboxes(this)">
						    	전체선택
								</div>
								<div>Edit/Delete</div>
            </div>
            
            <c:forEach var="vo" items="${memberVos}">
                <div class="member-row text-center">
                    <div>${vo.idx}</div>
                    <div><img src="${ctp}/data/member/${vo.photo}" alt="Profile Image"></div>
                    <div>${vo.mid}</div>
                    <div>${vo.nickName}</div>
                    <div>${vo.name}</div>
                    <div>${vo.userDel}</div>
                    <div>${vo.level}</div>
                    <input type="checkbox" name="checkRow" value="${vo.idx}">
                    <div>
                        <input type="button" onclick="location.href='${ctp}/member/adminMemberListUser?idx=${vo.idx}'" value="Edit" class="btn-primary"/>
                        <input type="button" onclick="userDelete()" value="Delete" class="btn-danger" />
                    </div>
                    <div></div>
                </div>
            </c:forEach>
        </div>
    </div>
     <!-- 블록 페이징 처리 -->
  <div class="text-center m-4">
	  <ul class="pagination justify-content-center pagination-sm">
	    <c:if test="${pageVO.pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/adminMemberList?pageSize=${pageVO.pageSize}&pag=1">첫페이지</a></li></c:if>
	    <c:if test="${pageVO.curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/adminMemberList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}">이전블록</a></li></c:if>
	    <c:forEach var="i" begin="${pageVO.curBlock*pageVO.blockSize + 1}" end="${pageVO.curBlock*pageVO.blockSize + pageVO.blockSize}" varStatus="st">
	      <c:if test="${i <= pageVO.totPage && i == pageVO.pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/admin/adminMemberList?pageSize=${pageVO.pageSize}&pag=${i}">${i}</a></li></c:if>
	      <c:if test="${i <= pageVO.totPage && i != pageVO.pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/adminMemberList?pageSize=${pageVO.pageSize}&pag=${i}">${i}</a></li></c:if>
	    </c:forEach>
	    <c:if test="${pageVO.curBlock < pageVO.lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/adminMemberList?pageSize=${pageVO.pageSize}&pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}">다음블록</a></li></c:if>
	    <c:if test="${pageVO.pag < pageVO.totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/adminMemberList?pageSize=${pageVO.pageSize}&pag=${pageVO.totPage}">마지막페이지</a></li></c:if>
	  </ul>
  </div>
</body>
</html>
