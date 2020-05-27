<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<%@ include file="cdn.jspf"%>




</head>
<body>
	<c:if test="${not empty mem_id }">
	${memId }님, 환영합니다. <br>
		<button id="btn_logout" type="button" method="post"></button>
	</c:if>
	<%@ include file="navheader.jspf"%>
	<%@ include file="header.jspf"%>

	<%@ include file="section.jspf"%>
	<div style="border: 5px solid grey;">
		테스트영역
		<hr>
		<div>
			TODO : 1. main에서 ajax로 host정보 받기<br> 2. 만약 호스트 숙소에 예약이 들어오면, 호스트
			알람을 띄울것<br> 3. 리플에 별점 부여하기<br> 4. boot
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">@</span>
				<input type="text" class="form-control" placeholder="Username"
					aria-describedby="basic-addon1">
			</div>
		</div>
		<div id="ishostbook"></div>
		<br>
		<div>
			<a href="/homeshare/jusoPopup">
				<input type="text">
				주소테스트
			</a>
		</div>
		<br>
		<div>
			<a href="/homeshare/house/listall">
				<input type="text">
				모든 데이터 보기
			</a>
		</div>
		<br> <br>
		<div>
			<a href="/homeshare/test/websocket">
				<input type="text">
				웹소켓 테스트
			</a>
		</div>
		<br>
	</div>
	<%@ include file="footer.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			var session = '${memId}';
			console.log('session : ' + session);
			if (session != '') {
				console.log('getAllHostBook 실행');
				getAllHostBook();
			}
			//todo : ajax로 리스트 받기
			//ajax로 받기
			var url = '/homeshare/booking/all/' + '${memberVO.houseNo }';
			console.log('url : ' + url);
			function getAllHostBook() {
				$.getJSON(url, function(jsonData) {
					// console.log(jsonData);
					var count = 0;
					$(jsonData).each(function() {
						//console.log(jsonData);
						count++;
					}//endcallback
					);//end each 
					console.log(count);
					$('#ishostbook').html(count);
				}//end callback
				);//end getJSON
			}
			;

		}); //end document
	</script>
</body>

</html>