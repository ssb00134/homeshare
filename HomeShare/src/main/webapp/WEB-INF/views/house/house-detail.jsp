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
	
	<%@ include file="../header.jspf"%>
	<hr>
	인원 ${houseVO.maxCapacity }명 · 침실 ${houseVO.bedroom }개 · 욕실
	${houseVO.bathroom }개
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
		리플 보이기
		<div id = "replies" style="display:none " />
	</div>

	
	<script type="text/javascript">
	$(document).ready(function(){
		var houseNo = ${houseVO.houseNo};
		getAllReplies();

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
									console.log(this.memId==='${memId}');
							
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
					  	  		  		if(this.memId==='${memId}'){					  	  		  			
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
	});//end document
	
	</script>
</body>
</html>