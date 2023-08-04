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
				<th>회사명</th>
				<th>직위</th>
				<th>기간</th>
				<th>담당업무</th>
				<th>회사명</th>
				<th>직위</th>
				<th>기간</th>
				<th>담당업무</th>
				<th>회사명</th>
				<th>직위</th>
				<th>기간</th>
				<th>담당업무</th>
				<th>회사명</th>
				<th>직위</th>
				<th>기간</th>
				<th>담당업무</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.CARNAME}</td>
					<td>${list.CARJUMIN}</td>
					<td>${list.CARCOM}</td>
					<td>${list.CARPOS}</td>
					<td>${list.CARDATE}</td>
					<td>${list.CARIN}</td>
					<td>${list.CARCOM2}</td>
					<td>${list.CARPOS2}</td>
					<td>${list.CARDATE2}</td>
					<td>${list.CARIN2}</td>
					<td>${list.CARCOM3}</td>
					<td>${list.CARPOS3}</td>
					<td>${list.CARDATE3}</td>
					<td>${list.CARIN3}</td>
					<td>${list.CARCOM4}</td>
					<td>${list.CARPOS4}</td>
					<td>${list.CARDATE4}</td>
					<td>${list.CARIN4}</td>
					<td><a href="./CareerSelect?CARJUMIN=${list.CARJUMIN}">내용상세보기</a></td>
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