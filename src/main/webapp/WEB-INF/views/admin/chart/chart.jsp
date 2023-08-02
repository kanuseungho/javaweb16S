<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html> 
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>barVChart.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
  
  
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        let data = google.visualization.arrayToDataTable([
            ['Year',  '유입 수 '],
            <c:forEach items="${memberList}" var="member">
                ['${member.visitDate}', ${member.visitCount}],
            </c:forEach>
        ]);

        let options = {
            chart: {
                title: '${vo.title}',
                subtitle: '${vo.subTitle}',
            }
        };

        let chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
    }
    
    
    
    
    
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawCorechartChart);

    function drawCorechartChart() {

      var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        <c:forEach items="${productMainVOS}" var="productMain">
        ['${productMain.categorySubCode}', ${productMain.count}],
        </c:forEach>
        
      ]);

      var options = {
        title: '상품 분포'
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart'));

      chart.draw(data, options);
    }
    
    
    
    
  	function messageCheck(idx) {
  		let reMessage =  document.getElementById("reMessage"+idx).value;
			
			if(reMessage == ""){
				alert("답변을 보내주세요!");
				return false;
			}
			$.ajax({
		    type: "post",
		    url: "${ctp}/admin/adminMessageUpdate",
		    data: { reMessage: reMessage, idx: idx },
		    success: function(res) {
		        if (res == "1") {
		            alert("답변 완료");
		        } else {
		            alert("답변 실패");
		        }
		    },
		    error: function() {
		        alert("실패");
		    }
			});
		}
  	function cuponCheck() {
  	  let couponCode = cuponForm.couponCode.value;
  	  let couponName = cuponForm.couponName.value;
  	  let couponAmount = cuponForm.couponAmount.value;
  	  let expirationDate = cuponForm.expirationDate.value;

  	  // 쿠폰 코드 유효성 검사
  	  let couponCodePattern = /^[A-Za-z0-9]+$/;
  	  if (!couponCodePattern.test(couponCode)) {
  	    alert("쿠폰 코드는 영문자와 숫자만 입력 가능합니다.");
  	    return false;
  	  }

  	  // 쿠폰 코드 공백 체크
  	  if (couponCode.trim() === "") {
  	    alert("쿠폰 코드를 입력해주세요.");
  	    return false;
  	  }

  	  // 쿠폰 이름 공백 체크
  	  if (couponName.trim() === "") {
  	    alert("쿠폰 이름을 입력해주세요.");
  	    return false;
  	  }

  	  // 쿠폰 금액 공백 체크
  	  if (couponAmount.trim() === "") {
  	    alert("쿠폰 금액을 입력해주세요.");
  	    return false;
  	  }

  	  // 유효 기간 공백 체크
  	  if (expirationDate.trim() === "") {
  	    alert("쿠폰 유효기간을 입력해주세요.");
  	    return false;
  	  }

  	  // AJAX를 통한 쿠폰 발급 처리
  	  let query = {
  	    couponCode: couponCode,
  	    couponName: couponName,
  	    couponAmount: couponAmount,
  	    expirationDate: expirationDate
  	  };

  	  $.ajax({
  	    type: "POST",
  	    url: "${ctp}/admin/adminCupon",
  	    data: query,
  	    success: function(res) {
  	      if (res === "1") {
  	        alert("쿠폰 발급이 완료되었습니다.");
  	      } else {
  	        alert("쿠폰 발급에 실패했습니다.");
  	      }
  	    },
  	    error: function() {
  	      alert("쿠폰 발급 중 오류가 발생했습니다.");
  	    }
  	  });

  	  return true;
  	}


</script>
	<style type="text/css">
	 body {
      font-family: Arial, sans-serif;
    }
		.containers{
			width: 80%;
      margin: 150px auto 0;
      margin-right: 5%;
		}	
		.totalBox {
      display: flex;
      justify-content: space-between;
      gap: 20px;
    }
    
    .box {
      width: 25%;
      height: 100px;
      display: flex;
      flex-direction: column;
      justify-content: flex-end;      
      padding: 5px;
      color: white;
      border-radius: 4%;
    }
    
    .text {
      height: 20px;      
      font-size: 14px;
      font-weight: bold;
      background-color: #E6E6E6;
    }
    
    .content {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-top: 10px;
    }
    
    .icon {
      margin-right: 10px;
    }
    
    .number {
      color: #FFFFFF;
      font-size: 16px;
      font-weight: bold;
    }
    .icon i{
    	 font-size: 70px; 
    }
    .card-item {
		  background-color: #CEE3F6;
		  border-radius: 8px;
		  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		  padding: 16px;
		  margin: 16px;
		  width: 44%;
		}
		
		.card-item h2 {
		  margin: 0;
		  font-weight: bold;
		}
		#columnchart_material{
			background-color: #CEE3F6;
		  border-radius: 8px;
		  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		  padding: 16px;
		  margin: 16px;
		  width: 50%;
		  height: 500px
		}
		#piechart{
			background-color: #CEE3F6;
		  border-radius: 8px;
		  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		  padding: 16px;
		  margin: 16px;
		  width: 50%;
		  height: 500px
		}
		.chart-item{
			display: flex;
		}
		
		.memoContainer {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
    }

    .memo-input {
      width: 100%;
      height: 100px;
      padding: 10px;
      margin-bottom: 10px;
    }

    .memo-list {
      list-style-type: none;
      padding: 0;
    }

    .memo-item {
      background-color: #f2f2f2;
      padding: 10px;
      margin-bottom: 10px;
    }
    .table-item {
    border-collapse: collapse;
    width: 100%;
		}
		
		.table-item th,
		.table-item td {
		    padding: 10px;
		    text-align: left;
		}
		
		.table-item th {
		    background-color: #f2f2f2;
		}
		
		.table-item tbody tr:nth-child(even) {
		    background-color: #f9f9f9;
		}
		
		.table-item tbody tr:hover {
		    background-color: #e6e6e6;
		}
		
		.table-item img {
		    width: 50px;
		    height: 50px;
		}

		.table-item td {
		    white-space: nowrap;
		}
	.card-main{
		display: flex;
		
	}
	</style>
</head>
<body>
 <jsp:include page="/WEB-INF/views/include/nav.jsp" />
 <jsp:include page="/WEB-INF/views/admin/adminLeft.jsp" />
<div class="containers">			
	<div class="totalBox">
		<div class="box" style="background-color: #2E64FE;" data-toggle="modal" data-target="#myModal1">
	    <div class="content">
	      <div class="icon" ><i class="fa-regular fa-comment-dots "></i></div>
	      <div class="number">
	      	<c:set var="count" value="0" />				
					<c:forEach var="vo" items="${returnsVOS}">
					    <c:if test="${vo.returnStus eq '미답장' && vo.category != 'returnCom'}">
					        <c:set var="count" value="${count + 1}" />
					    </c:if>
					</c:forEach>
					
					
					<c:set var="returncount" value="0" />
					<c:forEach var="vo" items="${returnsVOS}">
					    <c:if test="${vo.returnStus eq '미답장' && vo.category == 'returnCom'}">
					        <c:set var="returncount" value="${returncount + 1}" />
					    </c:if>
					</c:forEach>
					<p>${count}&nbsp;&nbsp;&nbsp;</p>					
	      </div>
	    </div>
	    <div class="text"  style="color: #2E64FE;">new complaint</div>
	  </div>	  
	  
		<div class="box" style="background-color: #31B404;" data-toggle="modal" data-target="#myModalCupon" >
	    <div class="content">
	      <div class="icon"><i class="fa-regular fa-chart-bar"></i></div>
	      <div class="number">Click here</div>
	    </div>
	    <div class="text"  style="color: #31B404;" >cupon</div>
	  </div>
	  
		<div class="box" style="background-color: #FACC2E;" data-toggle="modal" data-target="#returnMyModal">
	    <div class="content">
	      <div class="icon"><i class="fa-solid fa-cart-arrow-down"></i></div>
	      <div class="number">${returncount}</div>
	    </div>
	    <div class="text" style="color:  #FACC2E;">returned product</div>
	  </div>
	  
		<div class="box" style="background-color: #FE2E2E;" data-toggle="modal" data-target="#myModal">
	    <div class="content">
	      <div class="icon"><i class="fa-regular fa-futbol"></i></div>
	      <div class="number">Press f5 to become new</div>
	    </div>
	    <div class="text" style="color: #FE2E2E;">Memo</div>
	  </div>
  </div>
  <div class="card-main">
	  <div class="card-item">
	 	 <h2>Number of member inflows</h2>
		</div>
	  <div class="card-item">
	 	 <h2>Distribution of objects</h2>
		</div>
	</div>
	<div class="chart-item">
  	<div id="columnchart_material" ></div>
  	<div id="piechart" style="width: 900px; height: 500px;"></div>
  </div>
</div>
<!-- 메모장 모달 -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-dialog-centered">
  	<div class="modal-content">
  
    <!-- Modal Header -->
    <div class="modal-header">
      <h4 class="modal-title">Modal Heading</h4>
      <button type="button" class="close" data-dismiss="modal">&times;</button>
    </div>
    
    <!-- Modal body -->
    <div class="modal-body">
     <div class="memoContainer">
		    <h1>Memo Notepad</h1>
		    <textarea id="memo-input" class="memo-input" placeholder="Write your memo..."></textarea>
		    <button id="add-button">Add Memo</button>
		    <ul id="memo-list" class="memo-list"></ul>
		  </div>
    </div>
    
    <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>
<!--  -->
<!-- 고객불만 -->
<div class="modal fade" id="myModal1">
	<div class="modal-dialog modal-dialog-centered modal-xl">
  	<div class="modal-content">
  
    <!-- Modal Header -->
    <div class="modal-header">
      <h4 class="modal-title">complaint</h4>
      <button type="button" class="close" data-dismiss="modal">&times;</button>
    </div>     
    <!-- Modal body -->
   <div class="modal-body">
    <table class="table-item">
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
                <th></th>                
            </tr>
        </thead>
        <tbody>
            <c:forEach var="vo" items="${returnsVOS}">
						  <c:if test="${vo.returnStus == '미답장'&& vo.category != 'returnCom'}">
						    <tr>
				        <form name="myform">
				        	<td>
				          	<img src="${ctp}/member/${vo.FName}" style="width: 50px; height: 50px; " />
						      </td>
						      <td>${vo.idx}</td>
						      <td>${vo.mid}</td>
						      <td>${vo.productCode}</td>
						      <td>${vo.email}</td>
						      <td>
						      	<c:if test="${vo.category == 'productCom'}">제품문의</c:if>
						      	<c:if test="${vo.category == 'pointCom'}">포인트문의</c:if> 
						      	<c:if test="${vo.category == 'baesongCom'}">배송문의</c:if> 						      	
						      	<c:if test="${vo.category == 'outSideCom'}">기타사항</c:if> 
						       </td>
						      <td>${vo.message}</td>
						      <td >
						        <input type="text" name="reMessage" id="reMessage${vo.idx}"  class="form-control" />
						      </td>
						      <td>
						        <input type="button" value="확인" class="btn btn-primary btn-sm" onclick="messageCheck('${vo.idx}')"/>
						      </td>
					      </form>
						    </tr>
						  </c:if>
						</c:forEach>
        </tbody>
    </table>
	 </div> 
    <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>
 <script>
    document.getElementById('add-button').addEventListener('click', function() {
      var memoInput = document.getElementById('memo-input');
      var memoText = memoInput.value;

      if (memoText.trim() !== '') {
        var memoItem = document.createElement('li');
        memoItem.className = 'memo-item';
        memoItem.textContent = memoText;

        var memoList = document.getElementById('memo-list');
        memoList.appendChild(memoItem);

        memoInput.value = '';
      }
    });
  </script>
 <!-- The Modal -->
<div class="modal" id="myModalCupon">
  <div class="modal-dialog  modal-dialog-centered modal-xl">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">쿠폰 발급하기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
     	<div class="modal-body">
			  <form name="cuponForm"  method="post">
			    <div class="form-group">
			      <label for="couponCode">쿠폰 코드:</label>
			      <input type="text" class="form-control" id="couponCode" name="couponCode" placeholder="쿠폰 코드를 입력하세요">
			    </div>
			    <div class="form-group">
			      <label for="couponName">쿠폰 이름:</label>
			      <input type="text" class="form-control" id="couponName" name="couponName" placeholder="쿠폰 이름을 입력하세요">
			    </div>
			    <div class="form-group">
			      <label for="couponAmount">쿠폰 금액:</label>
			      <input type="text" class="form-control" id="couponAmount" id="couponAmount" placeholder="쿠폰 금액을 입력하세요">
			    </div>
			    <div class="form-group">
			      <label for="expirationDate">유효 기간:</label>
			      <input type="date" class="form-control" id="expirationDate" name="expirationDate">
			    </div>
			    <button type="button" onclick="cuponCheck()" class="btn btn-primary">발급</button>
			  </form>
			</div>


      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<div class="modal" id="returnMyModal">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content ">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">반품/환불 문의</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
		    <table class="table-item">
		        <thead>
		            <tr>
		                <th>제품</th>
		                <th>순서</th>
		                <th>아이디</th>
		                <th>제폼코드</th>
		                <th>이메일</th>
		                <th>문의분류</th>
		                <th>내용</th>
		                <th></th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="vo" items="${returnsVOS}">
								   <c:if test="${vo.returnStus == '미답장' && vo.category =='returnCom'}">
								    <tr>
						      
						        	<td>
						          	<img src="${ctp}/member/${vo.FName}" style="width: 50px; height: 50px; " />
								      </td>
								      <td>${vo.idx}</td>
								      <td>${vo.mid}</td>
								      <td>${vo.productCode}</td>
								      <td>${vo.email}</td>
								      <td>
								      	<c:if test="${vo.category == 'returnCom'}">환불/반품</c:if> 
								       </td>
								      <td>${vo.message}</td>
								      <td>
								        <form name="returnFrom" action="${ctp}/admin/returnCheckUpdate" method="post">
								        	<input type="hidden" name="returnCategoryCode" id="returnCategoryCode" value="${vo.productCode}">
								        	<input value="확인" class="btn btn-danger btn-sm" type="submit"/>
								        </form>
								      </td>
							        
								    </tr>
								  </c:if>
								</c:forEach>
		        </tbody>
		    </table>
			 </div> 

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>



</body>
</html>
