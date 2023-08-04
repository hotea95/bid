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
				<th>주민등록번호뒷</th>
				<th>고등학교</th>
				<th>과</th>
				<th>년</th>
				<th>월</th>
				<th>전산원</th>
				<th>과</th>
				<th>년</th>
				<th>월</th>
				<th>전문대학</th>
				<th>과</th>
				<th>년</th>
				<th>월</th>
				<th>대학교</th>
				<th>과</th>
				<th>년</th>
				<th>월</th>
				<th>대학원</th>
				<th>과</th>
				<th>년</th>
				<th>월</th>
				<th>교욱명</th>
				<th>교육시작일</th>
				<th>교육종료일</th>
				<th>교육기관</th>
				<th>교욱명</th>
				<th>교육시작일</th>
				<th>교육종료일</th>
				<th>교육기관</th>
				<th>교욱명</th>
				<th>교육시작일</th>
				<th>교육종료일</th>
				<th>교육기관</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.EDNAME}</td>
					<td>${list.EDJUMIN}</td>
					<td>${list.EDJUMIN2}</td>
					<td>${list.EDSC}</td>
					<td>${list.EDD}</td>
					<td>${list.EDYE}</td>
					<td>${list.EDM}</td>
					<td>${list.EDSC2}</td>
					<td>${list.EDD2}</td>
					<td>${list.EDYE2}</td>
					<td>${list.EDM2}</td>
					<td>${list.EDSC3}</td>
					<td>${list.EDD3}</td>
					<td>${list.EDYE3}</td>
					<td>${list.EDM3}</td>
					<td>${list.EDSC4}</td>
					<td>${list.EDD4}</td>
					<td>${list.EDYE4}</td>
					<td>${list.EDM4}</td>
					<td>${list.EDSC5}</td>
					<td>${list.EDD5}</td>
					<td>${list.EDYE5}</td>
					<td>${list.EDM5}</td>
					<td>${list.EDUCATIONNAME}</td>
					<td>${list.EDST}</td>
					<td>${list.EDEND}</td>
					<td>${list.EDIN}</td>
					<td>${list.EDUCATIONNAME2}</td>
					<td>${list.EDST2}</td>
					<td>${list.EDEND2}</td>
					<td>${list.EDIN2}</td>
					<td>${list.EDUCATIONNAME3}</td>
					<td>${list.EDST3}</td>
					<td>${list.EDEND3}</td>
					<td>${list.EDIN3}</td>
					
					<td><a href="./EducationSelect?EDJUMIN=${list.EDJUMIN}">내용상세보기</a></td>
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