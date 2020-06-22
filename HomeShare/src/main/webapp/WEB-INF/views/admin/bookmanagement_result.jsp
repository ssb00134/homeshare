<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../head.jspf"%>
<h1>예약 결과</h1>

<input type="text" id="selected" value="${selected}">



<c:if test="${bookListPaging ne null }">
				<div class="row">
					<table id="books" class="table table-bordered table-hover text">
						<thead class="text">
							<tr class="text">
								<td>예약번호</td>
								<td>호스트아이디</td>
								<td>게스트아이디</td>
								<td>체크인</td>
								<td>체크아웃</td>
								<td>예약인원</td>
								<td>총 가격</td>
								<td>상태</td>
								
		
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${bookListPaging }">
								<tr class="bookItem text">
									<td class="bookNo">${vo.bookNo}</td>
									<td class="bookNo">${vo.bookHostId}</td>
									<td class="bookNo">${vo.bookGuestId}</td>
									<td class="checkin">${vo.checkin.split(" ")[0]}</td>
									<td class="checkout">${vo.checkout.split(" ")[0]}</td>
									<td>${vo.bookMem}</td>
									<td>${vo.totalPrice}</td>
									<td class="status">
										<c:choose>	
										    <c:when test="${vo.hostCheck eq '1'}">
										        수락
										    </c:when>
										    <c:when test="${vo.hostCheck ne '1'}">
										        거절
										    </c:when>
										</c:choose>
									</td>
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
			<input type="text" name="selected">
			<input type="text" name="bookHostId">
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			
			
			
			
			$('.bookItem').each(function(index,element){
				console.log('index ' + index + ' element : ' + element);
				var checkin = $(element).children('.checkin').html();
				
				
				var dateDiffer = Math.floor(new Date(checkin).getTime() - new Date().getTime() ) / (1000*3600*24);
				if(dateDiffer>1){
					$(this).children('.cancleAble').html('<button class="btnbookdelete btn">취소하기</button>');
				}
					
					
				});//end each
			
			
			$('#books').on('click',
					'.bookItem .btnbookdelete',
					function(){
				
				console.log('deltete click');
				
				var bookNo = $(this).parent().prevAll('.bookNo').html();
				console.log(bookNo);
				
				$.ajax({
					type : 'delete',
					url : '/homeshare/book/'
							+ bookNo,
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'DELETE'
					},
					success : function(
							result) {
						if (result == 'success') {
							alert('예약이 성공적으로 삭제되었습니다	.');
							
						} // end if()
					}// end success()
				});//end ajax
				location.reload();//새로고침
			});
			
			
			
			
			
			
			
			
			
			$('.pager li a').click(function() {
				// .pager 클래스의 하위 li 요소의 하위 a 요소를 찾아감
				event.preventDefault(); // a 태그의 기본 동작(페이지 이동)을 금지
				var targetPage = $(this).attr('href'); // a 태그 href 속성의 값을 저장
				console.log(targetPage);
				
				var frm = $('#pagingForm'); // form의 정보를 frm에 저장
				var selected = $('#selected').val();
				var bookHostId = 
				
				frm.find('[name="page"]').val(targetPage); // name="page"를 찾아서 value=targetPage를 저장
				frm.find('[name="selected"]').val(selected); // name="page"를 찾아서 value=targetPage를 저장
				frm.find('[name="bookHostId"]').val(bookHostId); // name="page"를 찾아서 value=targetPage를 저장
				
				
				frm.attr('action', '/homeshare/admin/bookmanagement_result'); // form에 action 속성 추가
				frm.attr('method', 'get'); // form에 method 속성 추가
				frm.submit(); // form 데이터 전송  
			}); // end click()
		}) //end documnet
	</script>
		
