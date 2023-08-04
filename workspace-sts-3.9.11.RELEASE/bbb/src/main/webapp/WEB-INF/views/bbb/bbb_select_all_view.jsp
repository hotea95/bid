<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체보기</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<!-- <link href="resources/css/style.css" rel="stylesheet" type="text/css"> -->
</head>
<body>
<table>
<thead>
<tr>
<th>순번</th><th>사용일</th><th>사용내역</th><th>사용금액</th><th>승인금액</th><th>처리상태</th><th>등록일</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${list}">

<tr>
<td>${list.expense_no}</td>
<td>${list.use_date}</td>
<td><a href="./Update?expense_no=${list.expense_no}">${list.name}</a></td>
<td>${list.use_price}</td>
<td>${list.approve_price}</td>
<td>${list.process_status}</td>
<td>${list.registration_date}</td>
</tr>
</c:forEach>
<c:if test="${empty list}">
<tr>
<td>등록된 정보가 없습니다.</td>
</tr>
</c:if>
</tbody>
</table>
<button type="button" onclick="location.href='./Insert'">등록</button>
</body>
</html>