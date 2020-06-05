<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/homeshare/resources/css/docs.min.css" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
</style>

<%@ include file="cdn.jspf"%>
</head>
<body>
	<c:if test="${not empty memId }">
	${memId }님, 환영합니다. <br>
		<button id="btn_logout" type="button"></button>
	</c:if>

	<button type="button" class="btn btn-default" data-toggle="modal"
		data-placement="left" title="Tooltip on left" id="bookcount"
		data-toggle="modal" data-target="#hostbookModal"></button>
	<<%-- %@ include file="hostbook_modal.jspf"%> --%>





	<%-- <%@ include file="navheader.jspf"%> --%>


	<%@ include file="section.jspf"%>
	<br>
	<br>
	<br>
	<br>
	<h1>왜 HomeShare에서 예약을 해야 할까요?</h1>
	<div class="container-fluid row " style="border: 1px solid grey">

		<div class="row col-md-4" style="border: 1px solid grey">
			<img src="/homeshare/display/starscore.png" class="img-fluid"
				height="50%" />
			<div>트립어드바이저의 유용한 전 세계 여행자 커뮤니티 덕분에 최고의 상품을 예약할 수 있습니다</div>
		</div>


		<div class="row col-md-4" style="border: 1px solid grey">
			<img src="/homeshare/display/timeicon.png" class="img-fluid"
				height="50%" />
			<p>24시간 전까지 자유롭게 취소 가능 계획이 변경되었나요? 문제없습니다. 체험 시작 최대 24시간 전까지 변경
				또는 취소하세요</p>
		</div>

		<div class="row col-md-4" style="border: 1px solid grey">
			<img src="/homeshare/display/lowpriceicon.png" class="img-fluid"
				height="50%" />
			저렴한 가격 보장 매번 최저가로 최고의 경험을 즐기세요
		</div>
	</div>



	<div class="container full-width">
		<div class="row">
			<div class="col-md-8 col-lg-8 col-sm-8">

				<figure>
					<img src="/homeshare/display/business.jpg"
						class="img-responsive img-rounded" />
					<h4>지금 당장 떠나세요</h4>
					<div class="overlay">
						<div class="description">크리스마스에는...</div>
					</div>
				</figure>
			</div>

			<aside class="col-md-4 col-lg-4 col-sm-4">

				<figure>
					<img src="/homeshare/display/business.jpg"
						class="img-responsive img-rounded" />
					<h4>텍스트2</h4>
					<div class="overlay">
						<div class="description">크리스마스에는...</div>
					</div>
				</figure>

			</aside>

		</div>
	</div>
	<%@ include file="footer.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			console.log('is host? : ' + ishost());
			if(ishost()){
				$('#bookcount').html('새로운 예약이 있습니다');
			}
			getsHouseNoByMemNo();
			
			
			function getsHouseNoByMemNo() {
			var url = '/homeshare/book/all/' + '${memId }';
			$.getJSON(url, function (jsonData) {
				$(jsonData).each(function () {
					
				});//end each
			});//end getJSON
			}//end function
			
			
			
			function ishost() {
				console.log('getAllBookByMemId 실행 ');
				var url = '/homeshare/book/all/' + '${memId }';
				console.log('url : ' + url);
				if($.getJSON(url)){
					return true;
				}else return false;
			};// end getAllBookByMemId

		}); // end document
	</script>
</body>

</html>