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
<%@ include file="header.jspf"%>
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
          <input class = "imgSource"  type="hidden" value="${vo.image }" /><br>
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
  		
  		
  		$('.house_list_item').each(function (index, element) { 
  			$(element).find('ul').attr('id',index);
  		
  		//이미지 출력기능
  			var imgSource = $(this).children('input').val();

  			console.log('imgSource : ' + imgSource);
  			var imgsplit = imgSource.split(',');
  			console.log(imgsplit);
  			var list='';
  			imgsplit.forEach(function(index){
  			    if(imgsplit[imgsplit.length-1] != index){
  			    	console.log("index : " + index);
  				    list += '<li><img width="100" height="100" src="/homeshare/display?fileName=' + index + '" alt="' + index.length + '"></li>';
  			    }
  			});
  			$(element).find('ul').html(list);
  		});

  	//bxslider	
  	 $('.bxslider').bxSlider();

  		
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



