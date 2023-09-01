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
<th>BNO</th>
<th>RNO</th>
<th>ID</th>
<th>CONTENT</th>
<th>PARENT_RNO</th>
</tr>
</thead>
<tbody>
<tr>
<td>${list.BNO}</td>
<td>${list.RNO}</td>
<td>${list.ID}</td>
<td>${list.CONTENT}</td>
<td>${list.PARENT_RNO}</td>
</tr>
</tbody>
</table>
</body>
</html>