<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- bxslider -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/> 
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<meta charset="UTF-8">
<title>게시판 메인 페이지</title>
</head>
<body>

<!-- 헤더정보 가져오기 -->
<%@ include file="../header.jspf"%>
  <h1>검색결과</h1>
  <hr>
  <br>
  <div id="house-lists">
      <c:forEach var="vo" items="${houseList }">
        <div class = "house_list_item" id ="${vo.houseNo }">
          <div>번호${vo.houseNo }</div>
          <div>title : ${vo.title}</div>
          <div>${vo.price}$</div>
          <div>${vo.scope}</div>
          <div>${vo.location}</div>
          <input class = "imgSource" id="items" type="hidden" value="${vo.image }" /><br>
		  <!-- 이미지슬라이더 -->
		  <div class="home__slider">
			<ul class="bxslider"></ul>
		 </div>
		  </div>
          <hr>
        
      </c:forEach>
 	</div>

  <hr>
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
        <li><a href="${pageMaker.endPageNo + 1}" >다음</a></li>
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
  	$(document).ready(function(){
  		
  		$('.bxslider').bxSlider({
  		   autoplay:true, //자동실행
  		    arrows:true, //좌우화살표끄기
  		    dots:true, //페이지버튼나오기
  		    swipe:false, //마우스드래그 이동 끄기
  		    pauseOnHover:false, //마우스올렸을때 멈춤기능 끄기
  		    slidesToShow:1, //보여질 썸네일 갯수,한번에 보여줄 슬라이드 개수
  		    slidesToScroll:1, // 스크롤되는 썸네일 갯수,2는 2개씩 1은 1개씩
  		    autoplaySpeed:2000 //자동으로 실행되어지느 시간
  			});
  		
  		
  		$(".bx-stop").click(function(){	// 중지버튼 눌렀을때	
  			$('.bxslider').stopAuto();
  			$(".bx-stop").hide();
  			$(".bx-start").show();
  			return false;
  		});
  		

  		$(".bx-start").click(function(){	//시작버튼 눌렀을때
  			$('.bxslider').startAuto();
  			$(".bx-start").hide();
  			$(".bx-stop").show();
  			return false;
  		});

  		
  		$('.house-house_list_item').each(function () { 
  			console.log("each 값 : " + $(this));
  		});

  		
		//이미지 출력기능
		var imgSource = $('.imgSource').val();

		console.log('imgSource : ' + imgSource);
		var imgsplit = imgSource.split(',');
		console.log(imgsplit);
		var list='';
		imgsplit.forEach(function(element){
		    if(imgsplit[imgsplit.length-1] != element){
		    	console.log("element : " + element);
			    list += '<li><img src="/homeshare/display?fileName=' + element + '" alt="' + element.length + '"></li>';
		    }
		});
		$('.bxslider').html(list);
		//end img 출력기능

  		
  	  // 클릭한 a태그의 정보를 가져오는 코드
  	  $('.pager li a').click(function() { 
  	    // .pager 클래스의 하위 li 요소의 하위 a 요소를 찾아감
  	    event.preventDefault(); // a 태그의 기본 동작(페이지 이동)을 금지
  	    var targetPage = $(this).attr('href'); // a 태그 href 속성의 값을 저장
  	    console.log(targetPage);
  	    
  	    var frm = $('#pagingForm'); // form의 정보를 frm에 저장
  	    frm.find('[name="page"]').val(targetPage); // name="page"를 찾아서 value=targetPage를 저장
  	    frm.attr('action', 'house-list'); // form에 action 속성 추가
  	    frm.attr('method', 'get'); // form에 method 속성 추가
  	    frm.submit(); // form 데이터 전송 
  	  }); // end click()
  	  
  	  $('.house_list_item').click(function(){
  	    event.preventDefault();
  	    var houseNo = this.id;
  	    console.log(houseNo);
  	    var frm = $('#pagingForm');
  	    frm.attr('action', 'house-detail');
  	    frm.attr('method', 'get');
  	    frm.find('[name="houseNo"]').val(houseNo);
  	    frm.submit(); 
  	  }); // end click()
  	  
  	  // register에서 넘어온 insert_result 데이터를 바탕으로 alert 처리
  	  if ('${insert_result}' === 'success') {
  	    alert('새 글 작성 성공');
  	  } else if ('${insert_result}' === 'fail'){
  	    alert('새 글 작성 실패');
  	  }
  	}); // end document
  </script>
  
</body>
</html>



