<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>${houseVO.title }</h1>
	
	
	<hr>
	인원 ${houseVO.maxCapacity }명 · 침실 ${houseVO.bedroom }개 · 욕실
	${houseVO.bathroom }개
	가격 ${houseVO.price } $
	<hr>
	houseVO.info
	<hr>
	<div dir="rtl">
		계산 폼
		<form id="reservationForm"></form>
	</div>

	<!-- 리플 영역 -->
	아이디 ${memId }
	
	
	
	<div id="showReply">
		총 <div id ="countReply"></div>개의 후기가 있습니다.
	</div>
	<div id = "replies" style="display:none " ></div>
	<div>
	<input type="text" id="memId" value="${memId }" >
       <input type="text" id="content" placeholder="댓글 입력" >
 
       <input type="number" min="0" max="5" id="cleanScope">
       <input type="number" min="0" max="5" id="checkinScope">
	 <button type="button" id="btn_add">작성</button>
	</div>
	<hr>
	TODO : 리플의 memid와 세션의 memid가 일치하는지 확인할것
	->프론트엔드에서 막음 
	->서버에서 막기
	<br>
	TODO : 결제한 회원만 리플가능
	

	
	<script type="text/javascript">
	$(document).ready(function(){
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
	  	  	var cleanScope = $('#cleanScope').val(); // 클린점수
	  	  console.log('ceanScope : ' + cleanScope);
	  	  	
	  		var checkinScope = $('#checkinScope').val(); // 클린점수
	  	  	var obj = {
	  			'rno' : 0,
	  	  	    'houseNo' : houseNo,
	  	  		'content' : content,
	  	  		'memId' : memId,
	  	  		'regdate' : null,
	  	  		'scope' : 0,
	  	  		'cleanScope' : cleanScope,
	  	  		'checkinScope' : checkinScope
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
	  	  	      $('#cleanScope').val('');
	  	  	      $('#checkinScope').val('');
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
							
									list += '<div class="reply_item">'
					  	  		  		+ '<pre>'
					  	  		  		+ '<input type="hidden" id="rno" value="' + this.rno + '" /><br>'
					  	  		  		+ '<input type="hidden" id="reply_memid" value="' + this.memId + '" /><br>'
					  	  		  		+ this.memId
					  	  		  		+ '&nbsp;&nbsp;' // 공백
					  	  		  		+ '<input type="text" id="reply_content" value="' + this.content + '" />'
					  	  		  		+ '&nbsp;&nbsp;' // 공백
					  	  		  		+ date.getFullYear() +'년' + date.getMonth() + '월'
					  	  		  		+ '&nbsp;&nbsp;' // 공백
					  	  		  		+ '총별점 '
				  	  		        	+ '<input type="number" min="0" max="5" id="reply_scope" readonly  value="' + this.scope + '" />'
				  	  		        	+ "청결점수 "
					  	  		  	 	+ '<input type="number" min="0" max="5" id="reply_cleanScope" value="' + this.cleanScope + '"/>'
					  	  		  		+ '&nbsp;&nbsp;' // 공백
					  	  		  		+ '체크인점수'
					  	  		        + '<input type="number" min="0" max="5" id="reply_checkinScope" value="' + this.checkinScope + '" />'
					  	  		  		
					  	  		  		
					  	  		  		
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
	  	    var cleanScope = $(this).prevAll('#reply_cleanScope').val();
	  	    console.log('reply_cleanScope : ' + cleanScope);
	  		var checkinScope = $(this).prevAll('#reply_checkinScope').val();
	  		console.log('reply_checkinScope : ' + checkinScope);
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
	  	  		'cleanScope' : cleanScope,
	  	  		'checkinScope' : checkinScope
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