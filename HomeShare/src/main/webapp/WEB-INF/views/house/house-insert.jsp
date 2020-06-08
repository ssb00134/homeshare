<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 </style>
<%@ include file="../cdn.jspf"%>
</head>
<body>
	<%@ include file="../navheader.jspf"%>
	<form action="/homeshare/house/house-insert-post"
		enctype="multipart/form-data" method="post">


		

		<h1>하우스 등록하기</h1>
		<hr>
		<p>1단계 기본 사항 입력</p>
		<input type="hidden" name="houseNo" value="0">
		<input type="hidden" name="replies" value="0">
		<input type="hidden" name="score" value="0">
		<input type="hidden" name="memNo" value="${memberVO.memNo }">
		<input type="hidden" name="reportCount" value="0">
		<input type="hidden" name="houseId" value="${memberVO.memId }">
		<h4>등록하시려는 숙소의 범위를 입력해 주세요</h4>
		<select name="scope" required="required" class="form-control col-md-4">
			<option value="">집전체</option>
			<option value="개인실">개인실</option>
			<option value="다인실">다인실</option>
		</select>
		</div>
		<p>등록하려는 숙소의 유형을 입력해 주세요</p>
		<select name="type" required="required">
			<option value="">유형선택</option>
			<option value="아파트">아파트</option>
			<option value="주택">주택</option>
			<option value="별채">별채</option>
			<option value="독특한숙소">독특한숙소</option>
		</select> <br> <br>
		<p>최대 숙박 가능인원</p>
		<br>
		<input type="text" name="maxCapacity" required="required">
		<br>
		<p>사용할 수 있는 침실은 몇개인가요?</p>
		<br>
		<input type="text" name="bedroom" required="required">
		<br>
		<p>사용할 수 있는 침대는 몇개인가요?</p>
		<br>
		<input type="text" name="bed" required="required">
		<br>
		<p>사용할 수 있는 욕실은 몇개인가요?</p>
		<br>
		<input type="text" name="bathroom" required="required">
		<br>
		<hr>
		<p>숙소의 위치를 알려주세요</p>
		<a href="/homeshare/jusoPopup"
			onclick="window.open(this.href, '_blanck', 'width=600, height=400'); return false">주소입력</a>
		<input type="text" name="location" required="required">
		<hr>
		<p>어떤 편의시설을 제공하나요?</p>
		<input type="checkbox" name="utilities" value="필수품목"
			required="required">
		필수품목<br>수건, 침대 시트, 비누, 화장지, 베개<br>
		<input type="checkbox" name="utilities" value="internet">
		무선인터넷<br>
		<input type="checkbox" name="utilities" value="tv">
		tv<br>
		<input type="checkbox" name="utilities" value="internet">
		무선인터넷<br>
		<input type="checkbox" name="utilities" value="heating">
		난방<br>
		<input type="checkbox" name="utilities" value="airconditioning">
		에어콘<br>
		<input type="checkbox" name="utilities" value="shampoo">
		샴푸<br>
		<input type="checkbox" name="utilities" value="Hair dryer">
		헤어 드라이어<br>
		<hr>
		<br>
		<p>게스트가 어떤 시설을 이용할 수 있나요?</p>
		<input type="checkbox" name="spaces" value="주방">
		주방<br>
		<input type="checkbox" name="spaces" value="세탁기">
		세탁기<br>
		<input type="checkbox" name="spaces" value="건조기">
		건조기<br>
		<input type="checkbox" name="spaces" value="주차">
		주차<br>
		<input type="checkbox" name="spaces" value="헬스장">
		헬스장<br>
		<hr>
		<h1>2단계 상세 정보 입력하기</h1>




		<h1>최대 10개의 파일을 올려주세요</h1>
		<input type="file" name="files" multiple>


		<br>

		<p>숙소의 제목을 입력해 주세요</p>
		<input type="text" name="title" required="required">
		<p>게스트에게 숙소에 대해 설명해 주세요</p>
		<input type="text" name="info" required="required">
		<br> <br> <br> <br>
		<hr>
		<h1>3단계 게스트를 맞이할 준비를 해주세요</h1>
		<p>게스트가 지켜야 할 규칙들</p>
		어린이(2~12세) 숙박에 적합함
		<input type="checkbox" name="rules" value="어린이(2~12세) 숙박에 적합함">
		<br> 반려동물 동반에 적합함
		<input type="checkbox" name="rules" value="반려동물 동반에 적합함">
		<br>흡연 가능
		<input type="checkbox" name="rules" value="흡연 가능">
		<br>행사나 파티 허용
		<input type="checkbox" name="rules" value="행사나 파티 허용">
		<hr>
		<p>체크인까지 최소한 어느정도 시간이 필요하세요?</p>
		<br>
		<input type="text" name="checkinInterval" required="required">
		<hr>
		체크인 가능 시간을 선택해 주세요
		<input type="text" name="checkinTime" required="required">
		<input type="text" name="checkoutTime" required="required">
		<hr>
		<p>게스트가 얼마나 숙박할 수 있나요?</p>
		<input type="text" name="stayNight" required="required">
		박<br>
		<input type="text" name="stayDay" required="required">
		일<br>
		<hr>
		<p>예약 가능한 시간 정하기</p>
		최소
		<input type="date" name="bookableDateBegin" min="sysdate"
			required="required">
		<br> 최대
		<input type="date" name="bookableDateEnd" min="sysdate"
			required="required">
		<br>
		<hr>
		<p>숙소요금 설정하기</p>
		<input type="text" name="price" required="required">
		<br>
		<input type="submit" value="등록하기">
		<br>
		<div id="sidebox"> 플로팅 박스 </div>


	</form>
	<%@ include file="../footer.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$(window).scroll(function() {
				console.log('스크롤 이동');
				

			}); //end window scroll
		});//end document
	</script>
</body>
</html>