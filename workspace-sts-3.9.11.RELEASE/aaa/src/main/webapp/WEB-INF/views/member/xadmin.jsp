<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/include/side2.jsp" %>
<div style="width: 800px;">
		<h1>사원 조회</h1>
		<div>
		<a href="././MemberSelectDetail?NO=${list.NO}">내정보 보기</a> <br><br>
			
			<input type="text" value="입사일" readonly="readonly" style="border: none; background-color: transparent; width: 50px;">
			<input type="date" name="keyword" id="keyword11" value="${scri.keyword}" max="9999-12-31" style="width: 100px;">~
			<input type="date" name="keyword2" id="keyword22" value="${scri.keyword2}" max="9999-12-31" style="width: 100px;">
			<span id="dateErrorMessage" style="color: red;"></span>
			<input type="text" value="이름" readonly="readonly" style="border: none; background-color: transparent; width: 50px;">
			<input type="text" name="keyword3" id="keyword33" value="${scri.keyword3}" style="width: 50px;">
			<span id="nameErrorMessage" style="color: red;"></span>
			<input type="text" value="년차" readonly="readonly" style="border: none; background-color: transparent; width: 50px;">
			<input type="text" name="keyword4" id="keyword44" value="${scri.keyword4}" style="width: 50px;">
			<span id="yearErrorMessage" style="color: red;"></span>
			
			<button id="searchBtn2">검색</button>
		</div>
		<br>
		<!-- <select name="search2" style="width: 200px;">
			<option value="전체조회">전체조회</option>
			<option value="이름">이름</option>
		</select> <input type="text" name="search2" id="search2" -->
		<!-- 	style="width: 300px; background-color: transparent;"> -->
		<!-- <button type="button" style="width: 100px;">검색</button>
		<br>
		<br> -->

		<div>
		
				<button type="button" id="delete">삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<!-- <a href="./Comproinsert">공통프로젝트 작성</a>
				<a href="./Comproselectall">공통프로젝트 조회</a> -->
				<!-- <button type="button">인사기록카드</button>
				<button type="button">경력정보</button>
				<button type="button">근무정보</button> -->
			
			<br><br>
		</div>
<input type="hidden" name="NO" id="NO" value="${memberDTO.NO }">
		<table class="SCHBOR">
			<thead>
				<tr class="COLOR">
					<th>선택</th>
					<th>이름</th>
					<!-- <th>주민등록번호</th> -->
					<th>성별</th>
					<th>상태</th>
					<th>근무</th>
					<th>번호</th>
					<th>입사일</th>
					<th>년차</th>
					<th>프로젝트</th>
				</tr>
			</thead>
			
		</table>
		<br><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" id="update">수정</button>
</div>
</body>
</html>