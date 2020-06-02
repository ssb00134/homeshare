<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="../cdn.jspf"%>
<style type="text/css">
.ui-datepicker{ font-size: 12px; width: 200px; }
</style>
</head>
<body>

	<!-- 헤더정보 가져오기 -->
	<%@ include file="../navheader.jspf"%>
	<form id="frm">
		<h1>
			${houseVO.title }
		</h1>
		<div class="row">
		
		<div class="col-md-2">인원 ${houseVO.maxCapacity }명</div>
		<div class="col-md-2">침실 ${houseVO.bedroom }개</div>
		<div class="col-md-2">욕실${houseVO.bathroom }개</div>
		</div>
		<hr>
		<div>${houseVO.scope }</div>
		<br>
		<div>편의시설 ${houseVO.utilities }</div>
		<br>
		<div>이용가능시설 ${houseVO.spaces }</div>
		<br>
		<div>가격 ${houseVO.price }</div>
		<p class="lead">${houseVO.info }</p>
			<br>
			<input id="imgSource" type="hidden" value="${houseVO.image }" />
			<br>
			<div id="imgArea"></div>
			<input type="text" name="houseNo"  id = "houseNo" value="${houseVO.houseNo }">
			<input type="text" name="memNo" value="${houseVO.memNo }">
	</form>
	<hr>
	${ houseVO.info}
	<hr>
	<div style="float:right;" class="border col-md-5" style="position: relative; z-index: 1;">
		<h4>계산 영역</h4>
			<div class= "row">
			<div class="disableList" id="disableCheckIn" style="position: relative; z-index: 1;"></div>
			<div class="disableList" id="disableCheckOut"></div>
			</div>
		<div>
			<input type="text" class="testDatepicker" id="checkIn" name="checkin"
				value="" readonly>
			<br>
		</div>
		<input type="hidden" id="checkInDate">
		<div>
			<input type="text" class="testDatepicker" id="checkOut"
				name="checkout" readonly>
			<br>
			<input type="hidden" id="checkOutDate">
			<br>
		</div>
		날짜차이
		<input type="text" id="dateDiffer">
		<input type="hidden" name="bookhouseNo" value="${houseVO.houseNo }">
		<input type="hidden" name="bookMemNo" value="${memberVO.memNo }">

		<div>
			<div>
				<input type="number" name="bookMem" id="bookMem" value="1">
				<br>
			</div>
			<div class="form-group">
			<input type="number" class="col-md-4"name="price" id="price"
				value="${houseVO.price }" readonly>
			총 합계
			<input type="number" class="col-md-4" readonly="readonly" name="totalPrice" min="1"
				max="${houseVO.maxCapacity }" id="totalPrice"
				value="${houseVO.price }" readonly>
			</div>
			<div id="bookdate"></div>
			<input type="submit" id="bookbtn" value="예약하기">
			<button type="button" id="test">체크</button>
			<div id="bookResult"></div>
		</div>
		
	</div>

	<%@ include file="../reply.jspf"%>

	<br>


	<!-- Trigger/Open The Modal -->
	<%@ include file="../report.jspf"%>

	TODO : 리플의 memid와 세션의 memid가 일치하는지 확인할것 ->프론트엔드에서 막음 ->서버에서 막기
	<br> TODO : 결제한 회원만 리플가능

	<div id="books"></div>
	<%@ include file="../footer.jspf"%>
	<script type="text/javascript">
	$(document).ready(function(){
		getAllBooks();
		

		//세션체크
		var sessionMemNo = '${memberVO.memNo}';
		var itemsMemNo = '${houseVO.memNo}';
		console.log('sessionmemNo : '+sessionMemNo);
		console.log('items memNo : ' + itemsMemNo);

		
		//삭제 버튼
		var frm = $('#frm');
		$('#btn_delete').click(function(){
			frm.attr('action','house-delete');
			frm.attr('method','post');
			frm.find('[name="houseNo"]').val('${houseVO.houseNo}');
			frm.find('[name="memNo"]').val('${houseVO.memNo}');
			frm.submit();
		});
		

		/* 달력영역 */
		var checkIn= $('#checkIn').val();
		var checkOut= $('#checkOut').val();
		console.log('checkIn : ' + checkOut);
		console.log('checkOut : ' + checkOut);
		var ar1=null;// checkIn 값을 담을 배열
		var date1 = null;
		console.log('date1 :' + date1);
		//체크아웃
		var ar2 = null;
		var date2 = null;
		
		 
		 var date1Time = null;
		
		 $('#disableCheckOut').on('clik', function(){
			var checkin = new Date($("#disableCheckIn").datepicker().val());
			var checkout =new Date($("#disableCheckOut").datepicker().val());
			console.log('checkout val : ' + checkout);
			//var datediffer = Math.ceil((checkout.getTime()-checkin.getTime())/(1000*3600*24));
			//console.log('disableCheckOut click datediffer : ' + datediffer);
			
		 });//end disableCheckOut click
		 

		$('#bookMem').focus(function(){
			console.log('focus');
			var bookMem = $('#bookMem').val();
			var price = $('#price').val();
			var dateDiffer = $('#dateDiffer').val();
			$('#totalPrice').val(bookMem* price * dateDiffer);
			
			console.log("bookmem : " + bookMem)
			console.log($('#price').val());
			console.log($('#dateDiffer').val());
		});
		$('#bookMem').blur(function(){
			console.log('blur');
			var bookMem = $('#bookMem').val();
			var price = $('#price').val();
			var dateDiffer = $('#dateDiffer').val();
			$('#totalPrice').val(bookMem* price * dateDiffer);
			
			console.log("bookmem : " + bookMem)
			console.log($('#price').val());
			console.log($('#dateDiffer').val());
			
		});
		

		//테스트 실행
		$('#test').click(function(){
			var bookNo = 0;
			var bookMemNo = '${memberVO.memNo}';
			var bookHouseNo = $('#houseNo').val();
			var checkin = $("#disableCheckIn").datepicker().val();
			var checkout = $("#disableCheckOut").datepicker().val();
			var hostCheck = 0;
			var bookMem = $('#bookMem').val();
			var totalPrice = $('#totalPrice').val();
			console.log('bookmemono : '+ bookMemNo);
			var price = $('#price');
			var datediffer = Math.ceil((checkout.getTime()-checkin.getTime())/(1000*3600*24));
			var totalprice = datediffer * bookMem * price;
			var obj = {
					'bookNo' : bookNo,
					'bookMemNo': sessionMemNo,
					'bookHouseNo': bookHouseNo,
					'checkin': checkin,
					'checkout': checkout,
					'hostCheck': hostCheck,
					'bookMem': bookMem,
					'totalPrice': totalprice
					
			};
			$.each(obj, function (index, item){
				console.log('item : ' + index + " value : " + item);
			});
		});//end test
		
		//bookForm ajax 작성
		$('#bookbtn').click(function(){ // 예약하기 버튼을 누르면 ajax로 bookcontroller 전송
			var bookNo = 0;
			var bookMemNo = '${memberVO.memNo}';
			var bookHouseNo = $('#houseNo').val();
			var checkin = $("#disableCheckIn").datepicker().val();
			var checkout = $("#disableCheckOut").datepicker().val();
			var hostCheck = 0;
			var bookMem = $('#bookMem').val();
			var totalPrice = $('#totalPrice').val();
			console.log('bookmemono : '+ bookMemNo);
			var price = $('#price');
			
			//날짜차이
			var datediffer = Math.ceil((new Date(checkout).getTime()- new Date(checkin).getTime())/(1000*3600*24));
			var totalprice = datediffer * bookMem * price;
		
			//dt.setDate(dt.getDate()+1);
			if(bookMemNo===null || bookMemNo==='undefined' || bookMemNo===''){ //세션이 없을때,
				//onbeforeunload 
				alert('로그인을 먼저 해주세요');
				preventDefault();
			}
			var obj = {
					'houseNo' : '${houseVO.houseNo}',
					'bookNo' : bookNo,
					'bookMemNo': sessionMemNo,
					'bookHouseNo': bookHouseNo,
					'checkin': checkin,
					'checkout': checkout,
					'hostCheck': hostCheck,
					'bookMem': bookMem,
					'totalPrice': totalprice
					
			};
			$.each(obj, function (index, item){
				console.log('item : ' + index + " value : " + item);
			});

	
			$.ajax({
				type : 'post',
				 url : '/homeshare/book/insert',
				 headers : {
			  	  	    'Content-Type' : 'application/json', 
			  	  	    'X-HTTP-Method-Override' : 'POST'
			  	  	  }, 
	  	  	    data : JSON.stringify(obj),
				
				success : function(data){
					alert('예약성공');
					alert('data :' + data);
					$('#checkIn').val('');
					$('#checkOut').val('');
					$('#bookMem').val(0);
					$('#totalPrice').val(0);	
					console.log('data : ' + data);
					$('#bookResult').html('<button type="button">승인대기중</button>'
					+ '<button type="button" id="book_cancel">취소하기</button>');
					//getAllBooks(); // 예약후 예약 불러오기
				} //end sucess
			});//end ajax 
			//return false; // 새로고침 없이
			//getAllBooks(); // 예약후 예약 불러오기
			
		});//end click;
		//end book ajax
		//getBookReusult 모든 결과 가져오기  
	
		
		
		//예약 취소하기 구현

			
		//모든 예약영역 불러오기
		var disabledDays =[]; // 불가능한 날짜를 담을 배열 -> 전역변수로 선언
		function getAllBooks(){
			var houseNo = $('#houseNo').val();
			console.log('getAllBooks 실행');
			var url = '/homeshare/book/all/' + houseNo;
			console.log(url);
			
			var split;
			$.getJSON(
					url,
					function(jsonData){
						var list='';
						$(jsonData).each(function(index,element){
									console.log("에약번호 : " + this.bookNo);
									console.log("체크인 : " + this.checkin);
									console.log("체크아웃 : " + this.checkout);
									list += '<div class="book_list_item" readonly>'
										+ '<pre>'
					  	  		  		+ '<input type="text" id="bookNo" readonly value="' + this.bookNo + '" />'
					  	  		  		+ '<input type="text" class="booklistcheckin" readonly value="' + this.checkin.split(' ')[0] + '" />'
					  	  		  		+ '&nbsp;&nbsp;' // 공백
					  	  		  		+ '<input type="text" class="booklistcheckout" value="' + this.checkout.split(' ')[0] + '" />'
					 					+ '</pre>'
					 					+ '<hr>'
					 					+ '</div>';
					 					
					 					
					 					var checkin = this.checkin.split(' ')[0];
					 					var checkout = this.checkout.split(' ')[0];
					 					
					 					var checkindate = new Date(checkin);
					 					var checkoutdate = new Date(checkout);
					 					console.log('checkindate : ' + checkindate);
					 					console.log('checkoutdate : ' + checkoutdate);
					 					
					 					//선택불가 리스트를 리턴하는 함수
					 				var getDaysArray = function(start, end) {
										    for(var arr=[],dt=start; dt<=end; dt.setDate(dt.getDate()+1)){

										        arr.push(dt.toISOString().slice(0,10));
										    }
										    return arr;
										};
						 					
					 					
					 				   ;
					 				    disabledDays.push(getDaysArray(new Date(checkin),new Date(checkout))) ;
					 				    
					 				   var newArr='';
					 				  for (var i = 0; i < disabledDays.length; i++) {
					 					  newArr += disabledDays[i] +',';
					 				  }
					 				  console.log('newArr : ' + newArr);
					 				  split = newArr.split(',');
					 				  console.log('split : ' + split + 'splitlength : ' + split.length);
					 				   console.log(split.length); 

 					 				
								});// end each
			
								// 특정일 선택막기
								function disableAllTheseDays(date) {
								console.log('bdate : '  + date);
							    var date2 = date.toISOString().slice(0,10);

							    console.log('date2 :' + date2);
							   if(split){
							    for (i = 0; i < split.length; i++) {
							        console.log("split[" + i + "] " + split[i] + " date2 : " + date2);
							    	var newDate = new Date(split[i]);
							    	newDate.setDate(newDate.getDate());
							    	
							    	
							    	var minerdate = newDate.toString().slice(0,10);
							    	console.log('minerdate : ' +minerdate);
							    	console.log('newDate :' + newDate + ' split[] :' + split[i]);
							        
							        
							        if(date.toString().slice(0,10) == minerdate ) { // 일치하면 제외한다.
							        	 console.log('제거할 date : ' + date2);
							            return [false];
							        }
							    }
							   }else{
								   console.log('예약이 없습니다.');
							   }
							    return [true];
								} 

			 			 		$('#disableCheckIn').datepicker({
			 			 			 dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
			 						 changeMonth: true, 
			 				         changeYear: true,
			 				         nextText: '다음 달',
			 				         prevText: '이전 달',
			 			        	 minDate : (new Date() ),
			 			        	beforeShowDay: disableAllTheseDays,
			 			 		}); //end disableList datepicker
			 			 		
			 			 		$('#disableCheckOut').datepicker({
			 			 			 dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
			 						 changeMonth: true, 
			 				         changeYear: true,
			 				         nextText: '다음 달',
			 				         prevText: '이전 달',
			 			        	 minDate : $('#checkIn').val(),
			 			        	beforeShowDay: disableAllTheseDays,
			 			 		}); //end disableList datepicker
			 			 		
			 			 		
			 			 		$('#disableCheckIn').on('click',function(index,element){
			 			 			console.log('click');
			 			 			console.log($("#disableCheckIn").datepicker().val());
			 			 			$('#checkIn').val($("#disableCheckIn").datepicker().val());
			 			 			var checkin = new Date($("#disableCheckIn").datepicker().val());
			 						var checkout =new Date($("#disableCheckOut").datepicker().val());
			 						var datediffer = Math.ceil((checkout.getTime()-checkin.getTime())/(1000*3600*24));
			 						console.log('datediffer : ' + datediffer);
			 						$('#dateDiffer').val(datediffer);
			 			 		}) ; //end datepicker
			 			 		
			 			 		$('#disableCheckOut').on('click',function(index,element){
			 			 			console.log('click');
			 			 			$('#checkOut').val($("#disableCheckOut").datepicker().val());
			 			 			var checkin = new Date($("#disableCheckIn").datepicker().val());
			 						var checkout =new Date($("#disableCheckOut").datepicker().val());
			 						var datediffer = Math.ceil((checkout.getTime()-checkin.getTime())/(1000*3600*24));
			 						console.log('datediffer : ' + datediffer);
			 						$('#dateDiffer').val(datediffer);
			 			 			
			 			 		}) ; //end datepicker
								console.log('list : ' + list);
								$('#books').html(list);
			 			 		
			 			 		
							
					} //end callback
			)//end getJSON

		}//end getAllbooks
		

		
		//이미지 출력기능
		var imgSource = $('#imgSource').val();
		console.log('imgSource : ' + imgSource);
		var imgsplit = imgSource.split(',');
		console.log(imgsplit);
		var list='';
		imgsplit.forEach(function(element){
			 if(imgsplit[imgsplit.length-1] != element){
			    	console.log("element : " + element);
				    list += '<img src="/homeshare/display?fileName=' + element + '" size="100%"><br>';
			    }
		});
		$('#imgArea').html(list);
		//end img 출력기능
		
		
		
	  	
	});//end document
	
	</script>
</body>
</html>