<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<body>
<h1>거래처 정보 상세보기</h1>
<table>
		<thead>
			<tr>
				<th>상호명</th>
				<th>사업자 등록번호</th>
				<th>대표자 이름</th>
				<th>업종</th>
				<th>업태</th>
				<th>사업장 주소</th>
				<th>전화번호</th>
				<th>팩스번호</th>
				<th>담당자</th>
				<th>핸드폰 번호</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>${clientDTO.CLINAME}</td>
					<td>${clientDTO.CLIRE}</td>
					<td>${clientDTO.CLIREP}</td>
					<td>${clientDTO.CLIBU}</td>
					<td>${clientDTO.CLIONE}</td>
					<td>${clientDTO.CLIADD}</td>
					<td>${clientDTO.CLINUM}</td>
					<td>${clientDTO.CLIFAX}</td>
					<td>${clientDTO.CLIPER}</td>
					<td>${clientDTO.CLIPHONE}</td>
				</tr>
		</tbody>
	</table>
<a href="./ClientUpdate?CLINAME=${clientDTO.CLINAME}">
수정 </a>
</body>
</html>