<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>자격증 삭제</title>
</head>
<body>
<div style="float: left;" style="width:400px;" style="height:800px;">
<p><img style="width:100px;" src="resources/img/title.gif"></p>
<label for="label">■ 기본정보</label><br>
<button type="button" style="border: none; background-color: transparent;" onclick="location.href='./MemberInsert'">  - 등록</button><br>
<button type="button" style="border: none; background-color: transparent;">■ 직원명부</button><br>
<button type="button" style="border: none; background-color: transparent;" onclick="location.href='./Retirement'">■ 퇴직자현황</button><br>
<button type="button" style="border: none; background-color: transparent;" onclick="location.href='./Preliminary'">■ 예비 인력정보</button><br><br><br>
<label for="label2">■ 거래처 정보</label><br>
<button type="button" style="border: none; background-color: transparent;">  - 등록</button><br><br>
<fieldset>
<label for="label3">진행 프로젝트 현황</label><br>
</fieldset><br>
<fieldset>
<label for="label4">■ 경력검색</label><br>
<input type="text" style="width : 60px;">
<button type="button">검색</button>
</fieldset>
</div>
<h1>자격증 삭제</h1>
<form action="./CertificateDelete" method="post">
<label for="CERNAME">사원명</label>
<input type="text" name="CERNAME" id="CERNAME" value="${certificateDTO.CERNAME}">
<br>
<label for="CERJUMIN">주민등록번호</label>
<input type="text" name="CERJUMIN" id="CERJUMIN">-<input type="text" name="STHJUMIN" id="STHJUMIN">

<div style="text-align: center;">
<button type="submit" style="WIDTH:60pt; HEIGHT:30pt;">삭제 </button>
<button type="reset" style="WIDTH:60pt; HEIGHT:30pt;">취소 </button>
</div>
</form>
</body>
</html>