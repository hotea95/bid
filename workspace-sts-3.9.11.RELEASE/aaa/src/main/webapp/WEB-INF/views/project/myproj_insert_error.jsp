<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
</head>
<body>
    <h1>프로젝트 등록 중 오류가 발생했습니다.</h1>

    <%-- 에러 메시지 표시 --%>
    <p>${errorMessage}</p>
    <script type="text/javascript">
    alert("이미 등록된 프로젝트입니다.");
    location.href="Myproinsert";
    </script>
  

    <%-- 필요한 경우 추가적인 안내나 버튼 등을 작성하세요 --%>

</body>
</html>
