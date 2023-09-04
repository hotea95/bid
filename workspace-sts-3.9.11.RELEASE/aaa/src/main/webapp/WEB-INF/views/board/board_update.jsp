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
<h1>게시물 수정</h1>
<form action="./BoardUpdate" method="post">
<c:set var="loggedInID" value="${sessionScope.ID}" />
<input type="text" id="BNO" name="BNO" value="${list.BNO }">
<label for="TITLE">제목</label>
<input type="text" id="TITLE" name="TITLE" value="${list.TITLE }"> <br>
<label for="CONTENT">내용</label>
<textarea rows="10" cols="10" id="CONTENT" name="CONTENT">${list.TITLE }</textarea> <br>
<label for="WRITER">작성자</label>
<input type="text" id="WRITER" name="WRITER" value="${loggedInID}" readonly="readonly">
<input type="text" id="REG_DATETIME" name="REG_DATETIME"> <br>
<button type="submit">작성</button>
<button type="reset">취소</button>
</form>
</body>
</html>