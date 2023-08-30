<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/include/side.jsp" %>
<H1>공지사항 상세보기</H1>
<h2>${list.TITLE}</h2>
<span>${list.WRITER}</span>
<span>${list.REG_DATETIME}</span><br><br>
<span>${list.CONTENT}</span>
</body>
</html>