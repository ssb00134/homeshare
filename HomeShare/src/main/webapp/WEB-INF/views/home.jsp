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
	<c:if test="${not empty memId }">
	${memId }님, 환영합니다. <br>
		<button id="btn_logout" type="button"></button>
	</c:if>

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
					<div class="form-group">
						<div id="hostbook"></div>
					</div>
				</div>
			</div>
	</form>


	<%@ include file="navheader.jspf"%>

	<br>
	<br>
	<%@ include file="section.jspf"%>
	<br>
	<br>
	<h1>왜 HomeShare에서 예약을 해야 할까요?</h1>
	<div class="container-fluid row " style="border: 1px solid grey">

		<div class="row col-md-4" style="border: 1px solid grey">
			<img src="/homeshare/display/starscore.png" class="img-fluid"
				height="50%" />
			<div>트립어드바이저의 유용한 전 세계 여행자 커뮤니티 덕분에 최고의 상품을 예약할 수 있습니다</div>
		</div>


		<div class="row col-md-4" style="border: 1px solid grey">
			<img src="/homeshare/display/timeicon.png" class="img-fluid"
				height="50%" />
			<p>24시간 전까지 자유롭게 취소 가능 계획이 변경되었나요? 문제없습니다. 체험 시작 최대 24시간 전까지 변경
				또는 취소하세요</p>
		</div>

		<div class="row col-md-4" style="border: 1px solid grey">
			<img src="/homeshare/display/lowpriceicon.png" class="img-fluid"
				height="50%" />
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

		}); // end document
	</script>
</body>

</html>