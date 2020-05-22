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
	<div id="book-lists">
		<c:forEach var="list1" items="${list1}" varStatus="status">
    ${list1.name}
    ${list2[status.index].name}
</c:forEach>
		<c:if test="${!empty booklist.featuresList}">
			<c:forEach var="vo" items="${booklist }" varStatus="status">

				<div class="book_list_item" id="${vo.bookNo }">
					<div>번호${vo.bookNo }</div>
					<div>title : ${vo.bookMemNo}</div>
					<div>${vo.bookHouseNo}$</div>
					<div>${vo.checkin}</div>
					<div>${vo.checkout}</div>
					<div>${vo.hostCheck}</div>
					<div>${vo.bookMem}</div>
					<div>${vo.totalPrice}</div>
				</div>
				<hr>
			</c:forEach>
		</c:if>
	</div>
	<div id="house-lists">
		<c:if test="${!empty houseList.featuresList}">
			<c:forEach var="vo" items="${houseList }">
				<div class="house_list_item" id="${vo.houseNo }">
					<div>번호${vo.houseNo }</div>
					<div>title : ${vo.title}</div>
					<div>location : ${vo.location}</div>
				</div>
				<hr>
			</c:forEach>
		</c:if>
	</div>

</body>
</html>