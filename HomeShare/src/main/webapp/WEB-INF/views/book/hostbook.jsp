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
	<h1>내 house로 들어온 예약</h1>

	<div id="book-lists">
		<%-- <c:if test="${fn:length(bookList) > 0} "> --%>
		<c:forEach var="vo" items="${bookList }" varStatus="status">
			<hr>
			<div class="book_list_item">
				<div>번호${vo.bookNo }</div>
				<div >예약자 ${vo.bookMemNo}</div>
				<div>하우스 번호 ${vo.bookHouseNo}$</div>
				<div>${vo.checkin}</div>
				<div>${vo.checkout}</div>
				<input type="hidden" id = "bookNo" value=${vo.bookNo }>
				<input type="hidden" id = "houseNo" value=${vo.bookHouseNo }>
				<input type="hidden" id = "hostCheck" value=${vo.hostCheck }>
				<div>${vo.bookMem}명</div>
				<div>${vo.totalPrice}</div>
				<div>지역 : ${houseList[status.index].location}</div>
				<input id="status" type="button"> 
			</div>
			<hr>
		</c:forEach>
		
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

					
					//시작할때 자동 실행
					function initialize(){
						$('.book_list_item').each(function(index,element){
							var hostCheck = $(element).find('#hostCheck').val();
							if(hostCheck=== "0"){
								console.log('hostCheck === "0" ');
								$(element).find('#status').val('예약 대기중') ;
								$(element).append('<input type="button" class="btn_update" value="예약 수락하기">');
							}else{
								$(element).find('#status').val('예약수락됨') 
								$(element).append('<input type="button" class="btn_delete" value="예약 취소">');
							}
						});//end each	
					}
					initialize();
					
					
					
					
					

				//bookForm ajax 작성
				$('.book_list_item').on('click', '.book_list_item .btn_update', function(){
					console.log('btnupdate 클릭');
					var bookNo = $(this).prevAll('#bookNo').val();
					var hostCheck = 1;
					console.log('예약번호 : ' + bookNo + ' 호스트여부 : ' + hostCheck);
					
					//ajax 요청
					$.ajax({
						type : 'put',
						url : '/homeshare/book/' + bookNo,
					 	headers : {
				  	  	    'Content-Type' : 'application/json', 
				  	  	    'X-HTTP-Method-Override' : 'PUT'
				  	  	}, 
				  	  	data : JSON.stringify({
				  	  		'hostCheck' : hostCheck
				  	  	}),
				  	  	success : function(result){
				  	  		if(result=='success'){
				  	  			alert('수정 성공');
				  	  			
				  	  			initialize();
				  	  		} //end if
				  	  	}//end success
					});//end ajax
				});
				
				
				});//end document
	</script>
</body>
</html>