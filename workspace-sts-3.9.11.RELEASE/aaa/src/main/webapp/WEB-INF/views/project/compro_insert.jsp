<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>프로젝트 등록</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
  }

  h1 {
    color: #333;
    border-bottom: 2px solid #333;
    padding-bottom: 10px;
  }

  form {
    max-width: 400px;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border: 1px solid #ccc;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
  }

  label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
  }

  input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
   input[type="date"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  button[type="submit"], button[type="reset"] {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    color: #fff;
  }

  button[type="submit"] {
    background-color: #007bff;
  }

  button[type="reset"] {
    background-color: #dc3545;
    margin-left: 10px;
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $(function() {
    $("#STDATE").datepicker();
    $("#ENDDATE").datepicker();
  });
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/side.jsp" %>
<h1>프로젝트 등록</h1>
<form action="/Comproinsert" method="post" onsubmit="return checks();">
  <label for="PRONAME">프로젝트 명</label>
  <input type="text" id="PRONAME" name="PRONAME" maxlength="20"> <br>
  <label for="STDATE">시작 날짜</label>
  <input type="date" id="STDATE" name="STDATE" max="9999-12-31"> <br>
  <label for="ENDDATE">철수 날짜</label>
  <input type="date" id="ENDDATE" name="ENDDATE" max="9999-12-31"> <br>
  <button type="submit" style="text-align: center;">작성</button>
  <button type="reset" style="text-align: center;">취소</button>
</form>
</body>
</html>
