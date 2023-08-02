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
  	.mainPhoto {
    text-align: center;
		}
		
		.mainPhoto img {
		    display: block;
		    margin: 0 auto;
		    width: 90%;
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
  	.middle {
		    text-align: center;
		}
		
		.middle h3 {
		    display: inline-block;
		    width: 50%;
		    box-sizing: border-box;
		    font-size: 40px;
		}
		.middle p {
				margin-top: 50px;
		    display: inline-block;
		    width: 50%;
		    box-sizing: border-box;
		    font-size: 24px;
		}
		.middle-item {
		    display: flex;
		    width: 70%;
		    margin: 0 auto;
		}
		
		.middle-item > div:first-child {
		    width: 50%;
		}
		
		.middle-item > div:last-child {
		    width: 50%;
		    text-align: center;
		}
		
		.middle-item h3 {
		    font-weight: bold;
		    font-size: 24px;
		    margin: 10px 0;
		}
		
		.middle-item p {
		    margin: 5px 0;
		}
		.middle-item-two {
		    display: flex;
		    justify-content: center;
		    margin-top: 70px;
		}
		
		.middle-item-two > div {
		    margin: 0 10px;
		}
	.stlye h3{
    text-align: center;
    font-weight: bold;
    margin-top: 70px;
	}
	.stlye p{
    text-align: center;    
	}
	.hot5{
     display: flex;
    justify-content: center;
    margin-top: 70px;
	}
	
	.stlye-last {
    text-align: center;
    opacity: 0.8;
    font-size: 14px;
  	margin-top: 50px;  
	}	

  </style>
  
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/nav.jsp" />
   	<div class="banner">[썸머 핫딜]-72시간 특가 바로가기</div>
		<div class="mainPhoto">
			<img src="${ctp}/images/maintip.jpg"/>
		</div>
		<div class="middle">
			<h3>로맨틱한 테이블을 꾸미는 3가지 스타일</h3>
			<p>특별한 날, 사랑하는 사람과 로맨틱한 저녁 시간을 보낼 수 있도록 테이블을 세팅하는 방법을 알려드릴게요!</p>
			<p>2022년 1월 28일 금요일 <img src="${ctp}/images/shar.jpg"/></p>
		</div>
		<div class="middle-item">
			<div>
				<h3>스타일 1. 로맨틱 미니멀리즘</h3>
				<p>기념일 혹은 발렌타인 데이에 어울리는 저녁 시간을 준비하시나요? 그렇다면 강력한 그래픽 요소</p>
				<p>가 있는 접시와 그릇으로 낭만적인 테이블을 꾸며 포인트를 주는 것은 어떨까요? 로맨틱 미니멀리</p>
				<p>즘 스타일은 테이블에 많은 요소를 더하지 않습니다. 아름다운 레이스 식탁보를 깔고, 심플한 커트</p>
				<p>러리와 냅킨, 와인잔을 배치하세요. 여기에 강렬하고 독특한 무늬가 돋보이는 그릇으로 변주를 주</p>
				<p>는 것을 잊지 마세요! 아름답고 섬세한 레이스 식탁보와 심플하지만 그래픽 요소로 포인트를 준 플</p>
				<p>레이팅의 조화는 모던함 속에서 섬세함을 만들어 낸답니다.</p>
			</div>
			<div>
				<img src="${ctp}/images/wine.jpg"/>
			</div>
		</div>
		<div class="middle-item-two">
			<div><img src="${ctp}/images/sam1.jpg"/></div>
			<div><img src="${ctp}/images/sam2.jpg"/></div>
		</div>
		<div class="stlye">
			<h3>스타일 2. 러블리 & 엘레강스</h3>
			<p>저녁을 장식하는 테이블 위에 놓인 섬세한 꽃잎들은 더없이 우아하고 낭만적인 테이블 세팅을 완성하</p>
			<p>게 하는 요소가 됩니다. 바이온의 피오나 보울과 같은 클래식한 접시와 블로무스, 펌리빙의 샴페인잔</p>
			<p>으로 꾸민 우아하고 격식있는 테이블 위에 꽃잎을 사르르 흩뿌려 놓아보세요. 작은 디테일의 추가만</p>
			<p>으로도 분위기를 달달하게 만들 수 있을 거예요.</p>
		</div>
		<div class="middle-item-two">
			<div><img src="${ctp}/images/hot4.jpg"/></div>
			<div><img src="${ctp}/images/hot6.jpg"/></div>
		</div>
		<div class="hot5"><img src="${ctp}/images/hot5.jpg"/></div>
		<div class="stlye">
			<h3>스타일 3. 달콤하고 향기로운 시간</h3>
			<p>식사 테이블만 로맨틱하게 세팅하라는 법은 없죠! 티 테이블로도 로맨틱한 테이블 세팅을 실현시킬</p>
			<p>수 있습니다. 그렇다면 배려와 사랑이 담긴 로맨틱한 커피 타임을 위한 테이블도 차려볼까요? 티 테이</p>
			<p>블에 은은한 색조의 꽃송이를 추가함으로써 달콤하고 향긋한 무드를 불러와 보세요! 싱그러운 생화를</p>
			<p>담은 유리 꽃병, 혹은 간단하게 리본으로 묶어 소박하게 장식한 들꽃 꽃다발 같은 자연적인 요소가 낭</p>
			<p>만적인 시간을 완성시킬 거예요.</p>
		</div>
		<div class="middle-item-two">
			<div><img src="${ctp}/images/cool1.jpg"/></div>
			<div><img src="${ctp}/images/cool2.jpg"/></div>
		</div>
		<div class="hot5"><img src="${ctp}/images/cool3.jpg"/></div>
		<div class="stlye-last">
			<p>로맨틱한 저녁 시간을 위한 깜짝 선물 팁도 추가로 알려드릴게요. 샴페인 병에 로맨틱한 문구나 진솔</p>
			<p>한 사랑의 표현을 적은 라벨을 달고, 아름다운 장미 한 송이와 함께 리본으로 묶어 심플하게 포장해보</p>
			<p>세요. 연인을 놀라게 하고 기쁘게 하는 것은 생각보다 작은 이런 디테일이며, 조그맣고 귀여운 디테일</p>
			<p>들이 모여 둘만의 새로운 추억이 될 것입니다 :)</p>
			<br/>
			<p>글 : Arijana Kapic 스타일링 : Madeleine Petersson, Elin Forsander 사진 : Angeliqa Daldorph</p>
		</div>
	 <img src="${ctp}/images/doublebard.jpg" style="width: 100%; height: 70px; margin-top: 100px;" />
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>