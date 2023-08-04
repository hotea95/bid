<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>근무정보 작성</title>
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
	<h1>근무 정보 작성</h1>
	<div style="WIDTH: 700px; text-align: center; float: left:;">
		<fieldset>
			<button type="button">기본정보</button>
			<button type="button">학력-교욱정보</button>
			<button type="button">자격증·보유기술</button>
			<button type="button">프로젝트정보</button>
			<button type="button">경력정보</button>
		</fieldset>
	</div>
	<div>
		<form action="./WorkInsert" method="POST">
		<fieldset>
			<label for="WORKNAME">사원명</label> <input type="text" NAME="WORKNAME"
				ID="WORKNAME" value="${MemberInfo.CARNAME}"> <label for="WORKJUMIN">주민등록번호</label> <input
				type="text" NAME="WORKJUMIN" ID="WORKJUMIN" value="${MemberInfo.CARJUMIN}">-<input
				type="text" NAME="WORKJUMIN2" ID="WORKJUMIN2" value="${MemberInfo.CARJUMIN2}"> <BR><br>
			<br> <label for="WORKPRO">프로젝트명</label> <input type="text"
				NAME="WORKPRO" ID="WORKPRO" style="width : 700px;"><BR><br> <label for="WORKPLA">근무장소</label>
			<input type="text" NAME="WORKPLA" ID="WORKPLA" style="width : 700px;"><BR><br> <label
				for="WORKST">근무시작일</label> <input type="text" NAME="WORKST"
				ID="WORKST">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for="WORKEND">근무종료일</label> <input
				type="text" NAME="WORKEND" ID="WORKEND"><BR><BR> <label
				for="WORKSAL">매출액</label> <input type="text" NAME="WORKSAL"
				ID="WORKSAL"><BR><BR> <label for="WORKSCH">결제예정일</label> <input
				type="text" NAME="WORKSCH" ID="WORKSCH">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
				for="WORKDATE">결제일</label> <input type="text" NAME="WORKDATE"
				ID="WORKDATE"> <BR><BR><BR> <label for="WORKCLI">거래처</label> <select
				NAME="WORKCLI">
				<option value="비드넷">비드넷</option>
				<option value="베이직">베이직</option>
			</select>
		<div style="text-align: center;">
<button type="submit" style="WIDTH:60pt; HEIGHT:30pt;">작성</button>
<button type="reset" style="WIDTH:60pt; HEIGHT:30pt;" onclick="location.href='./listSearch'">취소</button>
</div>
</fieldset>
		</form>
	</div>
</body>
</html>