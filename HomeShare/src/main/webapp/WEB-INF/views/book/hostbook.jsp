<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
	<%@ include file="../header.jspf"%>
	<h1>예약 리스트</h1>

	<div id="book-lists">
		<%-- <c:if test="${fn:length(bookList) > 0} "> --%>
		<c:forEach var="vo" items="${bookList }" varStatus="status">
			<hr>
			<div class="book_list_item" id="${vo.bookNo }">
				<div>번호${vo.bookNo }</div>
				<div>하우스번호 : ${vo.bookNo}</div>
				<div >${vo.bookMemNo}</div>
				<div>${vo.bookHouseNo}$</div>
				<div>${vo.checkin}</div>
				<div>${vo.checkout}</div>
				<div>${vo.hostCheck}</div>
				<div>${vo.bookMem}</div>
				<div>${vo.totalPrice}</div>
				<div>지역 : ${houseList[status.index].location}</div>

				 <form action="/homeshare/book-insert" method="post" id="bookForm">
					<input type="hidden"  id="bookNo" name="bookNo" value="${vo.bookNo }">
					<input type="hidden"  id="bookMemNo" name="bookMemNo" value="${vo.bookMemNo }">
					<input type="hidden"  id="bookHouseNo" name="bookHouseNo" value="${vo.bookHouseNo }">
					<input type="hidden"  id="checkin" name="checkin" value="${vo.checkin }">
					<input type="hidden"  id="ceckout" name="ceckout" value="${vo.checkout }">
					<input type="text"  id="hostCheck" name="hostCheck" value="${vo.hostCheck }">
					<input type="hidden"  id="bookMem" name="bookMem" value="${vo.bookMem }">
					<input type="hidden"  id="totalPrice" name="totalPrice" value="${vo.totalPrice }">
					
				</form> 
			</div>
			<hr>
		</c:forEach>
		<%-- </c:if> --%>
		예약이 없습니다.
	</div>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var sessionId = '${memberVO.memId}';
					console.log('sessionId : ' + sessionId);
					if (sessionId === null || sessionId === ''
							|| sessionId === undefined) {
						location.href = '/homeshare/';
					}

					
					
					
					$('.book_list_item').each(function(index,element){
					
						console.log('index : ' + index + ' element find : ' + $(element).find( '#hostcheck').val());
						if($(element).children( '#hostcheck').val() === "0"){
							$('#hostCheck').text('예약 대기중') ;
							$('#bookForm').html('<input type="submit" id="bookbtn" value="예약 수락하기">');
						}
					});//end each
					
					
					
					
					

				//bookForm ajax 작성
				 $('#bookbtn').click(function(){

				var obj = {
					'bookNo' :  $('#bookNo').val(),
					'bookMemNo': $('#bookNo').val(),
					'bookHouseNo':$('#bookHouseNo').val(),
					'checkin': $('#checkin').val(),
					'checkout': $('#checkout').val(),
					'hostCheck': 1,
					'bookMem': $('#bookMem').val(),
					'totalPrice': $('#totalPrice').val()
					};//end obj
				$.each(obj, function (index, item){
					console.log('item : ' + index + " value : " + item);
				});
				$.ajax({
					type : 'post',
					 url : '/homeshare/book-insert',
					 headers : {
				  	  	    'Content-Type' : 'application/json', 
				  	  	    'X-HTTP-Method-Override' : 'POST'
				  	  	  }, 
		  	  	    data : JSON.stringify(obj),
					
					success : function(data){
						alert('전송성공');
					}//end success
				});//end ajax
				return false;// 새로고침 없이
				}); //end click; 
					
				});//end document
	</script>
</body>
</html>