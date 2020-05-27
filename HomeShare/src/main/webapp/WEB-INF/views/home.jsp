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
			TODO : 1. main에서 ajax로 host정보 받기 2. 만약 호스트 숙소에 예약이 들어오면, 호스트 알람을 띄울것

			3. 리플에 별점 부여하기 4. boot
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">@</span>
				<input type="text" class="form-control" placeholder="Username"
					aria-describedby="basic-addon1">
			</div>
		</div>
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
</body>

</html>