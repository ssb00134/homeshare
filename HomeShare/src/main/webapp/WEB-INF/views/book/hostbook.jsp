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



.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}







</style>







<link href="/homeshare/resources/css/bootstrap.css" rel="stylesheet">
<script src="/homeshare/resources/js/bootstrap.min.js"
	type="text/javascript"></script>
	
	
	
	
</head>
<body>
	<%@ include file="../navheader.jspf"%>
	<h1>대기중인예약</h1>
	

	
	<div class="row">
	
	
	
	
	
	<div role="tabpanel" class="col-md-8">
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
	    <li role="presentation"><a href="#waitingBookArea" aria-controls="waitingBookArea" role="tab" data-toggle="tab"
	    class="btn" id="waitingBook">대기중인예약</a></li>
	    <li role="presentation"><a class="btn" id="waitingBook">sddd</a></li>
	
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div role="tabpanel" class="tab-pane active" id="home">
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
	    
	    </div>
	    <div role="tabpanel" class="tab-pane" id="waitingBookArea">
	
	    <table class="table table-bordered table-hover text">
						<thead class="text">
							<tr class="text">
								<td>예약번호</td>
								<td>숙소번호</td>
								<td>체크인</td>
								<td>체크아웃</td>
								<td>예약인원</td>
								<td>예약기간</td>
								<td>총금액</td>
								<td>상태</td>
		
							</tr>
						</thead>
						<tbody id="waitBookAjax">
							
								<tr class="bookItem text">
									
								</tr>
						</tbody>
					</table>
	    
	    
	    
	    
	    
	    
	    </div>
	   
	  
	  </div>
	
	</div>
	
	
	
	
	
	<div class="col-md-4 border">
				<div id="dateArea1"></div>
				<div id="dateArea2"></div>
	</div>
	
	
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
	
	
	
	
	
	
	
	

	<script type="text/javascript">
		$(document).ready(function() {
			
			
			//리플 별점주기
			$('.starRev span').click(function(){
				  $(this).parent().children('span').removeClass('on');
				  $(this).addClass('on').prevAll('span').addClass('on');
				  return false;
				});
			
			
			
			
			getBookByHostId();
			
			function getBookByHostId() {
				console.log('getAllBookByMemId 실행 ');
				var url = '/homeshare/book/all/' + '${memId }';
				console.log('url : ' + url);
				$.getJSON(url, function(jsonData) {
					if(jsonData.length > 0){
						
						var waitingBookCount=0;
						$(jsonData).each(function(){
							if(this.hostCheck == 0){
								waitingBookCount++;
							}
						});
						$('#waitingBook').append('<span class="badge badge-danger">' + waitingBookCount +'</span>');
						
						
						
						var list='';
						$(jsonData).each(function() {
							
                        	
                        	if(this.hostCheck == 0){ // checkin이 0일때  미수락상태일때 실행
                        		list+= '<tr>'
                        		+ '<td>'
                        		+ this.bookNo
                        		+ '</td>'
                        		+ '<td>'
                        		+ this.bookHouseNo
                        		+ '</td>'
                        		+ '<td>'
                        		+ this.checkin.split(' ')[0]
                        		+ '</td>'
                        		+ '<td>'
                        		+ this.checkout.split(' ')[0]
                        		+ '</td>'
                        		+ '<td>'
                        		+ this.bookMem
                        		+ '</td>'
                        		+ '<td>'
                        		+ dateDiffer
                        		+ '</td>'
                        		+ '<td>'
                        		+ this.totalPrice
                        		+ '</td>'
                        		
                        		+'</tr>';
                        	}//end hostcheck 0 미수락 상태
                        	$('#waitBookAjax').html(list);
                        	
						});//end each;
					}else{
						$('#waitingBook').attr('class','disabled');
					}
				});//end getjson
				
			}//end getBookByHostId();
		
			
			
			
			
			//TODO : 날짜 지나면 회색표시
	/* 		$('#bookItem').each(function(){
				var checkin = $(this).children('.checkin').html();
				var checkout = $(this).children('.checkout').html();
				
				
				console.log('checkout : ' + checkout);
				
			}); */
			
			disableAllTheseDays(new Date);
			
			function disableAllTheseDays(date) {
				var disableStrings =''; //예약불가 날짜를 담을 배열 선언
				
				
				
				$('.bookItem').each(function(index,element){
					console.log('index ' + index + ' element : ' + element);
					var checkin = $(element).children('.checkin').html();
					
					
					var dateDiffer = Math.floor(new Date(checkin).getTime() - new Date().getTime() ) / (1000*3600*24);
					if(dateDiffer>0){
						var checkout = $(element).children('.checkout').html();
						var checkinDate = new Date(checkin);
						var checkoutDate = new Date(checkout);
						console.log('checkoutDate :' + checkoutDate);
						
						//$(this).children('.cancleAble').html('<button class="btnbookdelete btn">취소하기</button>');
						//$(this).attr('class','active');
						
						disableStrings += getDaysArray(checkinDate,checkoutDate);	
						
					}
					
					
					
				});
				
				console.log('bookitem each 이후 disableStrings : ' + disableStrings);
				//선택불가 영역을 리턴하는 함수
				var disableList = $.unique(disableStrings.split(','));
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
			
			
			$("#dateArea2").datepicker('setDate','+1m'); 
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
			}).datepicker('setDate','+1m'); //end disableList
			
			
			
			
			
			var checkin1 =  $('.checkin');
			console.log('checkin : ' + checkin1.html());
			
			$('.bookItem').each(function(index, element){
				var checkin1 =  $('.checkin');
				console.log('index : ' + index + ' element : ' + element);
				console.log('checkin : ' + element);
			});
			
			
			//예약 disable 처리
			$('.cancleAble').each(function(index, element){
				var checkin = $(element).siblings('.checkin').html();
				console.log(' cancleAble checkin : ' + checkin);
				
				
			
				
				var dateDiffer = Math.floor(new Date(checkin).getTime() - new Date().getTime() ) / (1000*3600*24);
				
				
            	console.log('dateDiffer : ' +dateDiffer);
            	$(this).html(dateDiffer);
            	
			});//end cancleAble each
			
			
			
			
			
			
			//페이징 처리
			// 클릭한 a태그의 정보를 가져오는 코드
							$('.pager li a').click(function() {
								// .pager 클래스의 하위 li 요소의 하위 a 요소를 찾아감
								event.preventDefault(); // a 태그의 기본 동작(페이지 이동)을 금지
								var targetPage = $(this).attr('href'); // a 태그 href 속성의 값을 저장
								console.log(targetPage);

								var frm = $('#pagingForm'); // form의 정보를 frm에 저장
								frm.find('[name="page"]').val(targetPage); // name="page"를 찾아서 value=targetPage를 저장
								frm.attr('action', '/homeshare/book/hostbook'); // form에 action 속성 추가
								frm.attr('method', 'get'); // form에 method 속성 추가
								frm.submit(); // form 데이터 전송 
							}); // end click()
			
		});//endscript
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
</body>
</html>