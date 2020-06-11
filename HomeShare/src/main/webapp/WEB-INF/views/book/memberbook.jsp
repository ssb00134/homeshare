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
	<h1>memberbooklist</h1>

	<div id="book-lists">
		<%-- <c:if test="${fn:length(bookList) > 0} "> --%>
			<c:forEach var="vo" items="${bookList }" varStatus="status">
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
		<%-- </c:if> --%>
		예약이 없습니다.
	</div>
	<script type="text/javascript">
	var sessionId = '${memberVO.memId}';
	console.log('sessionId : ' +sessionId);
	if(sessionId ===null || sessionId==='' || sessionId=== undefined){
		location.href='/homeshare/';
	}
	</script>
</body>
</html>