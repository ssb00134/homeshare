<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jspf"%>
	<h1>memberbooklist</h1>
	예약된 리스트
	<div id="book-lists">
		<c:forEach var="vo" items="${booklist }" varStatus="status">
			<hr>
			<div class="book_list_item" id="${vo.bookNo }">
				<div>번호${vo.bookNo }</div>
				<div>하우스번호 : ${vo.bookMemNo}</div>
				<div>${vo.bookHouseNo}$</div>
				<div>${vo.checkin}</div>
				<div>${vo.checkout}</div>
				<div>${vo.hostCheck}</div>
				<div>${vo.bookMem}</div>
				<div>${vo.totalPrice}</div>
				<div>지역 : ${houseList[status.index].location}</div>
			</div>
			<hr>
		</c:forEach>

	</div>
	<script type="text/javascript">
	var sessionId = '${memberVO.memId}';
	console.log('sessionId : ' +sessionId);
	if(sessionId ===null || sessionId='' || sessionId=undefined){
		location.href='/homeshare/';
	}
	</script>
</body>
</html>