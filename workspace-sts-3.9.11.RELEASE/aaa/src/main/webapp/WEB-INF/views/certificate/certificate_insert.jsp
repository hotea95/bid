<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>자격증 작성</title>
<script>
				$(function() {
					$('#searchBtn').click(
			function() {
				self.location = "listSearch"
						+ "?page=1&perPageNum=10"
						+ "&searchType=y"
						+ "&keyword="
						+ encodeURIComponent($('#keywordInput')
								.val());
							});
				});
			</script>
</head>
<body>
<div style="float: left;" style="width:400px;" style="height:800px;">
		<p>
			<img style="width: 100px;" src="resources/img/title.gif">
		</p>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./listSearch'">■ 기본정보</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./MemberInsert'">- 등록</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./listSearch'">■ 직원명부</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./Retirement'">■ 퇴직자현황</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./Preliminary'">■ 예비 인력정보</button>
		<br> <br>
		<br> <br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./ClientSelectAll'">■ 거래처 정보</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./ClientInsert'">- 등록</button>
		<br> <br>
		<br>
		<fieldset>
			<label for="label3">진행 프로젝트<br>
			<br> 현황
			</label><br>
			<br>
			<br>
		</fieldset>
		<br>

		<fieldset>
			<input type="text" value="■ 경력검색" readonly="readonly"
				style="border: none; background-color: transparent;"> <br>
			<input type="text" name="keyword" id="keywordInput"
				value="${scri.keyword}" style="width: 70px;" />
			<button id="searchBtn">검색</button>
		</fieldset>

	</div>
<h1>자격증·보유기술 정보 작성</h1>
<div style="WIDTH: 700px; text-align: center; float: left: ;">
<fieldset>
<button type="button">기본정보</button>
<button type="button">학력-교욱정보</button>
<button type="button">프로젝트정보</button>
<button type="button">경력정보</button>
<button type="button">근무정보</button>
</fieldset>
</div>
<div>
<form action="./CertificateInsert" method="POST">
<label for="CERNAME">사원명</label>
<input type="text" name="CERNAME" id="CERNAME" value="${MemberInfo.EDNAME}">
<label for="CERJUMIN">주민번호</label>
<input type="text" name="CERJUMIN" id="CERJUMIN" value="${MemberInfo.EDJUMIN}">-<input type="text" name="CERJUMIN2" id="CERJUMIN2" value="${MemberInfo.EDJUMIN2}"><br>
<br><br>
<label>■ 자격증</label><br><br>
<label for="CERCER">&nbsp;자격증명</label>
<input type="text" name="CERCER" id="CERCER">
<label for="CERDATE">&nbsp;&nbsp;&nbsp;취득일</label>
<input type="text" name="CERDATE" id="CERDATE"><br>
<label for="CERCER">&nbsp;자격증명</label>
<input type="text" name="CERCER2" id="CERCER2">
<label for="CERDATE">&nbsp;&nbsp;&nbsp;취득일</label>
<input type="text" name="CERDATE2" id="CERDATE2"><br>
<label for="CERCER">&nbsp;자격증명</label>
<input type="text" name="CERCER3" id="CERCER3">
<label for="CERDATE">&nbsp;&nbsp;&nbsp;취득일</label>
<input type="text" name="CERDATE3" id="CERDATE3"><br>
<label for="CERCER">&nbsp;자격증명</label>
<input type="text" name="CERCER4" id="CERCER4">
<label for="CERDATE">&nbsp;&nbsp;&nbsp;취득일</label>
<input type="text" name="CERDATE4" id="CERDATE4"><br>
<br><br><label>■ 보유기술</label><br><br>
<label for="CERSKILL">&nbsp;보유기술</label>
<input type="text" name="CERSKILL" id="CERSKILL">
<label for="CERPRO">숙련도</label>
<input type="radio" name="CERPRO" id="CERPRO" value="초"> 초
<input type="radio" name="CERPRO" id="CERPRO" value="중"> 중
<input type="radio" name="CERPRO" id="CERPRO" value="고"> 고
<br><br>
<label for="CERSKILL2">&nbsp;보유기술</label>
<input type="text" name="CERSKILL2" id="CERSKILL2">
<label for="CERPRO2">숙련도</label>
<input type="radio" name="CERPRO2" id="CERPRO2" value="초"> 초
<input type="radio" name="CERPRO2" id="CERPRO2" value="중"> 중
<input type="radio" name="CERPRO2" id="CERPRO2" value="고"> 고
<br><br>
<label for="CERSKILL3">&nbsp;보유기술</label>
<input type="text" name="CERSKILL3" id="CERSKILL3">
<label for="CERPRO">숙련도</label>
<input type="radio" name="CERPRO3" id="CERPRO3" value="초"> 초
<input type="radio" name="CERPRO3" id="CERPRO3" value="중"> 중
<input type="radio" name="CERPRO3" id="CERPRO3" value="고"> 고
<br><br>
<label for="CERSKILL4">&nbsp;보유기술</label>
<input type="text" name="CERSKILL4" id="CERSKILL4">
<label for="CERPRO">숙련도</label>
<input type="radio" name="CERPRO4" id="CERPRO4" value="초"> 초
<input type="radio" name="CERPRO4" id="CERPRO4" value="중"> 중
<input type="radio" name="CERPRO4" id="CERPRO4" value="고"> 고
<br><br>
<label for="CERSKILL5">&nbsp;보유기술</label>
<input type="text" name="CERSKILL5" id="CERSKILL5">
<label for="CERPRO">숙련도</label>
<input type="radio" name="CERPRO5" id="CERPRO5" value="초"> 초
<input type="radio" name="CERPRO5" id="CERPRO5" value="중"> 중
<input type="radio" name="CERPRO5" id="CERPRO5" value="고"> 고
<br><br>
<div style="text-align: center;">
<button type="submit" style="WIDTH:60pt; HEIGHT:30pt;">작성</button>
<button type="reset" style="WIDTH:60pt; HEIGHT:30pt;" onclick="location.href='./listSearch'">취소</button>
</div>
</form>
</div>
</body>
</html>