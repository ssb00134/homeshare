<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
</head>
<body>

<!-- 헤더정보 가져오기 -->
<%@ include file="../header.jspf"%>

	<form id="frm">
	<h1><p>${houseVO.title }</p></h1>
	<div>인원 ${houseVO.maxCapacity }명</div> 
	<div>인원 ${houseVO.maxCapacity }명</div> 
	<div> 침실 ${houseVO.bedroom }개 </div>
	<div> 욕실${houseVO.bathroom }개</div><hr>
	<div> ${houseVO.scope }</div><br>
	<div>편의시설 ${houseVO.utilities }</div><br>
	<div>이용가능시설 ${houseVO.spaces }</div><br>
	<div>가격 ${houseVO.price } </span><br>
	<input id = "imgSource" type="hidden" value="${houseVO.image }" /><br>
	<div id="imgArea"></div>
	<input type="text" name="houseNo" value="${houseVO.houseNo }">
	<input type="text" name="memNo" value="${houseVO.memNo }">
	</form>
	<hr>
	houseVO.info
	<hr>
	<div dir="rtl">
		계산 영역
		<div>
		 <input type="text" class="testDatepicker" id="checkIn" name="checkin" value=""> <br>
		</div>
		<input type="hidden" id="checkInDate"><br>

		 <div>
		 <input type="text" class="testDatepicker" id="checkOut" name="checkout">  <br>
		<input type="hidden" id="checkOutDate"><br>
		</div>
		날짜차이<input type="text" id="dateDiffer">
		<div id = "hidden">
		<input type="text" name="bookhouseNo" value ="${houseVO.houseNo }">
		<input type="text" name="bookMemNo" value ="${memberVO.memNo }">
		</div>
		<div>
		<div>
		<input type="number"  name="bookMem" id="bookMem" numberOnly value="1">   <br>
		</div>
		<input type="number" readonly="readonly" name="price" id="price" value="${houseVO.price }">   <br>
		총 합계
		<input type="number" readonly="readonly" name="totalPrice" min="1" max = "${houseVO.maxCapacity }" id="totalPrice"
		value="${houseVO.price }">  <br>
		<div id="bookdate"></div>
		<input type="submit" id="bookbtn" value="예약하기" >
		<div id = "bookResult"></div>
		</div>
		</div>
		
		<!-- 리플 모달 -->
		<input type="button" id="reply_btn" value="댓글 입력하기" />
		
		<div id="reply_dialog">
		<form action="/homeshare/replies" id="reply">
			<input type="text" id="memId" value="${memId }" readonly >
       <input type="text" id="content" placeholder="댓글 입력" >
 
       <input type="number" min="0" max="5" id="cleanScore" placeholder="청결도(5)">
       <input type="number" min="0" max="5" id="checkinScore" placeholder="체크인점수">
	 <button type="button" id="btn_add">작성</button>
		</form>
		</div>
		
		<!-- Trigger/Open The Modal -->
	   <input type="button" id="report_btn" value="신고하기" />
	   <div id="report_dialog">
	   <form action="report" id="report">
	   	<p>신고하기</p>
	   	<p>이 숙소를 신고하시는 이유를 알려주세요.
		내용은 호스트에게 공개되지 않습니다.
		</p>
		<input type="number" name = "reportNo" value="0">
		<input type="number" name = "reportMemNo" value="${memberVO.memNo}">
		<input type="number" name = "reportHouseNo" value="${houseVO.houseNo}"><br>
		<input type="radio" name="reason" value="부정확하거나 틀린 정보가 있어요"> 부정확하거나 틀린 정보가 있어요<br>
		<input type="radio" name="reason" value="실제 숙소가 아닙니다">실제 숙소가 아닙니다<br>
		<input type="radio" name="reason" value="사기입니다">사기입니다<br>
		<input type="radio" name="reason" value="불쾌합니다">불쾌합니다<br>
		<input type="radio" id="reason" value="기타" onclick="">기타<br>
		</form>
	   </div>
	<!-- 리플 영역 -->
	아이디 ${memId }
	
	<hr>
	<div id="showReply">
		총 <div id ="countReply"></div>개의 후기가 있습니다.
	</div>
	<hr>
	<div id = "replies" style="display:none " ></div>
	
	<hr>
	<div class="sessionchk" >
	         <button type="submit" id="btn_update" >수정</button>
    	     <button type="submit" id="btn_delete" >삭제</button>
    </div>
	TODO : 리플의 memid와 세션의 memid가 일치하는지 확인할것
	->프론트엔드에서 막음 
	->서버에서 막기
	<br>
	TODO : 결제한 회원만 리플가능
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<script type="text/javascript">
	$(document).ready(function(){
		//세션체크
		var sessionMemNo = '${memberVO.memNo}';
		var itemsMemNo = '${houseVO.memNo}';
		console.log('sessionmemNo : '+sessionMemNo);
		console.log('items memNo : ' + itemsMemNo);
		//sessionchk
		if(itemsMemNo ===  sessionMemNo){
			console.log('세션No itemsno 일치');
			$('.sessionchk').show();
		}else{
			$('.sessionchk').hide();
		}
		
		//삭제 버튼
		var frm = $('#frm');
		$('#btn_delete').click(function(){
			frm.attr('action','house-delete');
			frm.attr('method','post');
			frm.submit();
		});
		
		
		
		//댓글 모달 영역
		$("#reply_btn").click(function(){
			$( "#reply_dialog" ).dialog( "open" ); 
		});
		
		$( "#reply_dialog" ).dialog({ 
			autoOpen: false, 
			//레이어팝업 넓이 
			width: 400, 
			//뒷배경을 disable 시키고싶다면 true 
			modal: true, 
			buttons: [ 
				{ //버튼텍스트 
					text: "후기 작성", //클릭이벤트발생시 동작 
					click: function() { 
						var content = $('#content').val();
						var memId ='${memId}';
						var regdate =null;
				  	  	var cleanScore = $('#cleanScore').val(); // 클린점수
				  	  	var checkinScore = $('#checkinScore').val(); // 클린점수
				  		var obj = {
					  			'rno' : 0,
					  	  	    'houseNo' : houseNo,
					  	  		'content' : content,
					  	  		'memId' : memId,
					  	  		'regdate' : null,
					  	  		'score' : 0,
					  	  		'cleanScore' : cleanScore,
					  	  		'checkinScore' : checkinScore
				  	  	}; // end var obj
				  	  	
				  	  $.ajax({
				  	  	  type : 'post',
				  	  	  url : '/homeshare/replies',
				  	  	  headers : {
				  	  	    'Content-Type' : 'application/json', 
				  	  	    'X-HTTP-Method-Override' : 'POST'
				  	  	  }, 
				  	  	  data : JSON.stringify(obj),
				  	  	  success : function(result, status){
				  	  	    console.log(result);
				  	  	    console.log(status);
				  	  	    if (result == 1){
				  	  	      alert('댓글 입력 성공');
				  	  	      $('#content').val(''); // 성공메시지 이후 삽입했던 content 데이터 삭제
				  	  	      $('#memId').val(''); // 성공메시지 이후 삽입했던 memid 데이터 삭제
				  	  	      $('#cleanScore').val('');
				  	  	      $('#checkinScore').val('');
				  	  	      getAllReplies(); // 메소드 호출
				  	  	    } // end if()
				  	  	  } // end success
				  	  	  
				  	  	}); // end ajax()
				  	$( this ).dialog( "close" ); 
					} 
				}, 
				{ //버튼텍스트 
					text: "취소", //클릭이벤트발생시 동작 
					click: function() { 
						$( this ).dialog( "close" ); 
					} 
				} 
				] 
			
		});
		
		$("#report_btn").click(function(){
			$( "#report_dialog" ).dialog( "open" ); 
		});

		//리포트 모달영역
		$( "#report_dialog" ).dialog({ 
			//이벤트 발생했을때 보여주려면 autoOpen : false로 지정해줘야 한다.
			autoOpen: false, 
			//레이어팝업 넓이 
			width: 400, 
			//뒷배경을 disable 시키고싶다면 true 
			modal: true, 
			//버튼종류 
			buttons: [ 
			{ //버튼텍스트 
				text: "신고하기", //클릭이벤트발생시 동작 
				click: function() { 
					reportMemNo = $('[name="reportMemNo"]').val();
					reportHouseNo = $('[name="reportHouseNo"]').val();
					reason = $('[name="reason"]').val();
					 var frm = $('#report');
				  	    frm.attr('action', '/homeshare/report');
				  	    frm.attr('method', 'post');
				  	    frm.find('[name="reportNo"]').val(0);
				  	    frm.find('[name="reportMemNo"]').val(reportMemNo);
				  	    frm.find('[name="reportHouseNo"]').val(reportHouseNo);
				  	    frm.find('[name="reason"]').val(reason);
				  	    frm.submit(); 
					$(this).dialog("close");
				} 
			}, 
			{ //버튼텍스트 
				text: "닫기", //클릭이벤트발생시 동작 
				click: function() { 
					$( this ).dialog( "close" ); 
				} 
			} 
			] 
		}); //end modal
		


		
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
		 var num1 =new Date('${houseVO.bookableDateBegin}');
		 var num2 = new Date();
		 var num3 = new Date('$(checkOutDate)');
		 
		
		 
		 $( "#checkIn" ).datepicker({
				
				dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
				changeMonth: true, 
		         changeYear: true,
		         nextText: '다음 달',
		         prevText: '이전 달',
	        	 minDate : (num2>num1)&&(num3>num1)?num1:(num2>num3?num3:num2),

	        	 //최소 예약가능 시간
	        	 
	       	     maxDate:$('#checkOut').val()
	    	});
		 
		 $( "#checkOut" ).datepicker({
				
				dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
				changeMonth: true, 
		         changeYear: true,
		         nextText: '다음 달',
		         prevText: '이전 달',
	        	 minDate : (num2>num1)&&(num3>num1)?num1:(num2>num3?num3:num2),

	        	 //최소 예약가능 시간
	        	 
	       	     maxDate: $( "#checkIn" ).val()
	    	});
		 
		 var date1Time = null;
		$( "#checkIn" ).change('click',function(){
	    		console.log('on 실행' );			
	    		checkIn = $(this).val();
		    	console.log('this vaule : ' + $(this).val());
    		 	//string 타입임	    	
		    	 console.log('checkIn : ' + checkIn);
		    		 
	    		 if(checkIn !=null || checkIn !='undefined' || checkIn !=''){
		    		 ar1 = checkIn.toString().split('-');
		    		 date1 = new Date(ar1[0],ar1[1],ar1[2]);
		    		 console.log('date1 : ' + date1);
		    		 $('#checkInDate').val(date1.getTime());
		    		 date1Time =  date1.getTime();
		    		 
		    		 var dateDiffer =($('#checkOutDate').val() - $('#checkInDate').val()) / (86400*1000);
		    			$('#dateDiffer').val(dateDiffer);
	    		 }
	    		 console.log('체크아웃 : ' + $('#checkOut').val());
	    		
	    });
		var date2Time = null;
		$( "#checkOut" ).change('click',function(){
			console.log('on 실행' );
			 var checkOut = $(this).val();
	    		console.log('this vaule : ' + $(this).val());
	    		 //string 타입임	    	
	    		 console.log('checkOut : ' + checkOut);
	    		 
	    		 if(checkOut !=null || checkOut !='undefined'|| checkOut !=''){
		    		 ar2 = checkOut.toString().split('-');
		    		 date2 = new Date(ar2[0],ar2[1],ar2[2]);
		    		 $('#checkOutDate').val(date2.getTime());
		    		 console.log('date2 gettime : ' + date2.getTime());
		    	
		    		 date2Time =  date2.getTime();
		    		 var dateDiffer =($('#checkOutDate').val() - $('#checkInDate').val()) / (86400*1000);
		    			$('#dateDiffer').val(dateDiffer);
	    		 }	 
   		 });
		
		//totalprice
		//가격 = 인원 * 날짜 * 기본가격
		

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
		
		//bookForm ajax 작성
		$('#bookbtn').click(function(){ // 예약하기 버튼을 누르면 ajax로 bookcontroller 전송
			var bookNo = 0;
			var bookMemNo = $('#bookMemNo').val();
			var bookHouseNo = $('#bookHouseNo').val();
			var checkin = $('#checkIn').val();
			var checkout = $('#checkOut').val();
			var hostCheck = 0;
			var bookMem = $('#bookMem').val();
			var totalPrice = $('#totalPrice').val();
			console.log('bookmemono : '+ bookMemNo);
			if(bookMemNo===null || bookMemNo==='undefined' || bookMemNo===''){ //세션이 없을때,
				//onbeforeunload 
				alert('로그인을 먼저 해주세요');
				preventDefault();
			}
			var obj = {
					'bookNo' : bookNo,
					'bookMemNo': bookMemNo,
					'bookHouseNo': bookHouseNo,
					'checkin': checkin,
					'checkout': checkout,
					'hostCheck': hostCheck,
					'bookMem': bookMem,
					'totalPrice': totalPrice
					
			};
			console.log('obj : ' + obj.toString);
			$.ajax({
				type : 'post',
				url : '/homeshare/book-insert',
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
					$('#bookResult').html('<button type="button">승인대기중</button><br>'
					+ '<button type="button" id="book_cancel">취소하기</button>');
				} //end sucess
			});//end ajax
			return false; // 새로고침 없이
		});//end click;
		
		//end book ajax
		
		//getBookReusult 모든 결과 가져오기 
	
		
	
		
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
		
		
		var houseNo = ${houseVO.houseNo};
		getAllReplies();
		
		 // 댓글 입력 기능
	  	  $('#btn_add').click(function(){
	  		
	  	  	// 댓글 아이디, 댓글 내용의 값을 가져와서
	  	  	// get 방식으로 전송
	  	  	// url : 'localhost:8080/Web10_MVC/replies/add'
	  	  	// data : 게시판 번호, 댓글 내용, 댓글 아이디
	  	  	var content = $('#content').val(); // 댓글 내용 값
	  	  	var memId ='${memId}'; // 댓글 아이디 값
	  	  	var regdate =null;
	  	  	var cleanScore = $('#cleanScore').val(); // 클린점수
	  	  console.log('ceanScope : ' + cleanScore);
	  	  	
	  		var checkinScore = $('#checkinScore').val(); // 클린점수
	  	  	var obj = {
	  			'rno' : 0,
	  	  	    'houseNo' : houseNo,
	  	  		'content' : content,
	  	  		'memId' : memId,
	  	  		'regdate' : null,
	  	  		'score' : 0,
	  	  		'cleanScore' : cleanScore,
	  	  		'checkinScore' : checkinScore
	  	  	}; // end var obj
	  	  	
	  	  	// $.ajax로 송신
	  	  	$.ajax({
	  	  	  type : 'post',
	  	  	  url : '/homeshare/replies',
	  	  	  headers : {
	  	  	    'Content-Type' : 'application/json', 
	  	  	    'X-HTTP-Method-Override' : 'POST'
	  	  	  }, 
	  	  	  data : JSON.stringify(obj),
	  	  	  success : function(result, status){
	  	  	    console.log(result);
	  	  	    console.log(status);
	  	  	    if (result == 1){
	  	  	      alert('댓글 입력 성공');
	  	  	      $('#content').val(''); // 성공메시지 이후 삽입했던 content 데이터 삭제
	  	  	      $('#memId').val(''); // 성공메시지 이후 삽입했던 memid 데이터 삭제
	  	  	      $('#cleanScore').val('');
	  	  	      $('#checkinScore').val('');
	  	  	      getAllReplies(); // 메소드 호출
	  	  	    } // end if()
	  	  	  } // end success
	  	  	  
	  	  	}); // end ajax()
	  	  	
	  	  }); // end btn_add.click()

		function getAllReplies(){
			var url = '/homeshare/replies/all/' + houseNo;
			console.log(url);
			$.getJSON(
					url,
					function(jsonData){  
						var list='';
						var replyCount = jsonData.length;
						console.log("댓글 개수 : " + replyCount);
						$(jsonData).each(
								function(){
									console.log("댓글번호 : " + this.rno);
									
									var date = new Date(this.regdate);
									console.log(date.getFullYear() +"년" + date.getMonth() + "월");		
									console.log(this.memId);
									console.log('${memId}');
									console.log(this.memId=='${memId}');
							
									list += '<div class="reply_item" readonly>'
					  	  		  		+ '<pre>'
					  	  		  		+ '<input type="hidden" id="rno" readonly value="' + this.rno + '" /><br>'
					  	  		  		+ '<input type="text" id="reply_memid" readonly value="' + this.memId + '" />'
					  	  		  		+ '&nbsp;&nbsp;' // 공백
					  	  		  		+ '<input type="text" id="reply_content" value="' + this.content + '" />'
					  	  		  		+ '&nbsp;&nbsp;' // 공백
					  	  		  		+ date.getFullYear() +'년' + date.getMonth() + '월'
					  	  		  		+ '&nbsp;&nbsp;' // 공백
					  	  		  		+ '총별점 '
				  	  		        	+ '<input type="number" min="0" max="5" id="reply_score" readonly  value="' + this.score + '" />'
				  	  		        	+ "청결점수 "
					  	  		  	 	+ '<input type="number" min="0" max="5" id="reply_cleanScore" readonly value="' + this.cleanScore + '"/>'
					  	  		  		+ '&nbsp;&nbsp;' // 공백
					  	  		  		+ '체크인점수'
					  	  		        + '<input type="number" min="0" max="5" id="reply_checkinScore" readonly  value="' + this.checkinScore + '" />'
					  	  		  		
					  	  		  		
					  	  		  		
					  	  		  		if(this.memId==='${memId}'){	
					  	  		  		console.log('this.memid' + this.memId);
					  	  		  		 list += '<button class="btn_update" type="button">수정</button>'	
					  	  		  		+ '&nbsp;'
					  	  		  		+ '<button class="btn_delete" type="button">삭제</button>'
					  	  		  		}
					  	  		  		+ '</pre>' + '<hr>' + '</div>';
								});//end each
								$('#replies').html(list);
								$('#countReply').html(replyCount);
								$('#showReply').click(function(){
									  if($("#replies").css("display") == "none"){   
									        jQuery('#replies').show(); 
									        //$('#showReply').html("숨기기");
									    } else {  
									        jQuery('#replies').hide();  
									        //$('#showReply').html("보이기");
									    }  
								})// end click
					}//end callback
					);// end getJSON
		}//end getAllReplies
		
		  // 수정 버튼 클릭하면 선택된 댓글 수정
	  	  $('#replies').on('click', '.reply_item .btn_update', function(){ // click는 메소드 기능. function은 눌렀을 때 뭘 할것인가
	  	    // console.log(this);
	  	    
	  	    // 선택된 댓글 pre영역의 rno, content 값을 읽음
	  	    var rno = $(this).prevAll('#rno').val(); // this에 update이전 것 중에 rno를 찾겠다
	  	    var content = $(this).prevAll('#reply_content').val();
	  	    console.log("선택된 댓글 번호 : " + rno + ", 댓글 내용 : " + content);
	  	    var cleanScore = $(this).prevAll('#reply_cleanScore').val();
	  	    console.log('reply_cleanScore : ' + cleanScore);
	  		var checkinScore = $(this).prevAll('#reply_checkinScore').val();
	  		console.log('reply_checkinScore : ' + checkinScore);
	  	    var regdate = null;
	  	  // ajax 요청
	  	    $.ajax({
	  	      type : 'put',
	  	      url : '/homeshare/replies/' + rno,
	  	  	  headers : {
	  	  	    'Content-Type' : 'application/json', 
	  	  	    'X-HTTP-Method-Override' : 'PUT'
	  	  	  }, 
	  	      data : JSON.stringify({	  			
	  	        'content' : content,
	  	        'regdate' : 0,
	  	  		'cleanScore' : cleanScore,
	  	  		'checkinScore' : checkinScore
	  	      }),
	  	      success : function(result){
	  	        if(result == 'success'){
	  	          alert('댓글 수정성공');
	  	          
	  	          getAllReplies();
	  	        } // end if()
	  	      }// end success()
	  	      
	  	    }); // end ajax()
	  	  }); // end btn_update.click()
	  	  
	  	 // 삭제 버튼을 클릭하면 선택된 댓글 삭제
	  	  $('#replies').on('click', '.reply_item .btn_delete', function(){ // click는 메소드 기능. function은 눌렀을 때 뭘 할것인가
	  	    // console.log(this);
	  	    
	  	    var rno = $(this).prevAll('#rno').val(); 
	  	     var content = $(this).prevAll('#reply_content').val(); 
	  	    console.log("선택된 댓글 번호 : " + rno + ", 댓글 내용 : " + content);
	  	    
	  	    // ajax 요청
	  	    $.ajax({
	  	      type : 'delete',
	  	      url : '/homeshare/replies/' + rno,
	  	  	  headers : {
	  	  	    'Content-Type' : 'application/json', 
	  	  	    'X-HTTP-Method-Override' : 'DELETE'
	  	  	  }, 
	  	      success : function(result){
	  	        if(result == 'success'){
	  	          alert('댓글 삭제성공')
	  	          getAllReplies();
	  	        } // end if()
	  	      }// end success()
	  	      
	  	    }); // end ajax()
	  	  }); // end btn_delte.click()
	  	  
	  	  
	  	
	});//end document
	
	</script>
</body>
</html>