<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="ComproUpdate" method="post">
	<label for="PNO">프로젝트 번호</label>
  <input type="text" id="PNO" name="PNO" value="${list.PNO }"> <br>
  <label for="PRONAME">프로젝트 명</label>
  <input type="text" id="PRONAME" name="PRONAME" value="${list.PRONAME }"> <br>
  <label for="STDATE">시작 날짜</label>
  <input type="date" id="STDATE" name="STDATE" max="9999-12-31" value="${list.STDATE }"> <br>
  <label for="ENDDATE">철수 날짜</label>
  <input type="date" id="ENDDATE" name="ENDDATE" max="9999-12-31" value="${list.ENDDATE }"> <br>
  <button type="submit" style="text-align: center;">작성</button>
  <button type="reset" style="text-align: center;">취소</button>
</form>
</body>
</html>