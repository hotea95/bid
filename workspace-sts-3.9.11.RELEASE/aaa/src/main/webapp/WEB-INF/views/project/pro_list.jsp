<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		table {
			width: 75%;
			text-align: center;
			border-collapse: collapse;
		}
		th, td {
			padding: 10px;
			border: 1px solid black;
		}
		thead {
			background-color: lightgray;
		}
	</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/side.jsp" %>
<H1>프로젝트 참여 여부</H1>
<table>
<thead>
<tr>
<th>번호</th><th>프로젝트 번호</th><th>시작</th><th>종료</th><th>역할</th><th>프로젝트명</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.NO}</td>
<td>${list.PNO}</td>
<td>${list.STMDATE}</td>
<td>${list.ENDMDATE}</td>
<td>${list.ROLE}</td>
<td>${list.PRONAME}</td>
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