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
<h1>거래처 정보 수정</h1>
<form action="ClientUpdate" method="post">
<fieldset>
<label for="CLINAME">상호명</label>
<input type="text" id="CLINAME" name="CLINAME" value="${clientDTO.CLINAME}">
<label for="CLIRE">사업자 등록번호</label>
<input type="text" id="CLIRE" name="CLIRE" value="${clientDTO.CLIRE}"><BR><br>
<label for="CLIREP">대표자이름</label>
<input type="text" id="CLIREP" name="CLIREP" value="${clientDTO.CLIREP}"> <BR><br>
<label for="CLIBU">업종</label>
<input type="text" id="CLIBU" name="CLIBU" value="${clientDTO.CLIBU}">
<label for="CLIONE">업태</label>
<input type="text" id="CLIONE" name="CLIONE" value="${clientDTO.CLIONE}"><BR><br>
<label for="CLIADD">사업장 주소</label>
<input type="text" id="CLIADD" name="CLIADD" style="width : 500px;" value="${clientDTO.CLIADD}"> <BR><br>
<label for="CLINUM">전화번호</label>
<input type="text" id="CLINUM" name="CLINUM" value="${clientDTO.CLINUM}">
<label for="CLIFAX">팩스번호</label>
<input type="text" id="CLIFAX" name="CLIFAX" value="${clientDTO.CLIFAX}"><BR><br>
<label for="CLIPER">담당자</label>
<input type="text" id="CLIPER" name="CLIPER" value="${clientDTO.CLIPER}">
<label for="CLIPHONE">핸드폰 번호</label>
<input type="text" id="CLIPHONE" name="CLIPHONE" value="${clientDTO.CLIPHONE}"> <BR><br>
<div style="text-align: center;">
<button type="submit" style="WIDTH:60pt; HEIGHT:30pt;">수정</button>
<button type="reset" style="WIDTH:60pt; HEIGHT:30pt;" onclick="location.href='./listSearch'">취소</button>
</div>

</fieldset>
</form>
</body>
</html>