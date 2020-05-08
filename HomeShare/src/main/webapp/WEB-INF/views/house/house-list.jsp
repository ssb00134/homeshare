<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table, th, td {
  border-style: solid;
  border-width: 1px;
  text-align: center;
}

ul {
  list-style-type: none;
}

li {
  display: inline-block;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>게시판 메인 페이지</title>
</head>
<body>
  <h1>검색결과</h1>
  <hr>
  <br>
  <div id="house-lists">
      <c:forEach var="vo" items="${houseList }">
        <div class = "house_list_item" id ="${vo.houseNo }">
          <div>${vo.houseNo }</div>
          <div><a class="goToDetail" href="${vo.houseNo }">${vo.title }</a></div>
          <div>${vo.price }</div>
          <hr>
        </div>
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



