<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../cdn.jspf"%>
</head>
<body>
	<%@ include file="../navheader.jspf"%>
	<h1>승인대기중인 예약</h1>

	<div id="book-lists">
		<%-- <c:if test="${fn:length(bookList) > 0} "> --%>
		<c:forEach var="vo" items="${bookList }" varStatus="status">
			<div class="container-fluid">
				<div class="book_list_item border" id="${vo.bookNo }">
					<div class="row">
						<div class="col-md-4">예약번호번호 : ${vo.bookNo }</div>
						<div class="col-md-4">호스트 아이디 : ${vo.bookHostId}</div>
					</div>
					<div class="row">
						<div class="col-md-2 border">체크인 시간</div>
						<div class="col-md-4 border">${vo.checkin.split(' ')[0]}
							${houseList[status.index].checkinTime}</div>
						<div class="col-md-2 border">체크아웃 시간</div>
						<div class="col-md-4 border">${vo.checkout.split(' ')[0]}
							${houseList[status.index].checkoutTime}</div>
					</div>
					<div class="row border">
						<div class="col-md-6">예약인원 ${vo.bookMem}</div>
						<div class="col-md-3">${vo.totalPrice}</div>
					</div>
					<div class="row col-md-12 border">지역 :
						${houseList[status.index].location}</div>


					<input type="hidden" value="${vo.hostCheck }">
					<div class="row" id="ishostcheck"></div>

				</div>
				<div class="row"></div>
			<div class="row"></div>
			<div class="row"></div>
			</div>
			<hr>
			
			
		</c:forEach>
		<%-- </c:if> --%>
		예약이 없습니다.
	</div>
	<script type="text/javascript">
		var sessionId = '${memberVO.memId}';
		console.log('sessionId : ' + sessionId);
		if (sessionId === null || sessionId === '' || sessionId === undefined) {
			location.href = '/homeshare/';
		}
	</script>
</body>
</html>