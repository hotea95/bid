<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="BoardInsert" method="POST">
<input type="hidden" id="BNO" name="BNO">
<label for="TITLE">제목</label>
<input type="text" id="TITLE" name="TITLE">
<label for="CONTENT">내용</label>
<input type="text" id="CONTENT" name="CONTENT">
<label for="WRITER">작성자</label>
<input type="text" id="WRITER" name="WRITER">
<input type="hidden" id="REG_DATETIME" name="REG_DATETIME">
<button type="submit">작성</button>
<button type="reset">취소</button>
</form>
</body>
</html>