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
		<c:forEach var="vo" items="${booklist }">
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
			</div>
			<hr>
		</c:forEach>

	</div>

	예약된 하우스 번호
	<div id="house-lists">
		<c:forEach var="vo" items="${houseList }">
			<hr>
			<div class="house_list_item" id="${vo.houseNo }">
				<div>번호${vo.houseNo }</div>
				<div>title : ${vo.title}</div>
				<div>location : ${vo.location}</div>
			</div>
			<hr>
		</c:forEach>
	</div>

</body>
</html>