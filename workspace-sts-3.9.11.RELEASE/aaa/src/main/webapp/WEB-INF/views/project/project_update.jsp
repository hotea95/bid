<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h1>프로젝트 작성</h1>
<div style="WIDTH: 700px; text-align: center; float: left:;">
		<fieldset>
			<button type="button" onclick="location.href='./MemberUpdate?STHKORNAME=${projectDTO.PRONAME}&STHJUMIN=${projectDTO.PROJUMIN}&STHJUMIN2=${projectDTO.PROJUMIN2}'">회원정보</button>
			<button type="button" onclick="location.href='./EducationUpdate?EDNAME=${projectDTO.PRONAME}&EDJUMIN=${projectDTO.PROJUMIN}&EDJUMIN2=${projectDTO.PROJUMIN2}'">학력-교육정보</button>
			<button type="button" onclick="location.href='./CertificateUpdate?CERNAME=${projectDTO.PRONAME}&CERJUMIN=${projectDTO.PROJUMIN}&CERJUMIN2=${projectDTO.PROJUMIN2}'">자격증-보유기술정보</button>
		</fieldset>
	</div>
<div>
<form method="post" action="ProjectUpdate">
<fieldset>
<label for="PRONAME">사원명</label>
<input type="text" name="PRONAME" id="PRONAME" value="${projectDTO.PRONAME}">
<label for="PROJUMIN">주민등록번호</label>
<input type="text" name="PROJUMIN" id="PROJUMIN" value="${projectDTO.PROJUMIN}">-<input type="text" name="PROJUMIN2" id="PROJUMIN2" value="${projectDTO.PROJUMIN2}"> <br><br><br>
<label for="PROJECTN">프로젝트명</label>
<input type="text" name="PROJECTN" id="PROJECTN" value="${projectDTO.PROJECTN}">
<label for="PRODATE">참여기간</label>
<input type="text" name="PRODATE" id="PRODATE" style="width : 50px;" value="${projectDTO.PRODATE}">~<input type="text" name="PRODATE2" id="PRODATE2" style="width : 50px;" value="${projectDTO.PRODATE2}">
<br><br>
<label for="PROCOM">고객사</label>
<input type="text" name="PROCOM" id="PROCOM" value="${projectDTO.PROCOM}">
<label for="PROBU">근무회사</label>
<input type="text" name="PROBU" id="PROBU" value="${projectDTO.PROBU}"> <br><br>
<label for="PROFIE">개별분야</label>
<select name="PROFIE">
<option value="자바">자바</option>
<option value="파이썬">파이썬</option>
</select>
&nbsp;&nbsp;&nbsp;
<label for="PROROLE">역할</label>
<input type="text" name="PROROLE" id="PROROLE" value="${projectDTO.PROROLE}"> <br><br>
<fieldset>
<label>개발환경</label> <br><br>
<label for="PROMODEL">기종</label>
<input type="text" name="PROMODEL" id="PROMODEL" value="${projectDTO.PROMODEL}">
<label for="PROOS">&nbsp;&nbsp;&nbsp;OS</label>
<input type="text" name="PROOS" id="PROOS" value="${projectDTO.PROOS}"> <br><br>
<label for="PROLAN">언어</label>
<input type="text" name="PROLAN" id="PROLAN" value="${projectDTO.PROLAN}"> 
<label for="PRODBMS">&nbsp;&nbsp;&nbsp;DBMS</label>
<input type="text" name="PRODBMS" id="PRODBMS" value="${projectDTO.PRODBMS}"><BR><br>
 <label for="PROTOOL">TOOL</label>
<input type="text" name="PROTOOL" id="PROTOOL" value="${projectDTO.PROTOOL}"> 
<label for="PROAGE">&nbsp;&nbsp;&nbsp;통신</label>
<input type="text" name="PROAGE" id="PROAGE" value="${projectDTO.PROAGE}"> <BR><br>
<label for="PROGUI">기타</label>
<input type="text" name="PROGUI" id="PROGUI" style="width : 400px;" value="${projectDTO.PROGUI}">
</fieldset>
<div style="text-align: center;">
<button type="submit" style="WIDTH:60pt; HEIGHT:30pt;">수정</button>
<button type="reset" style="WIDTH:60pt; HEIGHT:30pt;" onclick="location.href='./listSearch'">취소</button>
</div>
</fieldset>
</form>
</div>
</body>
</html>