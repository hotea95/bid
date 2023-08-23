<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
  /* 기본 테이블 스타일링 */
  table.SCHBOR {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    margin-top: 20px;
  }

  .SCHBOR th, .SCHBOR td {
    padding: 8px;
    text-align: center;
    border: 1px solid #ccc;
  }

  .SCHBOR th {
    background-color: #f5f5f5;
    font-weight: bold;
  }

  /* 선택된 행 스타일링 */
  .SCHBOR tr.selected {
    background-color: #e0f3ff;
  }

  /* 오버된 행 스타일링 */
  .SCHBOR tr:hover {
    background-color: #f0f0f0;
  }
</style>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>멤버 상세보기</title>
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
<%-- <div style="float: left;" style="width:400px;" style="height:800px;">
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

	</div> --%>
	<%@ include file="/WEB-INF/views/include/side.jsp" %>
<h1>멤버 상세보기</h1>

<table class="SCHBOR">
<thead>
<tr>
<th>한글이름</th> <th>영문이름</th><th>한문이름</th><th>주민번호</th><th>사진</th><th>성별</th>
<th>결혼유무</th><th>년차</th><th>희망직무</th><th>입사유형</th><th>주소</th><th>연락처</th><th>이메일</th>
</tr>
</thead>
<tbody>
<%-- <c:forEach var="memberDTO" items="${memberDTO}"> --%>

<tr>
<%-- <input type="hidden" name="NO" id="NO" value="${memberDTO.NO }"> --%>
<td class="BOR2">${memberDTO.STHKORNAME}</td>
<td class="BOR2">${memberDTO.STHENGNAME}</td>
<td class="BOR2">${memberDTO.STHCHNAME}</td>
<td class="BOR2">${memberDTO.STHJUMIN}-${memberDTO.STHJUMIN2}</td>
<td class="BOR2"><img src="${memberDTO.STHPHOTO}"></td>
<td class="BOR2">${memberDTO.STHSEX}</td>
<td class="BOR2">${memberDTO.STHWEDDING}</td>
<td class="BOR2">${memberDTO.STHYEAR}</td>
<td class="BOR2">${memberDTO.STHSISM}</td>
<td class="BOR2">${memberDTO.STHSTATE}</td>
<td class="BOR2">${memberDTO.STHADDRESS}</td>
<td class="BOR2">${memberDTO.STHPHONE}</td>
<td class="BOR2">${memberDTO.STHEMAIL}</td>
<td class="BOR2"><a href ="./Myproinsert?NO=${memberDTO.NO}">프로젝트 작성하기</a></td>
</tr>
<%-- </c:forEach> --%>
</tbody>
</table>
<%-- <c:forEach var="memberDTO" items="${memberDTO}"> --%>
<%-- <c:forEach var="list2" items="${list2}"> --%>

<%-- <c:if test="${memberDTO.NO eq list2.NO}">
<table>
<thead>
<tr>
<th>프로젝트 명</th><th>시작 날짜</th><th>종료 날짜</th><th>역할</th>
</tr>
</thead>
<tbody>

<tr>
<td>${list2.PRONAME}</td>
<td>${list2.STMDATE}</td>
<td>${list2.ENDMDATE}</td>
<td>${list2.ROLE}</td>
</tr>

</tbody>
</table>
</c:if> --%>
<%-- </c:forEach> --%>
<%-- </c:forEach> --%>


<%-- <a href="./MemberUpdate?STHKORNAME=${memberDTO.STHKORNAME}">
부서 수정 </a>
<a href="./MemberDelete?STHKORNAME=${memberDTO.STHKORNAME}">
부서 삭제 </a> --%>
</body>
</html>