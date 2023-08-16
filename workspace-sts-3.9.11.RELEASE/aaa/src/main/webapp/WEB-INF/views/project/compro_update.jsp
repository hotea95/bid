<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>Project Update</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
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
    
    form {
        display: grid;
        gap: 10px;
    }
    
    label {
        display: block;
        font-weight: bold;
    }
    
    input[type="text"],
    input[type="date"] {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 3px;
        font-size: 16px;
        box-sizing: border-box;
    }
    
    button[type="submit"],
    button[type="reset"] {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }
    
    button[type="reset"] {
        background-color: #f44336;
        margin-right: 10px;
    }
    
    button[type="submit"]:hover,
    button[type="reset"]:hover {
        background-color: #45a049;
    }
</style>
<script type="text/javascript">

function checks() {
	//var PRONAME = /^[\uac00-\ud7a3]{0,20}$/;
	
	if($("#PRONAME").val() == "") {
		alert("프로젝트를 입력해주세요.");
		$("#PRONAME").focus();
		return false;
	}
	  var PRONAME = $("#PRONAME").val();
	    if (PRONAME.length === 0 || PRONAME.length > 20) {
	        alert("프로젝트 명은 1자 이상 20자 이하로 입력해주세요.");
	        $("#PRONAME").focus();
	        return false;
	    }
	if($("#STDATE").val() == "") {
		alert("시작날짜를 입력해주세요.");
		$("#STDATE").focus();
		return false;
	}
	
	if($("#ENDDATE").val() == "") {
		alert("철수날짜를 입력해주세요.");
		$("#ENDDATE").focus();
		return false;
	}
	
	 // 시작 날짜와 철수 날짜 비교
    var startDate = new Date($("#STDATE").val());
    var endDate = new Date($("#ENDDATE").val());

    if (endDate < startDate) {
        alert("시작날짜가 철수날짜보다 앞에 있어야 합니다.");
        $("#ENDDATE").focus();
        return false;
    }
    
	return true;
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/side.jsp" %>
<div id="container">
    <h1>프로젝트 업데이트</h1>
    <form action="ComproUpdate" method="post" onsubmit="return checks();">
        <label for="PNO">프로젝트 번호</label>
        <input type="text" id="PNO" name="PNO" value="${list.PNO }" readonly="readonly">
        <label for="PRONAME">프로젝트 명</label>
        <input type="text" id="PRONAME" name="PRONAME" value="${list.PRONAME }" readonly="readonly">
        <label for="STDATE">시작 날짜</label>
        <input type="date" id="STDATE" name="STDATE" max="9999-12-31" value="${list.STDATE }">
        <label for="ENDDATE">철수 날짜</label>
        <input type="date" id="ENDDATE" name="ENDDATE" max="9999-12-31" value="${list.ENDDATE }">
        <div style="text-align: center;">
            <button type="submit">작성</button>
            <button type="reset">취소</button>
        </div>
    </form>
</div>
<script>
    // JavaScript 코드
</script>
</body>
</html>
