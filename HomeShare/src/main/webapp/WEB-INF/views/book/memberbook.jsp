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






<link href="/homeshare/resources/css/bootstrap.css" rel="stylesheet">
<script src="/homeshare/resources/js/bootstrap.min.js"
	type="text/javascript"></script>
	
</head>
<body>
	<%@ include file="../navheader.jspf"%>
	<h1>승인대기중인 예약</h1>

	
	
	<c:if test="${bookListPaging ne null }">
				<div class="row">
					<table class="table table-bordered table-hover text">
						<thead class="text">
							<tr class="text">
								<td>예약번호</td>
								<td>체크인</td>
								<td>체크아웃</td>
								<td>예약인원</td>
								<td>총 가격</td>
								<td>수락여부</td>
		
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${bookListPaging }">
								<tr class="bookItem text">
									<td>${vo.bookNo}</td>
									<td class="checkin">${vo.checkin.split(" ")[0]}</td>
									<td class="checkout">${vo.checkout.split(" ")[0]}</td>
									<td>${vo.bookMem}</td>
									<td>${vo.totalPrice}</td>
									<td class="cancleAble">
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
				</div>
		
		
			</c:if>
			
			
			
	<div>
		<ul class="pager">
			<c:if test="${pageMaker.hasPrev }">
				<li><a href="${pageMaker.startPageNo - 1}">이전</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPageNo }"
				end="${pageMaker.endPageNo }" var="num">
				<li><a href="${num }">${num }</a></li>
			</c:forEach>
			<c:if test="${pageMaker.hasNext }">
				<li><a href="${pageMaker.endPageNo + 1}">다음</a></li>
			</c:if>
		</ul>
	</div>

	<div>
		<form id="pagingForm" style="display: none;">
			<input type="text" name="page" value="${pageMaker.criteria.page }">
			<input type="text" name="houseNo">
		</form>
	</div>
	
	
	
	
	
	
	<script type="text/javascript">
	$(document).ready(function() {
	
		//페이징 처리
			// 클릭한 a태그의 정보를 가져오는 코드
			$('.pager li a').click(function() {
				// .pager 클래스의 하위 li 요소의 하위 a 요소를 찾아감
				event.preventDefault(); // a 태그의 기본 동작(페이지 이동)을 금지
				var targetPage = $(this).attr('href'); // a 태그 href 속성의 값을 저장
				console.log(targetPage);

				var frm = $('#pagingForm'); // form의 정보를 frm에 저장
				frm.find('[name="page"]').val(targetPage); // name="page"를 찾아서 value=targetPage를 저장
				frm.attr('action', '/homeshare/book/memberbook'); // form에 action 속성 추가
				frm.attr('method', 'get'); // form에 method 속성 추가
				frm.submit(); // form 데이터 전송 
			}); // end click()
		})//end document
	</script>
</body>
</html>