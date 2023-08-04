<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<!-- <link href="resources/css/style.css" rel="stylesheet" type="text/css"> -->
</head>
<body>
<h1>상세보기</h1>
<table>
<thead>
<tr>
<th>순번</th><th>사용내역</th><th>사용일</th><th>사용금액</th><th>승인금액</th><th>처리상태</th><th>등록일</th><th>영수증</th><th>처리일시</th><th>비고</th>
</tr>
</thead>
<tbody>
<tr>
<td>${dto.expense_no}</td>
<td>${dto.name}</td>
<td>${dto.use_date}</td>
<td>${dto.use_price}</td>
<td>${dto.approve_price}</td>
<td>${dto.process_status}</td>
<td>${dto.registration_date}</td>
<td>${dto.receipt}</td>
<td>${dto.process_date}</td>
<td>${dto.remark }</td>
</tr>
</tbody>
</table>
</body>
</html>