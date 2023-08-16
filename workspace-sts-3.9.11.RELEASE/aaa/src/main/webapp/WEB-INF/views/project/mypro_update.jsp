<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script type="text/javascript">

function checks() {
	var ROLE = RegExp(/^[ㄱ-ㅎ|가-힣]{2,10}$/);
	
	if($("#ROLE").val() == "") {
		alert("역할을 입력바랍니다.");
		$("#ROLE").focus();
		return false;
	}
	if(!ROLE.test($("#ROLE").val())){
        alert("한글로만 입력해주세요(2~10글자)");
        $("#ROLE").val("");
        $("#ROLE").focus();
        return false;
      }
	
	if($("#STMDATE").val() == "") {
		alert("시작날짜를 입력해주세요.");
		$("#STMDATE").focus();
		return false;
	}
	
	if($("#ENDMDATE").val() == "") {
		alert("철수날짜를 입력해주세요.");
		$("#ENDMDATE").focus();
		return false;
	}
	
	 // 시작 날짜와 철수 날짜 비교
    var startDate = new Date($("#STMDATE").val());
    var endDate = new Date($("#ENDMDATE").val());

    if (endDate < startDate) {
        alert("시작날짜가 철수날짜보다 앞에 있어야 합니다.");
        $("#ENDMDATE").focus();
        return false;
    }
    
    return true;
}

</script>
<meta charset="UTF-8">
<title>My Project Update</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f7f7f7;
    }
    
    #container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
        box-sizing: border-box;
    }
    
    h1 {
        text-align: center;
        margin-bottom: 20px;
    }
    
    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }
    
    input[type="text"],
    input[type="date"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 3px;
        font-size: 16px;
        box-sizing: border-box;
    }
    
    button[type="submit"],
    button[type="reset"] {
        display: inline-block;
        padding: 10px 20px;
        font-size: 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        margin-right: 10px;
    }
    
    button[type="reset"] {
        background-color: #f44336;
    }
    
    button[type="submit"]:hover,
    button[type="reset"]:hover {
        background-color: #45a049;
    }
</style>

</head>
<body>
<%@ include file="/WEB-INF/views/include/side.jsp" %>
<div id="container">
    <h1>프로젝트 업데이트</h1>
    <form action="MyproUpdate" method="post" onsubmit="return checks()">
        <label for="NO">사원번호</label>
        <input type="text" id="NO" name="NO" value="${param.NO}" readonly="readonly">
        <label for="PNO">프로젝트번호</label>
        <input type="text" id="PNO" name="PNO" value="${param.PNO}" readonly="readonly">
        <label for="STMDATE">시작날짜</label>
        <input type="date" id="STMDATE" name="STMDATE" value="${list.STMDATE}" max="9999-12-31">
        <label for="ENDMDATE">종료날짜</label>
        <input type="date" id="ENDMDATE" name="ENDMDATE" value="${list.ENDMDATE}" max="9999-12-31">
        <label for="ROLE">역할</label>
        <input type="text" id="ROLE" name="ROLE" value="${list.ROLE}">
        <label for="PRONAME">프로젝트 이름</label>
        <input type="text" id="PRONAME" name="PRONAME" value="${list.PRONAME}" readonly="readonly">
        <button type="submit">작성</button>
        <button type="reset">취소</button>
    </form>
</div>
</body>
</html>
