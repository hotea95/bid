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

<c:forEach var="list" items="${MemberInfo}">
<c:if test="${list.STHKORNAME==memberDTO.STHKORNAME}">
<c:if test="${list.STHJUMIN==memberDTO.STHJUMIN}">
<script type="text/javascript">
alert("입력하신 사원이 존재합니다.")
location.href="MemberInsert";
</script>
</c:if>
</c:if>
</c:forEach>
</head>
<body>
<script type="text/javascript">
alert("등록을 완료하였습니다.")
location.href="./listSearch"
</script>
</body>
</html>