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
<c:forEach var="list" items="${list}">
<c:if test="${list.PROJUMIN==projectDTO.PROJUMIN}">
<script type="text/javascript">
alert("입력하신 ${projectDTO.PROJUMIN}주민번호가 존재합니다.")
location.href="ProjectInsert";
</script>
</c:if>
</c:forEach>
</head>
<body>
<script type="text/javascript">
alert("등록이 완료되었습니다.")
location.href="./ProjectSelect"
</script>
</body>
</html>