<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>프로젝트 전체보기</title>
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

<div style="width:800px;">
<h1>프로젝트 조회</h1>
<select name="search" style="width: 200px;">
<option value="전체">전체</option>
<option value="이름">이름</option>
</select>
<input type="text" name="search" id="search" style="width : 300px; background-color: transparent;">
<button type="button" style="width: 100px;">검색</button> <br><br>
</div>

<div style="WIDTH: 600px; text-align: center; float: left: ;">
<fieldset>
<button type="button" onclick="location.href='./MemberDelete'">삭제</button>
<button type="button">인사기록카드</button>
<button type="button">경력정보</button>
<button type="button">근무정보</button>
</fieldset>
</div>

<table class="SCHBOR">
<thead>
<tr>
<th>사원명</th><th>주민등록번호</th><th>프로젝트명</th><th>참여기간</th><th>고객사</th><th>근무회사</th><th>개별분야</th>
<th>역할</th><th>기종</th><th>OS</th><th>언어</th><th>DBMS</th><th>TOOL</th><th>통신</th><th>기타</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${list}">
<tr class="COLOR">
<td class="BOR2">${list.PRONAME}</td>
<td class="BOR2">${list.PROJUMIN}</td>
<td class="BOR2">${list.PROJECTN}</td>
<td class="BOR2">${list.PRODATE}</td>
<td class="BOR2">${list.PROCOM}</td>
<td class="BOR2">${list.PROBU}</td>
<td class="BOR2">${list.PROFIE}</td>
<td class="BOR2">${list.PROROLE}</td>
<td class="BOR2">${list.PROMODEL}</td>
<td class="BOR2">${list.PROOS}</td>
<td class="BOR2">${list.PROLAN}</td>
<td class="BOR2">${list.PRODBMS}</td>
<td class="BOR2">${list.PROTOOL}</td>
<td class="BOR2">${list.PROAGE}</td>
<td class="BOR2">${list.PROGUI}</td>
<td><a href="./ProjectSelectDetail?PROJUMIN=${list.PROJUMIN}">프로젝트 내용
						상세보기</a></td>
</tr>
</c:forEach>
<c:if test="${empty list}">
<tr>
<td>등록된 부서가 없습니다.</td>
</tr>
</c:if>
</tbody>
</table>
<div style="WIDTH: 600px; text-align: center; float: left;">
<fieldset>
<button type="button" onclick="updateValue();">수정</button>
<button type="button">인사기록카드</button>
<button type="button">경력정보</button>
<button type="button">근무정보</button>
</fieldset>
</div>
<button type="button" onclick="location.href='./ProjectInsert'">프로젝트 작성하기</button>
</body>
</html>