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
	<c:if test="${not empty mem_id }">
	${memId }님, 환영합니다. <br>
		<button id="btn_logout" type="button"></button>
	</c:if>

	<button type="button" class="btn btn-default" data-toggle="tooltip"
		data-placement="left" title="Tooltip on left" id="bookcount">
	</button>






	<%@ include file="navheader.jspf"%>


	<%@ include file="section.jspf"%>
	<br>
	<br>
	<br>
	<br>
	<h1>왜 HomeShare에서 예약을 해야 할까요?</h1>
	<div class="container-fluid row " style="border : 1px solid grey">
			
			<div class="row col-md-4" style="border: 1px solid grey">
				<img src="/homeshare/display/starscore.png" class="img-fluid" height="50%" />
				<div>트립어드바이저의 유용한 전 세계 여행자 커뮤니티 덕분에 최고의 상품을 예약할 수 있습니다</div>
			</div>	
				
				
			<div class="row col-md-4" style="border: 1px solid grey">
				<img src="/homeshare/display/timeicon.png" class="img-fluid" height="50%" />
				<p>24시간 전까지 자유롭게 취소 가능 계획이 변경되었나요? 문제없습니다. 
				체험 시작 최대 24시간 전까지 변경 또는 취소하세요</p>
			</div>
			
			<div class="row col-md-4" style="border: 1px solid grey">
				<img src="/homeshare/display/lowpriceicon.png" class="img-fluid"height="50%"  />
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
		$(document)
				.ready(
						function() {
							//예약 획수 가져오기

							//툴팁초기화

							var session = '${memId}';
							console.log('session : ' + session);
							if (session != '') {
								console.log('getAllHostBook 실행');
								//getAllHostBook();
								getsHouseNoByMemNo(); //houseno 정보 가져오기
							}

							function getsHouseNoByMemNo() {
								var url = '/homeshare/house/ishost/'
										+ '${memberVO.memNo }';
								console.log('url : ' + url);
								$
										.getJSON(
												url,
												function(jsonData) {
													console
															.log(JSON
																	.stringify(jsonData));
													var parse = [];
													parse = JSON.stringify(
															jsonData).replace(
															'[', '').replace(
															']', '').split(',');
													console.log(parse[0]); //가져온 houseno 정보		

													if (parse.length > 0) { //만약 1개 이상의 house가 있으면 - host이면
														$(parse)
																.each(
																		function(
																				index,
																				element) {
																			console
																					.log(index
																							+ ' : '
																							+ element);
																			var url = '/homeshare/book/all/'
																					+ element;
																			console
																					.log('url : '
																							+ url);
																			var count = 0;
																			$
																					.getJSON(
																							url,
																							function(
																									jsonData) {
																								console
																										.log(jsonData);
																								var hostcheck = 0;
																								$(
																										jsonData)
																										.each(
																												function() {
																													if (this.hostCheck === 0) {
																														hostcheck++;
																													}
																													;

																													console
																															.log(this.bookNo
																																	+ "hostcheck : "
																																	+ this.hostCheck);
																												});// end jsonEach
																								console
																										.log('hostcheck : '
																												+ hostcheck);
																								if (hostcheck > 0) {
																									$(
																											'#bookcount')
																											.html(
																													'새로운 예약이 있습니다');
																								}
																							});//end getJSON
																		});// end each
													}//end if parse>0

												});//end getJSON
							}
							; //end getallhostbook

							//todo : ajax로 리스트 받기
							//ajax로 받기
							function getAllHostBook() {
								var url = '/homeshare/book/all/'
										+ '${memberVO.houseNo }';
								console.log('url : ' + url);
								$.getJSON(url, function(jsonData) {
									// console.log(jsonData);
									var count = 0;
									$(jsonData).each(function() {
										//console.log(jsonData);
										count++;
									}//endcallback
									);//end each 
									console.log(count);
									$('#ishostbook').html(count);
								}//end callback
								);//end getJSON
							}
							; //end getallhostbook

						}); //end document
	</script>
</body>

</html>