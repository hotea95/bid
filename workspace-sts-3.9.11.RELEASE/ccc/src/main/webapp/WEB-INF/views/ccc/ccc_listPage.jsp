<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>사원조회</h1>
<div id="serch">
<label for="sthman">성&nbsp;&nbsp;별</label>
<input type="text" id="sthman" name="sthman"><br>
<label for="sthyear">연&nbsp;&nbsp;차</label>
<input type="text" id="sthyear" name="sthyear"><br>
<label for="sthaddres">주&nbsp;&nbsp;소</label>
<input type="text" id="sthaddres" name="sthaddres"><br>
<button type="button">버튼</button>
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
     <li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if>   
    
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
     <li><a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>
      
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
     <li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if>   
   </ul>
</div>
</body>
</html>