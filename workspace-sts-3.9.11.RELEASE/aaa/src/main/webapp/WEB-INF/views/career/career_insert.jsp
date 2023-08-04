<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>경력 작성</title>
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
<h1>경력 정보 작성</h1>
<div style="WIDTH: 700px; text-align: center; float: left: ;">
<fieldset>
<button type="button">기본정보</button>
<button type="button">학력-교욱정보</button>
<button type="button">자격증·보유기술</button>
<button type="button">프로젝트정보</button>
<button type="button">근무정보</button>
</fieldset>
</div>
<div>
<form action="./CareerInsert" method="POST">
<fieldset>
<label for="CARNAME">사원명</label>
<input type="text" NAME="CARNAME" ID="CARNAME" value="${MemberInfo.PRONAME}">
<label for="CARJUMIN">주민번호</label>
<input type="text" NAME="CARJUMIN" ID="CARJUMIN" value="${MemberInfo.PROJUMIN}">-<input type="text" id="CARJUMIN2" name="CARJUMIN2"value="${MemberInfo.PROJUMIN2}"> <BR><BR><br>
<label for="CARCOM">회사명</label>
<input type="text" NAME="CARCOM" ID="CARCOM" style="width : 300px;">&nbsp;&nbsp;
<label for="CARPOS">직위</label>
<input type="text" NAME="CARPOS" ID="CARPOS"> <BR><br>
<label for="CARDATE">기간</label>
<input type="text" NAME="CARDATE" ID="CARDATE" style="width : 60px;"> ~<input type="text" NAME="CARDATE" ID="CARDATE" style="width : 60px;">&nbsp;&nbsp;
<label for="CARIN">담당업무</label>
<input type="text" NAME="CARIN" ID="CARIN" style="width : 200px;"> <BR><br>
<label for="CARCOM2">회사명</label>
<input type="text" NAME="CARCOM2" ID="CARCOM2" style="width : 300px;">&nbsp;&nbsp;
<label for="CARPOS2">직위</label>
<input type="text" NAME="CARPOS2" ID="CARPOS2"> <BR><br>
<label for="CARDATE2">기간</label>
<input type="text" NAME="CARDATE2" ID="CARDATE2" style="width : 60px;"> ~<input type="text" NAME="CARDATE2" ID="CARDATE2" style="width : 60px;">&nbsp;&nbsp;
<label for="CARIN2">담당업무</label>
<input type="text" NAME="CARIN2" ID="CARIN2" style="width : 200px;"> <BR><br>
<label for="CARCOM3">회사명</label>
<input type="text" NAME="CARCOM3" ID="CARCOM3" style="width : 300px;">&nbsp;&nbsp;
<label for="CARPOS3">직위</label>
<input type="text" NAME="CARPOS3" ID="CARPOS3"> <BR><br>
<label for="CARDATE3">기간</label>
<input type="text" NAME="CARDATE3" ID="CARDATE3" style="width : 60px;"> ~<input type="text" NAME="CARDATE3" ID="CARDATE3" style="width : 60px;">&nbsp;&nbsp;
<label for="CARIN3">담당업무</label>
<input type="text" NAME="CARIN3" ID="CARIN3" style="width : 200px;"> <BR><br>
<label for="CARCOM4">회사명</label>
<input type="text" NAME="CARCOM4" ID="CARCOM4" style="width : 300px;">&nbsp;&nbsp;
<label for="CARPOS4">직위</label>
<input type="text" NAME="CARPOS4" ID="CARPOS4"> <BR><br>
<label for="CARDATE4">기간</label>
<input type="text" NAME="CARDATE4" ID="CARDATE4" style="width : 60px;"> ~<input type="text" NAME="CARDATE4" ID="CARDATE4" style="width : 60px;">&nbsp;&nbsp;
<label for="CARIN4">담당업무</label>
<input type="text" NAME="CARIN4" ID="CARIN4" style="width : 200px;"> <BR><br>
<div style="text-align: center;">
<button type="submit" style="WIDTH:60pt; HEIGHT:30pt;">작성</button>
<button type="reset" style="WIDTH:60pt; HEIGHT:30pt;" onclick="location.href='./listSearch'">취소</button>
</div>
</fieldset>
</form>
</div>
</body>
</html>