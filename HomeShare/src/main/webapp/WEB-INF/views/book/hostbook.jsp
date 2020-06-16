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
	<h1>대기중인예약</h1>
	
	<button type="button" class="btn btn-default" data-toggle="modal"
		data-placement="left" title="Tooltip on left" id="bookcount"
		data-toggle="modal" data-target="#hostbookModal"></button>
	
		<form class="modal fade" id="hostbookModal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<!-- modal head -->
				<div class="modal-header">
					<h5 class="modal-title">숙소현황</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- modal body -->
				<div class="container-fluid">
					<div class="row">
					<!-- 1열 head -->
						<div class=col-md-1>예약번호</div>
						<div class="divider"></div>
						<div class=col-md-1>숙소번호</div>
						<div class="divider"></div>
						<div class=col-md-2>체크인</div>
						<div class="divider"></div>
						<div class=col-md-2>체크아웃</div>
						<div class="divider"></div>
						<div class=col-md-1>인원수</div>
						<div class=col-md-1>방문일수</div>
						<div class=col-md-2>총 가격</div>
						<div class=col-md-1>수락</div>
						<div class="divider"></div>
						<div class=col-md-1>거절</div>
						<div class="divider"></div>
						<hr>
						</div>
					</div>
					<!-- 2열 contents -->
					<div class="form-group">
						<div id="hostbook"></div>
					</div>
				</div>
			</div>
	</form>
	
	
	
	
	
	
	<h1>내가 수락한 예약</h1>
	

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
						<td>수락여부</td>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${bookList }">
						<tr class="bookItem text">
							<td>${vo.bookNo}</td>
							<td id="checkin">${vo.checkin.split(" ")[0]}</td>
							<td id="checkout">${vo.checkout.split(" ")[0]}</td>
							<td>${vo.bookMem}</td>
							<td>${vo.totalPrice}</td>
							<td>
							<c:if test="${vo.hostCheck == 1}">수락</c:if>
							<c:if test="${vo.hostCheck == 0}">거절</c:if>
							</td>
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
			
			
			getBookByHostId();

			function getBookByHostId() {
				console.log('getAllBookByMemId 실행 ');
				var url = '/homeshare/book/all/' + '${memId }';
				console.log('url : ' + url);
				$.getJSON(url, function(jsonData) {
					if (jsonData.length > 0) {
						console.log('jsonData 개수 : ' + jsonData.length);
						var list='';
						var count =0;
						$(jsonData).each(function() {
							var dateDiffer = new Date(this.checkout.split(' ')[0]).getDate()
                        	- new Date(this.checkin.split(' ')[0] ).getDate();
                        	console.log('dateDiffer : ' +dateDiffer);
                        	 //this.hostCheck 가 1일때만 실행함
                        	
                        	if(this.hostCheck == 0){ // checkin이 0일때  미수락상태일때 실행
                        		count++;
                        		list += '<div class="book_item">' 
	                            + '<div class=" row">' 
	                            + '<div id="bookNo" class=col-md-1>' + this.bookNo + '</div>' 
	                            + '<div id="bookHouseNo" class=col-md-1>' + this.bookHouseNo + '</div>' 
	                            + '<div class=col-md-2>' + this.checkin.split(' ')[0] + '</div>' 
	                            + '<div class=col-md-2>' + this.checkout.split(' ')[0] + '</div>'
	                            + '<div class=col-md-1>'+ this.bookMem + '</div>' 
	                            + '<div class=col-md-1>' + dateDiffer + '</div>'
	                            + '<div class=col-md-2>'+ this.totalPrice + '</div>'
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
                        	$('#hostbook').html(list);        
            
                            if(count>0){
    							$('#bookcount').html('새로운 예약이 있습니다');
    						}
                            //book delete
                            $('.btn_bookDelete').on('click',function(){
                            	event.preventDefault();
                            	 console.log('btn_bookDelete 클릭');
                            	 //var hostCheck = $(this).prev().val() ; // 이전 선택자 
                            	 var bookNo = $(this).prev().val();
                            	 console.log('bookNo :' + bookNo);
	                            $.ajax({
	                                type: 'delete',
	                                url: '/homeshare/book/' + bookNo,
	                                headers: {
	                                	'Content-Type' : 'application/json', 
	                          	  	    'X-HTTP-Method-Override' : 'DELETE'
	                                },
	                               
	                                success: function (result) {
	                                    if (result == 'success') {
	                                        alert('삭제 성공');
	                                        getBookByHostId();//제귀가능 리프레쉬
	                                    } // end if
	                                } // end success
	                            }); // end ajax
                            });//end btn_bookdelete click
                            
                          //book update
                            $('.btn_bookUpdate').on('click',function(){
                            	event.preventDefault();
                            	 console.log('btn_bookUpdate 클릭');
                            	 //var hostCheck = $(this).prev().val() ; // 이전 선택자 
                            	 var bookNo = $(this).prev().val();
                            	 console.log('bookNo :' + bookNo);
	                            $.ajax({
	                                type: 'put',
	                                url: '/homeshare/book/' + bookNo,
	                                headers: {
	                                	'Content-Type' : 'application/json', 
	                          	  	    'X-HTTP-Method-Override' : 'PUT'
	                                },
	                                data: JSON.stringify(
		                                    {'hostCheck': 1}
		                                ),
	                                success: function (result) {
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
				var checkin = $(this).children('#checkin').html();
				var checkout = $(this).children('#checkout').html();
				
				
				console.log('checkout : ' + checkout);
				
			}); */
			
			disableAllTheseDays(new Date);
			
			function disableAllTheseDays(date) {
				var disableStrings =''; //예약불가 날짜를 담을 배열 선언
				
				$('.bookItem').each(function(index,element){
					console.log('index ' + index + ' element : ' + element);
					var checkin = $(element).children('#checkin').html();
					var checkout = $(element).children('#checkout').html();
					var checkinDate = new Date(checkin);
					var checkoutDate = new Date(checkout);
					console.log('checkoutDate :' + checkoutDate);
					
					disableStrings += getDaysArray(checkinDate,checkoutDate);
					
				});
				
				console.log('bookitem each 이후 disableStrings : ' + disableStrings);
				//선택불가 영역을 리턴하는 함수
				var disableList = disableStrings.split(',');
				console.log('disableList : ' + disableList);
				console.log('disableList length : ' + disableList.length);
				
				console.log('매개변수 date : '+ date);
				var isoDate = date.toISOString().slice(0, 10);
				console.log('isoDate : ' + isoDate);
				
				
				
				if (disableList) { // disableList에 값이 있을때만 실행함
					for (i = 0; i < disableList.length -1 ; i++) { //마지막 배열은 제외 ''이므로
						
						console.log('disableList[' + i + '] : ' + disableList[i] + ' isoDate : ' + isoDate );
						console.log('disableList[' + i + '](' + disableList[i] +') === isoDate ' + isoDate +'? ' 
								+ (disableList[i] ==isoDate));
						if( disableList[i] == (isoDate) ){ //만약 문자열이 일치하면
							console.log('제거할 isoDate : ' + isoDate);
							return [ false ];
						}
					}
						return [true];
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
			function getDaysArray(start,end) {
				for (var arr = '', dt = start; dt <= end; dt.setDate(dt.getDate() + 1)) {
					arr += dt.toISOString().slice(0,10) + ',';
				}
				return arr; //마지막에 구분
			};
			// end getDaysArray 선택불가 영역을 리턴하는 함수
			console.log('ui month : ' + $('#dateArea1').children('.ui-datepicker-month'));
			
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
			if($('.ui-datepicker-month').val()*1+1 < 10){
				defaultDate = $('.ui-datepicker-year').val() + '-0' + ($('.ui-datepicker-month').val()*1+1) + '-01';
			}else{
				defaultDate = $('.ui-datepicker-year').val() + '-' + ($('.ui-datepicker-month').val()*1+1) + '-01';
			}
			console.log('defaultDate : ' + defaultDate + 'defaultDate typeof : ' + typeof defaultDate);	
			
			
			
			$('#dateArea2').datepicker({
				defaultDate :  defaultDate,
				 //기본 시작값
				dateFormat : "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
				changeMonth : true,
				changeYear : true,
				nextText : '다음 달',
				prevText : '이전 달',
				showOtherMonths: true,

	            selectOtherMonths: true,
				minDate : new Date(),
				beforeShowDay : disableAllTheseDays,
			}); //end disableList
			
			
			
			
			var checkin1 =  $('#checkin');
			console.log('checkin : ' + checkin1.html());
			
			$('.bookItem').each(function(index, element){
				var checkin1 =  $('#checkin');
				console.log('index : ' + index + ' element : ' + element);
				console.log('checkin : ' + element);
			});
			
		});//endscript
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
</body>
</html>