<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<h1>사원조회</h1>
<div class="search">
<input type="text" value="성별" readonly="readonly" style="border: none; background-color: transparent;"> 
<input type="hidden" value="m" id="searchTypeMan" name="searchTypeMan">
<input type="text" name="keywordMan" id="keywordMan" class="INPUT"><br>

<input type="text" value="연차" readonly="readonly" style="border: none; background-color: transparent;">
<input type="hidden" value="y" id="searchTypeYear" name="searchTypeYear">
<input type="text" name="keywordYear" id="keywordYear" class="INPUT"> <br>

<input type="text" value="주소" readonly="readonly" style="border: none; background-color: transparent;">
<input type="hidden" value="a" id="searchTypeAdd" name="searchTypeAdd">
<input type="text" name="keywordAdd" id="keywordAdd" class="INPUT"> <br>

<%--    <select name="searchType">
    <option value="m"<c:out value="${scri.searchType eq 'm' ? 'selected' : ''}"/>>성별</option>
    <option value="y"<c:out value="${scri.searchType eq 'y' ? 'selected' : ''}"/>>연차</option>
    <option value="a"<c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>주소</option>
   </select>
   
   <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/> --%>

   <button id="searchBtn">검색</button>
   
  <script>
 $(function(){
  $('#searchBtn').click(function() {
   self.location = "listSearch"
     + '${pageMaker.makeQuery(1)}'
     + "&searchTypeMan="
     + $("#searchTypeMan").val()
     + "&keywordMan="
     + encodeURIComponent($('#keywordMan').val())
     + "&searchTypeYear="
     + $("#searchTypeYear").val()
     + "&keywordYear="
     + encodeURIComponent($('#keywordYear').val())
     + "&searchTypeAdd="
     + $("#searchTypeAdd").val()
     + "&keywordAdd="
     + encodeURIComponent($('#keywordAdd').val());
    });
 });   
 </script>
</div>
<div>
<table>
<thead>
<tr>
<th>이름</th><th>주민번호</th><th>성별</th><th>기술등급</th><th>상태</th><th>근무형태</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.STHKORNAME}</td>
<td>${list.STHJUMIN}-${list.STHJUMIN2}</td>
<td>${list.STHMAN}</td>
<td>${list.STHSKILL}</td>
<td>${list.STHSTATE}</td>
<td>${list.STHSISM}</td>
</tr>
</c:forEach>
<c:if test="${empty list}">
<tr>
<td>등록된 정보가 없습니다.</td>
</tr>
</c:if>
</tbody>
</table>
</div>


<button onclick="location.href='./Insert'">작성하러가기</button>
<div>
   <ul>
    <c:if test="${pageMaker.prev}">
     <li><a href="listSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if>   
    
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
     <li><a href="listSearch${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>
      
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
     <li><a href="listSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if>   
   </ul>
</div>
</body>
</html>