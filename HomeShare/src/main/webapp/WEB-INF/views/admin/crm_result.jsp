<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>
<%@ include file="../cdn.jspf"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${membervo }
	<h1>검색결과</h1>

	
	<table class="table table-hover table-bordered">
  	<thead>
  	      <tr>
          <th>회원번호</th>
          <th>아이디</th>
          <th>이름</th>
          <th>이메일</th>
          <th>전화번호</th>
          <th>성별</th>
          <th>수정</th>
          <th>삭제</th>
        </tr>
  	</thead>
  	<tbody>
  	<c:if test="${membervo ne null }">
  	<td class="memNo"><c:out value="${membervo.memNo}"/></td>
  	<td class="memId"><c:out value="${membervo.memId}"/></td>
  	<td class="memName"><c:out value="${membervo.memName}"/></td>
  	<td class="email"><c:out value="${membervo.email}"/></td>
  	<td class="phone"><c:out value="${membervo.phone}"/></td>
  	<td class="gender"><c:out value="${membervo.gender}"/></td>
  	<td ><button class="btnupdate btn">수정하기</button></td>
  	<td ><button class="btndelete btn">삭제하기</button></td>
  	
  	</c:if>
  	
  	
  	
  	<c:forEach var="vo" items="${memberList }">
  	<tr>
  	<td>${vo.memNo }</td>
  	<td>${vo.memId }</td>
  	<td>${vo.memName }</td>
  	<td>${vo.email }</td>
  	<td>${vo.gender }</td>
  	<td><button type="submit" class="btn btn-default">수정하기</button></td>
  	<td><button type="submit" class="btn btn-default">삭제하기</button></td>
  	
  	
  	</tr>
  	</c:forEach>
  	</tbody>
	</table>

	
	<nav>
    <ul class="pagination border">
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
  </nav>
  <form id="pagingForm" style="display: none;">
      <input type="text" name="page" value="${pageMaker.criteria.page }">
      <input type="text" name="orderby" value="${orderby }">
    </form>
  <script type="text/javascript">
  
  $(document).ready(function(){
	  $('.btndelete').click(function(){
		  var memNo = $(this).parent().siblings('.memNo').html();
		  console.log('memNo : ' + memNo);
	  });
	  
	  
	  
	  //페이징 처리
	    $('.pagination li a').click(function() { 
	    	 event.preventDefault(); 
	    	 var targetPage = $(this).attr('href'); // a 태그 href 속성의 값을 저장
	   	    console.log(targetPage);
	    	 
	   	  var frm = $('#pagingForm'); // form의 정보를 frm에 저장
	  	    frm.find('[name="page"]').val(targetPage); // name="page"를 찾아서 value=targetPage를 저장
	  	    frm.find('#orderby').val($('#orderby'));// orderby에 crm orderby 추가
	  	    frm.attr('action', 'crm_result'); // form에 action 속성 추가
	  	    frm.attr('method', 'get'); // form에 method 속성 추가
	  	    frm.submit(); // form 데이터 전송 
	    }); //end paging
  });//end document
  
  </script>
</body>
</html>