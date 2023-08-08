<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
<thead>
<tr>
<th>프로젝트번호</th><th>시작날짜</th><th>종료날짜</th><th>프로젝트이름</th>
</tr>
</thead>
<tbody>
<tr>
<td>${list.PNO }</td>
<td>${list.STDATE }</td>
<td>${list.ENDDATE }</td>
<td>${list.PRONAME }</td>
</tr>
</tbody>
</table>
</body>
</html>