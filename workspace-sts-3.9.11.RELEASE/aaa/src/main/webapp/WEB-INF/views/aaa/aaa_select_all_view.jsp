<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
</head>
<body>
<h1>테스틍</h1>
<table>
<thead>
<tr>
<th> 1번쨰</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.aaa}</td>

</tr>
</c:forEach>
<c:if test="${empty list}">
<tr>
<td>등록된 부서가 없습니다.</td>
</tr>
</c:if>
</tbody>
</table>

</body>
</html>