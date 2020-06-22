<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../cdn.jspf"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>신고내역 결과</h1>
	<input value="${reportHostId}" type="text" id="reportHostId">
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>신고번호</th>
					<th>신고된회원번호</th>
					<th>신고된숙소번호</th>
					<th>신고내용</th>
					<th>신고된호스트번호</th>
					<th>신고된호스트아이디</th>
					<td>상태</td>
				</tr>
			</thead>
			<tbody>
				
					<tr id="reportAjax">
						
					</tr>
				
			</tbody>
		</table>
	</div>
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
	
	

	
		<form id="frm" style="display: none;">
			<input type="text" name="reportNo">
		</form>
		
		
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			getReportByReportHostId();
			
			
			
			function getReportByReportHostId(){
				var reportHostId = $('#reportHostId').val();
				console.log('reportHostId : '+ reportHostId);
				var url = '/homeshare/report/all/' + reportHostId;
				console.log('url : ' + url);
				
				$.getJSON(url,function(jsonData){
					
					var list='';
					$(jsonData).each(function(){
						console.log('jsoneach : ' + this);
						list += '<td>' + this.reportNo + '</td>'
						     + '<td>' + this.reportMemNo + '</td>'
						     + '<td>' + this.reportHouseNo + '</td>'
						     + '<td>' + this.reason + '</td>'
						     + '<td>' + this.reportedHostNo + '</td>'
						     + '<td>' + this.reportHostId + '</td>'
						     + '<td><button class="btnDelete btn">신고 삭제하기</button></td>'
					});//end each
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
				
					
					
					
					
					
					
					
					
					
					
					$('#reportAjax').html(list);
				});//end getjson
			} // end getReportByReportHostId
			
			
			
			
			
			
			$('.btnDelete').on('click',function(){
				console.log('btnDelete click');
				var frm = $('#frm');
				var reportNo = $(this).parent().siblings('.reportNo').html();
				console.log(reportNo);
				
				$.ajax({
					type : 'delete',
					url : '/homeshare/report/'
						+ reportNo,
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'DELETE'
					},
					success : function(
							result) {
						if (result == 'success') {
							alert('댓글 삭제성공')
							getAllReplies();
						} // end if()
					}// end success()
				});//end ajax
				
				
				
				/* 
				frm.attr('action', '/homeshare/report/delete'); // form에 action 속성 추가
				frm.attr('method', 'post'); // form에 method 속성 추가
				frm.find('[name="reportNo"]').val(reportNo); // name="page"를 찾아서 value=targetPage를 저장
				frm.submit(); // form 데이터 전송   */
			});//end delete click
			
			
			
			
			
			
			
			
			
			
			
			
			
			
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
			
		})//end script
	</script>
</body>
</html>