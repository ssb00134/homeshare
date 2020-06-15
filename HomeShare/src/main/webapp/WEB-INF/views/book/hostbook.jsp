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
<style type="text/css">

.ui-datepicker{ font-size: 15px; width: 450px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }

</style>
</head>
<body>
	<%@ include file="../navheader.jspf"%>
	<h1>내가 수락한 예약</h1>
	<div id="hostbook"></div>

	<c:if test="${bookList ne null }">
		<div class="row">
			<table class="table table-bordered table-hover text col-md-8">
				<thead class="text">
					<tr class="text">
						<td>예약번호</td>
						<td>체크인</td>
						<td>체크아웃</td>
						<td>예약인원</td>
						<td>총 가격</td>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${bookList }">
						<tr id="bookItem" class="text">
							<td>${vo.bookNo}</td>
							<td id="checkin">${vo.checkin}</td>
							<td>${vo.checkout}</td>
							<td>${vo.bookMem}</td>
							<td>${vo.totalPrice}</td>

							<td><button type="submit" class="btn btn-default">수락</button></td>
							<td><button type="submit" class="btn btn-default">거절</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="col-md-4 border">
				<div id="dateArea1"></div>
				<div id="dateArea2"></div>
			</div>
		</div>

		<h1>대기중인예약</h1>
		
		<h1>지난 예약내역 보기</h1>


	</c:if>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#myTab a').click(function(e) {
				e.preventDefault();
				console.log('mytab click');
				$('#myTab a[href="#profile"]').tab('show'); // Select tab by name
			});

			/* dateArea에 정보 추가하기*/
			$('#dateArea1').datepicker({
				dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
				changeMonth : true,
				changeYear : true,
				nextText : '다음 달',
				prevText : '이전 달',
			}); //end disableList

			$('#dateArea2').datepicker({
				dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
				changeMonth : true,
				changeYear : true,
				nextText : '다음 달',
				prevText : '이전 달',
			}); //end disableList
			
			var checkin1 =  $('#checkin');
			console.log('checkin : ' + checkin1.html());
			
			$('#bookItem').each(function(index, element){
				var checkin1 =  $('#checkin');
				console.log('index : ' + index + ' element : ' + element);
				console.log('checkin : ' + element);
			});
			
		});//endscript
	</script>
</body>
</html>