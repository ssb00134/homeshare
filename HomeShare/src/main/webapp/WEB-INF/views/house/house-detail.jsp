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
	<h1><p>${houseVO.title }</p></h1>
	
	
	<hr>
	<span>인원 ${houseVO.maxCapacity }명</span> 
	<span> 침실 ${houseVO.bedroom }개 </span>
	<span> 욕실${houseVO.bathroom }개</span><hr>
	<span> ${houseVO.scope }</span><br>
	<span>편의시설 ${houseVO.utilities }</span><br>
	<span>이용가능시설 ${houseVO.spaces }</span><br>
	<span>가격 ${houseVO.price } </span><br>
	<input id = "imgSource" type="hidden" value="${houseVO.image }" /><br>
	<div id="imgArea"></div>
	<hr>
	houseVO.info
	<hr>
	<div dir="rtl">
		계산 폼
		<form id="bookForm" action="book">
		<div>
		 <input type="text" class="testDatepicker" id="checkIn" name="checkIn" value=""> <br>
		</div>
		임시저장영역<input type="text" id="checkInDate"><br>

		 <div>
		 <input type="text" class="testDatepicker" id="checkOut" name="checkOut">  <br>
		 임시저장영역<input type="text" id="checkOutDate"><br>
		</div>
		날짜차이<input type="text" id="dateDiffer">
		<div id = "hidden">
		<input type="text" name="houseNo" value ="${houseVO.houseNo }">
		<input type="text" name="memNo" value ="${memberVO.memNo }">
		</div>
		<div>
		<div>
		<input type="text" name="bookMem" placeholder="인원">
		</div>
		<input type="number" readonly="readonly" name="price" value="${houseVO.price }">   <br>
		총 합계<input type="number" readonly="readonly" name="totalPrice">  <br>
		<div id="bookdate"></div>
		<br><input type="submit" value="예약하기">
		</div>
		
		</form>
	</div>

	<!-- 리플 영역 -->
	아이디 ${memId }
	
	
	<div id="showReply">
		총 <div id ="countReply"></div>개의 후기가 있습니다.
	</div>
	<div id = "replies" style="display:none " ></div>
	<div>
	<input type="text" id="memId" value="${memId }" readonly >
       <input type="text" id="content" placeholder="댓글 입력" >
 
       <input type="number" min="0" max="5" id="cleanScore" placeholder="청결도(5)">
       <input type="number" min="0" max="5" id="checkinScore" placeholder="체크인점수">
	 <button type="button" id="btn_add">작성</button>
	</div>
	<hr>
	TODO : 리플의 memid와 세션의 memid가 일치하는지 확인할것
	->프론트엔드에서 막음 
	->서버에서 막기
	<br>
	TODO : 결제한 회원만 리플가능
	
	'<img alt="" src=""><br>'
	
	<script type="text/javascript">
	$(document).ready(function(){
		
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
		 
		 $( ".testDatepicker" ).datepicker({
			
			dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
			changeMonth: true, 
	         changeYear: true,
	         nextText: '다음 달',
	         prevText: '이전 달',
        	 minDate : (num2>num1)&&(num3>num1)?num1:(num2>num3?num3:num2),

        	 //최소 예약가능 시간
        	 
       	     maxDate: (new Date('${houseVO.bookableDateEnd}') > $('#checkIn').val() ?
       	    		 new Date('${houseVO.bookableDateEnd}') :  new Date($('#checkIn').val()))
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
		$('#totalPrice').val($('#price') * $('#dateDiffer') * $('#bookMem'));
		if($('#dateDiffer').val()*1 <0 ){
		alsert('불가');
		}
		
		
		
		
		
		
		
	
		
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