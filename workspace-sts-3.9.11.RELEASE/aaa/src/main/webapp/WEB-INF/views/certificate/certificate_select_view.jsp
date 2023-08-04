<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
</head>
<body>
<h1>자격증 상세보기</h1>
<table class="SCHBOR">
<thead>
<tr>
<th>사원명</th> <th>주민등록번호</th><th>자격증명</th><th>취득일</th><th>보유기술</th><th>숙련도</th>
</tr>
</thead>
<tbody>
<tr>
<td class="BOR2">${certificateDTO.CERNAME}</td>
<td class="BOR2">${certificateDTO.CERJUMIN}</td>
<td class="BOR2">${certificateDTO.CERCER}</td>
<td class="BOR2">${certificateDTO.CERDATE}</td>
<td class="BOR2">${certificateDTO.CERSKILL}</td>
<td class="BOR2">${certificateDTO.CERPRO}</td>
</tr>
</tbody>
</table>
<a href="./CertificateUpdate?CERJUMIN=${certificateDTO.CERJUMIN}">
수정 </a>
<a href="./CertificateDelete?CERJUMIN=${certificateDTO.CERJUMIN}">
삭제 </a>
</body>
</html>