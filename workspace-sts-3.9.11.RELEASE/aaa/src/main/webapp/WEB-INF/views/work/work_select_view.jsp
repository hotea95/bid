<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>근무정보 상세보기</h1>
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
				<tr>
					<td>${workDTO.WORKNAME}</td>
					<td>${workDTO.WORKJUMIN}-${workDTO.WORKJUMIN2}</td>
					<td>${workDTO.WORKPRO}</td>
					<td>${workDTO.WORKPLA}</td>
					<td>${workDTO.WORKST}</td>
					<td>${workDTO.WORKEND}</td>
					<td>${workDTO.WORKSAL}</td>
					<td>${workDTO.WORKSCH}</td>
					<td>${workDTO.WORKDATE}</td>
					<td>${workDTO.WORKCLI}</td>
				</tr>
		</tbody>
	</table>
<a href="./WorkUpdate?WORKJUMIN=${workDTO.WORKJUMIN}">
수정 </a>

</body>
</html>