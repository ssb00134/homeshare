<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<title>Sssoon Page</title>

<link href="/homeshare/resources/css/bootstrap.css" rel="stylesheet">
<link href="/homeshare/resources/css/coming-sssoon.css" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<!--     Fonts     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>




    <style type="text/css">
        html,body{ margin:0; padding:0; width:100%; height:100%;}
        .main{ width:100%; height:100%; position:relative; color:#ffffff; font-size:24pt;}        
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    
    
    
    
    
    
    
    
    
    <!-- datepicker -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
    
    <!-- end datepicker -->
    
    
    
    
    
    
    
    <script src="/homeshare/resources/js/jquery-1.10.2.js"
	type="text/javascript"></script>
	
<script src="/homeshare/resources/js/bootstrap.min.js"
	type="text/javascript"></script>
    
   
</head>
<body>

	
	
	 <div class="main" id="1">
	<%@ include file="../navbar.jspf"%>

		<!--    Change the image source '//homeshare/resources/images/default.jpg' with your favourite image.     -->
<div class="cover black" data-color="black"></div>

		
		<!--   You can change the black color for the filter with those colors: blue, green, red, orange       -->

		<div class="container">
			<h1 class="logo cursive">homeShare</h1>
			<!--  H1 can have 2 designs: "logo" and "logo cursive"           -->

			<div class="content">
				<h1>대기중인예약</h1>
	<div class="row">
		<div class="col-md-8">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#waitingBook">대기중인 예약</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#acceptBook">내가 수락한 예약</a></li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane fade show active" id="waitingBook">
				대기중인예약
				<div id="hostbook"></div>
				</div>
				<div class="tab-pane fade" id="acceptBook">
					<c:if test="${bookList ne null }">
						<div class="row border">
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
									<c:forEach var="vo" items="${bookList }">
										<tr class="bookItem ">
											<td class="bookNo">${vo.bookNo}</td>
											<td class="checkin">${vo.checkin.split(" ")[0]}</td>
											<td class="checkout">${vo.checkout.split(" ")[0]}</td>
											<td>${vo.bookMem}</td>
											<td>${vo.totalPrice}</td>
											<td class="bookableChk btn btn-danger">
												취소
												
												</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</c:if>
				</div>

			</div>
		</div>
		<div class="col-md-4 border">
			<div id="dateArea1"></div>
			<div id="dateArea2"></div>
		</div>
	</div>
			</div>
		</div>
		<div class="footer">
			<div class="container">
			<a>AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA>
			
			</a>
			
			</div>
		</div>
	</div>
	
	
	
	
	
	<div class="main">
	
</div>


	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							getBookByHostId();

							function getBookByHostId() {
								console.log('getAllBookByMemId 실행 ');
								var url = '/homeshare/book/all/' + '${memId }';
								console.log('url : ' + url);
								$.getJSON(url,
												function(jsonData) {
													if (jsonData.length > 0) {
														console
																.log('jsonData 개수 : '
																		+ jsonData.length);
														var list = '';
														var count = 0;
														$(jsonData)
																.each(
																		function() {
																			var dateDiffer = new Date(
																					this.checkout
																							.split(' ')[0])
																					.getDate()
																					- new Date(
																							this.checkin
																									.split(' ')[0])
																							.getDate();
																			console
																					.log('dateDiffer : '
																							+ dateDiffer);
																			//this.hostCheck 가 1일때만 실행함

																			if (this.hostCheck == 0) { // checkin이 0일때  미수락상태일때 실행
																				count++;
																				list += '<div class="book_item">'
																						+ '<div class=" row">'
																						+ '<div id="bookNo" class=col-md-1>'
																						+ this.bookNo
																						+ '</div>'
																						+ '<div id="bookHouseNo" class=col-md-1>'
																						+ this.bookHouseNo
																						+ '</div>'
																						+ '<div class=col-md-2>'
																						+ this.checkin
																								.split(' ')[0]
																						+ '</div>'
																						+ '<div class=col-md-2>'
																						+ this.checkout
																								.split(' ')[0]
																						+ '</div>'
																						+ '<div class=col-md-1>'
																						+ this.bookMem
																						+ '</div>'
																						+ '<div class=col-md-1>'
																						+ dateDiffer
																						+ '</div>'
																						+ '<div class=col-md-2>'
																						+ this.totalPrice
																						+ '</div>'
																						+ '<div class=col-md-1>'
																						+ '<input type="hidden" value="' + this.bookNo + '" >'
																						+ '<button class="btn_bookUpdate btn btn-success" id ="btn_bookUpdate" type="text">O</button>'
																						+ '</div>'
																						+ '<div class=col-md-1>'
																						+ '<input type="hidden" value="' + this.bookNo + '" >'
																						+ '<button class="btn_bookDelete btn btn-danger" type="text">X</button>'
																						+ '</div>'
																						+ '</div>'
																						+ '<hr>';
																			}
																			$(
																					'#hostbook')
																					.html(
																							list);

																			if (count > 0) {
																				$(
																						'#bookcount')
																						.html(
																								'새로운 예약이 있습니다');
																			}
																			//book delete
																			$(
																					'.btn_bookDelete')
																					.on(
																							'click',
																							function() {
																								event
																										.preventDefault();
																								console
																										.log('btn_bookDelete 클릭');
																								//var hostCheck = $(this).prev().val() ; // 이전 선택자 
																								var bookNo = $(
																										this)
																										.prev()
																										.val();
																								console
																										.log('bookNo :'
																												+ bookNo);
																								$
																										.ajax({
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
																													alert('삭제 성공');
																													getBookByHostId();//제귀가능 리프레쉬
																												} // end if
																											} // end success
																										}); // end ajax
																							});//end btn_bookdelete click

																			//book update
																			$(
																					'.btn_bookUpdate')
																					.on(
																							'click',
																							function() {
																								event
																										.preventDefault();
																								console
																										.log('btn_bookUpdate 클릭');
																								//var hostCheck = $(this).prev().val() ; // 이전 선택자 
																								var bookNo = $(
																										this)
																										.prev()
																										.val();
																								console
																										.log('bookNo :'
																												+ bookNo);
																								$
																										.ajax({
																											type : 'put',
																											url : '/homeshare/book/'
																													+ bookNo,
																											headers : {
																												'Content-Type' : 'application/json',
																												'X-HTTP-Method-Override' : 'PUT'
																											},
																											data : JSON
																													.stringify({
																														'hostCheck' : 1
																													}),
																											success : function(
																													result) {
																												if (result == 'success') {
																													alert('수락 성공');
																													getBookByHostId();//제귀가능 리프레쉬
																												} // end if
																											} // end success
																										}); // end ajax
																							});//end btn_bookdelete click

																		});//end each
													}// end if

												}); //end getJSON
							}
							;// end ishost

							//TODO : 날짜 지나면 회색표시
							/* 		$('#bookItem').each(function(){
										var checkin = $(this).children('.checkin').html();
										var checkout = $(this).children('.checkout').html();
										
										
										console.log('checkout : ' + checkout);
										
									}); */

							disableAllTheseDays(new Date);

							function disableAllTheseDays(date) {
								var disableStrings = ''; //예약불가 날짜를 담을 배열 선언

								$('.bookItem')
										.each(
												function(index, element) {
													console.log('index '
															+ index
															+ ' element : '
															+ element);
													var checkin = $(element)
															.children(
																	'.checkin')
															.html();
													var checkout = $(element)
															.children(
																	'.checkout')
															.html();
													var checkinDate = new Date(
															checkin);
													var checkoutDate = new Date(
															checkout);
													console
															.log('checkoutDate :'
																	+ checkoutDate);

													disableStrings += getDaysArray(
															checkinDate,
															checkoutDate);

												});

								console
										.log('bookitem each 이후 disableStrings : '
												+ disableStrings);
								//선택불가 영역을 리턴하는 함수
								var disableList = disableStrings.split(',');
								console.log('disableList : ' + disableList);
								console.log('disableList length : '
										+ disableList.length);

								console.log('매개변수 date : ' + date);
								var isoDate = date.toISOString().slice(0, 10);
								console.log('isoDate : ' + isoDate);

								if (disableList) { // disableList에 값이 있을때만 실행함
									for (i = 0; i < disableList.length - 1; i++) { //마지막 배열은 제외 ''이므로

										console.log('disableList[' + i + '] : '
												+ disableList[i]
												+ ' isoDate : ' + isoDate);
										console.log('disableList[' + i + ']('
												+ disableList[i]
												+ ') === isoDate ' + isoDate
												+ '? '
												+ (disableList[i] == isoDate));
										if (disableList[i] == (isoDate)) { //만약 문자열이 일치하면
											console.log('제거할 isoDate : '
													+ isoDate);
											return [ false ];
										}
									}
									return [ true ];
								}

								/* function disableAllTheseDays(date) {
								    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
								    for (i = 0; i < disabledDays.length; i++) {
								        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
								            return [false];
								        }
								    }
								    return [true];
								} */
							} //end disableAllTheseDays

							// getDaysArray 선택불가 영역을 리턴하는 함수
							function getDaysArray(start, end) {
								for (var arr = '', dt = start; dt <= end; dt
										.setDate(dt.getDate() + 1)) {
									arr += dt.toISOString().slice(0, 10) + ',';
								}
								return arr; //마지막에 구분
							}
							;
							// end getDaysArray 선택불가 영역을 리턴하는 함수
							console.log('ui month : '
									+ $('#dateArea1').children(
											'.ui-datepicker-month'));

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
								minDate : new Date(),
								beforeShowDay : disableAllTheseDays,
							}); //end disableList

							var defaultDate = '';
							if ($('.ui-datepicker-month').val() * 1 + 1 < 10) {
								defaultDate = $('.ui-datepicker-year').val()
										+ '-0'
										+ ($('.ui-datepicker-month').val() * 1 + 1)
										+ '-01';
							} else {
								defaultDate = $('.ui-datepicker-year').val()
										+ '-'
										+ ($('.ui-datepicker-month').val() * 1 + 1)
										+ '-01';
							}
							console.log('defaultDate : ' + defaultDate
									+ 'defaultDate typeof : '
									+ typeof defaultDate);

							$('#dateArea2').datepicker({
								defaultDate : defaultDate,
								//기본 시작값
								dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
								changeMonth : true,
								changeYear : true,
								nextText : '다음 달',
								prevText : '이전 달',
								showOtherMonths : true,

								selectOtherMonths : true,
								minDate : new Date(),
								beforeShowDay : disableAllTheseDays,
							}); //end disableList

							var checkin1 = $('.checkin');
							console.log('checkin : ' + checkin1.html());

					
							
							//하루전에 취소 불가능 
							//블록처리
							$('.bookableChk').each(function(){
								console.log('bookablechk' + $(this).html());
								var checkin = $(this).siblings('.checkin').html();
								var bookNo = $(this).siblings('.bookNo').html();
								console.log('checkin sib: ' + checkin);
								
								var datediffer =   (new Date(checkin).getTime() - new Date().getTime() ) / (1000* 60 * 60*24);
								console.log('bookno : ' + bookNo + ' chk datediffer : ' + datediffer);
								if(datediffer<1){ //만약 24시간 전이라면 취소가 불가능함
									console.log('bookNo : ' +bookNo + "행을 블록함");
									console.log('thishtml : ' + $(this).html());
									$(this).html('');
									$(this).parent().attr('class','table-secondary');
								}
							});
							
							//btn delte 예약 삭제하기
							$('.bookableChk').click(function(){
								console.log('bookableChk click');
								var bookNo = $(this).siblings('.bookNo').html();
								console.log('btn delete bookNo : ' + bookNo);
							});
							
							
							
						});//endscript
	</script>
















</body>
</html>