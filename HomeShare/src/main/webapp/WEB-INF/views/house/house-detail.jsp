<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="../cdn.jspf"%>
<link href="/homeshare/resources/css/docs.min.css" rel="stylesheet">

</head>
<body>

	<!-- 헤더정보 가져오기 -->
	<%@ include file="../navheader.jspf"%>

	<div class="row border">
		<h1>${houseVO.title }</h1>
	</div>
	<div class="row col-md-2 border">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
			viewBox="0 0 24 24">
			<path
				d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z" /></svg>
		${houseVO.score }
	</div>
	<input id="imgSource" type="hidden" value="${houseVO.image }" />
	<div id="imgArea" class="row border"></div>
	<div class="row">
		<div class="col-md-8">
			<div class="container-fluid">
				<div class="row border">
					<div class="row col-md-12">
						<h4>
							<strong>${houseVO.hostId }</strong>님이호스팅 하는 <strong>${houseVO.type}</strong>
						</h4>
					</div>
					<div class="row col-md-12 border">
						<div class="col-md-2">인원 ${houseVO.maxCapacity }명</div>
						<div class="col-md-2">침실 ${houseVO.bedroom }개</div>
						<div class="col-md-2">욕실${houseVO.bathroom }개</div>
					</div>
					<div class="row col-md-12 border">
						<div class="col-md-4 border">예약가능기간</div>
						<div class="col-md-4 border">${houseVO.bookableDateBegin }</div>
						<div class="col-md-4 border">${houseVO.bookableDateEnd }</div>
					</div>
					<div class="row col-md-12">

						<input type="hidden" value="${houseVO.utilities }" id="utilities">
						<div id="utilDiv" class="col-md-12">
							<h4>편의시설</h4>
						</div>
					</div>
					<hr>
					<div class="row col-md-12">${houseVO.scope }</div>
					<br> <br>
					<input type="hidden" id="spaces" value=" ${houseVO.spaces }">
					<div id="spacesDiv" class="col-md-12">
						<h4>주변 시설</h4>
					</div>

					<div>가격 ${houseVO.price }</div>
					<p class="lead">${houseVO.info }</p>
					<br>

					<input type="hidden" name="houseNo" id="houseNo"
						value="${houseVO.houseNo }">
					<input type="hidden" name="memNo" value="${houseVO.memNo }">
					<input type="hidden" id="hostId" value="${houseVO.hostId }">
					${ houseVO.info}
				</div>
				<hr>
			</div>
		</div>

		<div class="col-md-4 border">
			<div class="container">
				<div class="sidebar-nav">
					<h4>요금을 확인하려면 날짜를 입력해 주세요</h4>
					<button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#DateModal">체크인/체크아웃 조회</button>

				</div>
				
				<div class="modal" id="DateModal" role="dialog"
					aria-labelledby="mySmallModalLabel">
					<div class="modal-content">

						<!-- modal head -->
						<div class="modal-header">
							<h4 class="modal-title">날짜 선택</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-6" id="disableCheckIn" data-toggle="toggle"></div>
									<div class="col-md-6" id="disableCheckOut" data-toggle="toggle"></div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>


			
				<input type="hidden" id="dateDiffer">
				<input type="hidden" name="bookhouseNo" value="${houseVO.houseNo }">
				<input type="hidden" name="bookMemNo" value="${memberVO.memNo }">
				<input type="hidden" id="bookableDateBegin"
					value="${houseVO.bookableDateBegin }">
				<input type="hidden" id="bookableDateEnd"
					value="${houseVO.bookableDateEnd }">
				<input type="hidden" id="checkinInterval"
					value="${houseVO.checkinInterval }">
				<div>
					<div >
					<button type="button" class="btn" id="btnBookMem">인원선택</button>
						<div id="bookMem2"></div>
						<input type="hidden" name="bookMem" id="bookMem" value="1" readonly="readonly">
						<br>
					</div>
					<select >
					</select>
					
					
					<div class="form-group">
						<input type="hidden" class="col-md-4" name="price" id="price"
							value="${houseVO.price }" readonly>
						
					</div>
					<div id="bookdate"></div>
					<div id="bookResult"></div>
				</div>
				<div class="container" id="bookArea">
					
						<div class="row">기본요금 : $${houseVO.price }  </div>
						<div class="row">
						<div class="col-md-4" >인원  </div> 
						<div class="col-md-4" id="bookAreaBookMem"></div> 
						</div>
						<div class="row">
						<div class="col-md-4" id="bookAreaDateDiffer"></div>
						<div class="col-md-4">박</div>
						</div>
						<hr>
						<div class="row">
						<div class="col-md-4">총 합계</div>
						<div class="col-md-4" id="bookAreaDateTotalPrice"></div>
						</div>
						<button type="submit" id="bookbtn" class="btn btn-default">예약하기</button>
					
					
				</div>
			</div>
		</div>
	</div>



	<DIV>
		<%@ include file="../reply.jspf"%>
	</DIV>
	<!-- Trigger/Open The Modal -->
	<%@ include file="../report.jspf"%>

	<div id="books"></div>

	<%@ include file="../footer.jspf"%>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							
							$('#bookArea').hide(); // 초기화 영역
							// 유틸리티 영역
							var utilities = $('#utilities').val();
							$.each(utilities.split(','), function(index,
									element) {
								$('#utilDiv').append(
										'<div class ="row col-md-12 border">'
												+ element + '</div>');
							}); //end each

							var spaces = $('#spaces').val();
							$.each(spaces.split(','), function(index, element) {
								console.log('spaces index : ' + index
										+ ' spaces element : ' + element);
								$('#spacesDiv').append(
										'<div class ="row col-md-12 border">'
												+ element + '</div>');
								
								
							}); //end each

							//로딩시 모달 데이터 초기화 
							$("#disableCheckIn").datepicker().val('');
							$("#disableCheckIn").datepicker().val('');
							
							
							$('#btnBookMem').click(function(){
								for(var i=0; i<${houseVO.maxCapacity}; i++){
									$('bookMem2').html();										
								}
								
							});
							
							
							/* 모달 영역*/
							$('#disableCheckOut')
									.on(
											'click focus blur',
											function() {

												console.log('DateModal : '
														+ DateModal);

											}); //end disableCheckIn click

							getAllBooks();

							//세션체크
							var sessionMemNo = '${memberVO.memNo}';
							var itemsMemNo = '${houseVO.memNo}';
							console.log('sessionmemNo : ' + sessionMemNo);
							console.log('items memNo : ' + itemsMemNo);

							//삭제 버튼
							var frm = $('#frm');
							$('#btn_delete').click(
									function() {
										frm.attr('action', 'house-delete');
										frm.attr('method', 'post');
										frm.find('[name="houseNo"]').val(
												'${houseVO.houseNo}');
										frm.find('[name="memNo"]').val(
												'${houseVO.memNo}');
										frm.submit();
									});

							/* 달력영역 */
							var checkIn = $('#checkIn').val();
							var checkOut = $('#checkOut').val();
							console.log('checkIn : ' + checkOut);
							console.log('checkOut : ' + checkOut);
							var ar1 = null; // checkIn 값을 담을 배열
							var date1 = null;
							console.log('date1 :' + date1);
							//체크아웃
							var ar2 = null;
							var date2 = null;

							var date1Time = null;

							$('#disableCheckOut').on(
									'clik',
									function() {
										var checkin = new Date($(
												"#disableCheckIn").datepicker()
												.val());
										var checkout = new Date($(
												"#disableCheckOut")
												.datepicker().val());
										console.log('checkout val : '
												+ checkout);
										//var datediffer = Math.ceil((checkout.getTime()-checkin.getTime())/(1000*3600*24));
										//console.log('disableCheckOut click datediffer : ' + datediffer);

									}); //end disableCheckOut click
									
							$('#bookMem').on('click blur focus', function(){
								var checkin = $("#disableCheckIn").datepicker().val();
								var checkout = $("#disableCheckOut").datepicker().val();
								
								var datediffer = Math.ceil((new Date(checkout).getTime() 
										- new Date(checkin).getTime())/ (1000 * 3600 * 24));
								
								
								if($(this).value === 0 || $('#disableCheckOut').val() =="undefined"){
									$('#bookArea').hide();
								}else{
									console.log('this is ' + $('#bookMem').val());
									$('#bookAreaBookMem').html($('#bookMem').val() + '명');
									$('#bookAreaDateDiffer').html(datediffer +'박');
									$('#bookAreaDateTotalPrice').html('$' + $('#price').val()*$('#bookMem').val()*datediffer);
									$('#bookArea').show();
								}
								
							});// end bookMem click

							//테스트 실행
							$('#test').click(
									function() {
										var bookNo = 0;
										var bookMemNo = '${memberVO.memNo}';
										var bookHouseNo = $('#houseNo').val();
										var checkin = $("#disableCheckIn")
												.datepicker().val();
										var checkout = $("#disableCheckOut")
												.datepicker().val();
										var hostCheck = 0;
										var bookMem = $('#bookMem').val();
										console
												.log('bookmemono : '
														+ bookMemNo);
										var price = $('#price');
										var datediffer = Math.ceil((checkout
												.getTime() - checkin.getTime())
												/ (1000 * 3600 * 24));
										var totalPrice = datediffer * bookMem
												* price;
										var obj = {
											'bookNo' : bookNo,
											'bookMemNo' : sessionMemNo,
											'bookHouseNo' : bookHouseNo,
											'checkin' : checkin,
											'checkout' : checkout,
											'hostCheck' : hostCheck,
											'bookMem' : bookMem,
											'totalPrice' : totalPrice

										};
										$.each(obj, function(index, item) {
											console.log('item : ' + index
													+ " value : " + item);
										});
									}); //end test

							//bookForm ajax 작성
							$('#bookbtn')
									.click(
											function() { // 예약하기 버튼을 누르면 ajax로 bookcontroller 전송
												var bookNo = 0;
												var bookMemNo = '${memberVO.memNo}';
												var bookHouseNo = $('#houseNo')
														.val();
												var checkin = $(
														"#disableCheckIn")
														.datepicker().val();
												var checkout = $(
														"#disableCheckOut")
														.datepicker().val();
												var hostCheck = 0;
												var bookMem = $('#bookMem')
														.val();
												var totalPrice = $(
														'#totalPrice').val();
												console.log('bookmemono : '
														+ bookMemNo);
												var price = $('#price');
												var bookHostId = $('#hostId')
														.val();

												//제약조건 자기자신 예약 불가
												if (bookHostId === '${memId}') {
													alert('자신의 숙소는 예약할 수 없습니다.');
												}

												//날짜차이
												var datediffer = Math
														.ceil((new Date(
																checkout)
																.getTime() - new Date(
																checkin)
																.getTime())
																/ (1000 * 3600 * 24));
												var totalprice = datediffer
														* bookMem * price;

												//dt.setDate(dt.getDate()+1);
												if (bookMemNo === null
														|| bookMemNo === 'undefined'
														|| bookMemNo === '') { //세션이 없을때,
													//onbeforeunload 
													alert('로그인을 먼저 해주세요');
													preventDefault();
												}
												console.log('dateDiffer :'
														+ dateDiffer);
												if ($('#dateDiffer').val() < 0) {
													console.log('0보다 작음');
													alert('예약 불가 : 날짜를 확인해 주세요');
													preventDefault;
												}
												var obj = {
													'houseNo' : '${houseVO.houseNo}',
													'bookNo' : bookNo,
													'bookMemNo' : sessionMemNo,
													'bookHouseNo' : bookHouseNo,
													'checkin' : checkin,
													'checkout' : checkout,
													'hostCheck' : hostCheck,
													'bookMem' : bookMem,
													'totalPrice' : totalprice,
													'bookHostId' : bookHostId

												};
												$.each(obj, function(index,
														item) {
													console.log('item : '
															+ index
															+ " value : "
															+ item);
												});

												$
														.ajax({
															type : 'post',
															url : '/homeshare/book/insert',
															headers : {
																'Content-Type' : 'application/json',
																'X-HTTP-Method-Override' : 'POST'
															},
															data : JSON
																	.stringify(obj),

															success : function(
																	data) {
																alert('예약성공');
																alert('data :'
																		+ data);
																$('#checkIn')
																		.val('');
																$('#checkOut')
																		.val('');
																$('#bookMem')
																		.val(0);
																$('#totalPrice')
																		.val(0);
																console
																		.log('data : '
																				+ data);
																$('#bookResult')
																		.html(
																				'<button type="button">승인대기중</button>'
																						+ '<button type="button" id="book_cancel">취소하기</button>');
																//getAllBooks(); // 예약후 예약 불러오기
															} //end sucess
														}); //end ajax 
												//return false; // 새로고침 없이
												//getAllBooks(); // 예약후 예약 불러오기

											}); //end book mem click;

							//end book ajax
							//getBookReusult 모든 결과 가져오기  

							//예약 취소하기 구현

							//모든 예약영역 불러오기
							var disabledDays = []; // 불가능한 날짜를 담을 배열 -> 전역변수로 선언
							function getAllBooks() {
								var houseNo = $('#houseNo').val();
								console.log('getAllBooks 실행');
								var url = '/homeshare/book/all/' + houseNo;
								console.log(url);

								var split;
								$
										.getJSON(
												url,
												function(jsonData) {
													var list = '';
													$(jsonData)
															.each(
																	function(
																			index,
																			element) {
																		console
																				.log("에약번호 : "
																						+ this.bookNo);
																		console
																				.log("체크인 : "
																						+ this.checkin);
																		console
																				.log("체크아웃 : "
																						+ this.checkout);
																		list += '<div class="book_list_item" readonly>'
																				+ '<pre>'
																				+ '<input type="text" id="bookNo" readonly value="' + this.bookNo + '" />'
																				+ '<input type="text" class="booklistcheckin" readonly value="'
																				+ this.checkin
																						.split(' ')[0]
																				+ '" />'
																				+ '&nbsp;&nbsp;' // 공백
																				+ '<input type="text" class="booklistcheckout" value="'
																				+ this.checkout
																						.split(' ')[0]
																				+ '" />'
																				+ '</pre>'
																				+ '<hr>'
																				+ '</div>';

																		var checkin = this.checkin
																				.split(' ')[0];
																		var checkout = this.checkout
																				.split(' ')[0];

																		var checkindate = new Date(
																				checkin);
																		var checkoutdate = new Date(
																				checkout);
																		console
																				.log('checkindate : '
																						+ checkindate);
																		console
																				.log('checkoutdate : '
																						+ checkoutdate);

																		//선택불가 리스트를 리턴하는 함수
																		var getDaysArray = function(
																				start,
																				end) {
																			for (var arr = [], dt = start; dt <= end; dt
																					.setDate(dt
																							.getDate() + 1)) {

																				arr
																						.push(dt
																								.toISOString()
																								.slice(
																										0,
																										10));
																			}
																			return arr;
																		};

																		;
																		disabledDays
																				.push(getDaysArray(
																						new Date(
																								checkin),
																						new Date(
																								checkout)));

																		var newArr = '';
																		for (var i = 0; i < disabledDays.length; i++) {
																			newArr += disabledDays[i]
																					+ ',';
																		}
																		console
																				.log('newArr : '
																						+ newArr);
																		split = newArr
																				.split(',');
																		console
																				.log('split : '
																						+ split
																						+ 'splitlength : '
																						+ split.length);
																		console
																				.log(split.length);

																	}); // end each

													// 특정일 선택막기
													function disableAllTheseDays(
															date) {
														console.log('bdate : '
																+ date);
														var date2 = date
																.toISOString()
																.slice(0, 10);

														console.log('date2 :'
																+ date2);
														if (split) {
															for (i = 0; i < split.length; i++) {
																console
																		.log("split["
																				+ i
																				+ "] "
																				+ split[i]
																				+ " date2 : "
																				+ date2);
																var newDate = new Date(
																		split[i]);
																newDate
																		.setDate(newDate
																				.getDate());

																var minerdate = newDate
																		.toString()
																		.slice(
																				0,
																				10);
																console
																		.log('minerdate : '
																				+ minerdate);
																console
																		.log('newDate :'
																				+ newDate
																				+ ' split[] :'
																				+ split[i]);

																if (date
																		.toString()
																		.slice(
																				0,
																				10) == minerdate) { // 일치하면 제외한다.
																	console
																			.log('제거할 date : '
																					+ date2);
																	return [ false ];
																}
															}
														} else {
															console
																	.log('예약이 없습니다.');
														}
														return [ true ];
													}
													// houseVoMinDate : db에 저장된 체크인 날짜

													// bookableDateBegin 디비에 저장된 체크인 가능한 시간 + 체크인가능시간 반영됨
													//직접 변수 사용시 오류가 발생하므로 우회해서 접근
													var bookableDateBegin = new Date(
															$(
																	'#bookableDateBegin')
																	.val());
													var checkinInterval = $(
															'#checkinInterval')
															.val() * 1;
													bookableDateBegin
															.setDate(bookableDateBegin
																	.getDate()
																	+ checkinInterval);
													var bookableDateEnd = new Date(
															$(
																	'#bookableDateEnd')
																	.val());

													console
															.log('bookableDateBegin : '
																	+ bookableDateBegin);
													console
															.log('bookableDateEnd :'
																	+ bookableDateEnd);

													$('#disableCheckIn')
															.datepicker(
																	{
																		dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
																		changeMonth : true,
																		changeYear : true,
																		nextText : '다음 달',
																		prevText : '이전 달',
																		minDate : (new Date() < bookableDateBegin ? bookableDateBegin
																				: new Date()),
																		maxDate : bookableDateEnd,
																		beforeShowDay : disableAllTheseDays,
																	}); //end disableList datepicker

													$('#disableCheckOut')
															.datepicker(
																	{
																		dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
																		changeMonth : true,
																		changeYear : true,
																		nextText : '다음 달',
																		prevText : '이전 달',
																		minDate : $(
																				'#disableCheckIn')
																				.datepicker()
																				.val(),
																		maxDate : bookableDateEnd,
																		beforeShowDay : disableAllTheseDays,
																	}); //end disableList datepicker

													$('#disableCheckIn')
															.on(
																	'click',
																	function(
																			index,
																			element) {
																		console
																				.log('click');
																		console
																				.log($(
																						"#disableCheckIn")
																						.datepicker()
																						.val());
																		$(
																				'#checkIn')
																				.val(
																						$(
																								"#disableCheckIn")
																								.datepicker()
																								.val());
																		var checkin = new Date(
																				$(
																						"#disableCheckIn")
																						.datepicker()
																						.val());
																		var checkout = new Date(
																				$(
																						"#disableCheckOut")
																						.datepicker()
																						.val());
																		var datediffer = Math
																				.ceil((checkout
																						.getTime() - checkin
																						.getTime())
																						/ (1000 * 3600 * 24));
																		console
																				.log('datediffer : '
																						+ datediffer);
																		$(
																				'#dateDiffer')
																				.val(
																						datediffer);
																	}); //end datepicker

													$('#disableCheckOut')
															.on(
																	'click',
																	function(
																			index,
																			element) {
																		console
																				.log('click');
																		$(
																				'#checkOut')
																				.val(
																						$(
																								"#disableCheckOut")
																								.datepicker()
																								.val());
																		var checkin = new Date(
																				$(
																						"#disableCheckIn")
																						.datepicker()
																						.val());
																		var checkout = new Date(
																				$(
																						"#disableCheckOut")
																						.datepicker()
																						.val());
																		var datediffer = Math
																				.ceil((checkout
																						.getTime() - checkin
																						.getTime())
																						/ (1000 * 3600 * 24));
																		console
																				.log('datediffer : '
																						+ datediffer);
																		$(
																				'#dateDiffer')
																				.val(
																						datediffer);

																	}); //end datepicker
													console.log('list : '
															+ list);
													$('#books').html(list);

												} //end callback
										) //end getJSON

							} //end getAllbooks

							//이미지 출력기능
							var imgSource = $('#imgSource').val();
							console.log('imgSource : ' + imgSource);
							var imgsplit = imgSource.split(',');
							console.log(imgsplit);
							var list = '';
							imgsplit
									.forEach(function(element, index) {
										if (imgsplit.length / 2 - 1 > index) {
											console.log(" bx index : " + index
													+ " bx element : "
													+ element);
											list += '<img src="/homeshare/display/'
													+ element
													+ '"class="col-md-5 img-responsive" size="100%"><br>';
										}
									});
							$('#imgArea').html(list);
							//end img 출력기능

						}); //end document
	</script>
</body>
</html>