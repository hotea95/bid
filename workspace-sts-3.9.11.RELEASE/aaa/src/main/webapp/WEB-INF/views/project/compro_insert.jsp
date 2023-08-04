<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 등록</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 20px;
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
	var PRONAME = RegExp(/^[ㄱ-ㅎ|가-힣]{0,20}$/);
	
	alert("알림");
	if($("#PRONAME").val() == "") {
		alert("프로젝트를 입력해주세요.");
		$("#PRONAME").focus();
		return false;
	}
	if(!PRONAME.test($("#PRONAME").val())){
        alert("한글로만 입력해주세요(~20글자)");
        $("#PRONAME").val("");
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
<form action="/Comproinsert" method="post">
  <label for="PRONAME">프로젝트 명</label>
  <input type="text" id="PRONAME" name="PRONAME"> <br>
  <label for="STDATE">시작 날짜</label>
  <input type="date" id="STDATE" name="STDATE" max="9999-12-31"> <br>
  <label for="ENDDATE">철수 날짜</label>
  <input type="date" id="ENDDATE" name="ENDDATE" max="9999-12-31"> <br>
  <button type="submit" style="text-align: center;">작성</button>
  <button type="reset" style="text-align: center;">취소</button>
</form>
</body>
</html>
