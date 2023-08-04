<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
		<thead>
			<tr>
				<th>사원명</th>
				<th>주민등록번호</th>
				<th>프로젝트명</th>
				<th>근무장소</th>
				<th>근무시작일</th>
				<th>근무종료일</th>
				<th>매출액</th>
				<th>결제예정일</th>
				<th>결제일</th>
				<th>거래처</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.WORKNAME}</td>
					<td>${list.WORKJUMIN}</td>
					<td>${list.WORKPRO}</td>
					<td>${list.WORKPLA}</td>
					<td>${list.WORKST}</td>
					<td>${list.WORKEND}</td>
					<td>${list.WORKSAL}</td>
					<td>${list.WORKSCH}</td>
					<td>${list.WORKDATE}</td>
					<td>${list.WORKCLI}</td>
					<td><a href="./WorkSelect?WORKJUMIN=${list.WORKJUMIN}">내용상세보기</a></td>
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