<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript">
$(function() {
	$("#update").click(function() {
		if(confirm("정말 수정하시겠습니까?") == true) {
			var CERJUMINVal = $("input[name=radio]:checked").val();
			location.href = "CertificateUpdate?CERJUMIN=" + CERJUMINVal;
		} else {
			alert("취소 되었습니다.");
			location.reload();
		}
	});
});

$(function(){
	$("delete").click(function(){
		if(confirm("정말 삭제하시겠습니까?") == true) {
			var CERJUMIN = $("input[name=radio]:checked").val();
			$.ajax({
				url : "."
			})
		}
	})
})
</script> 
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
	<h1>자격증·보유기술 전체보기</h1>

	<div style="WIDTH: 600px; text-align: center; float: left:;">
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
				<th>사원명</th>
				<th>주민등록번호</th>
				<th>자격증명</th>
				<th>취득일</th>
				<th>보유기술</th>
				<th>숙련도</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
				<tr class="COLOR">
					<td class="BOR2">${list.CERNAME}</td>
					<td class="BOR2"><input type="radio" id="radio" name="radio"
						value="${list.CERJUMIN}" checked>${list.CERJUMIN}</td>
					<!-- <td class="BOR2">${list.CERJUMIN}</td> -->
					<td class="BOR2">${list.CERCER}</td>
					<td class="BOR2">${list.CERDATE}</td>
					<td class="BOR2">${list.CERSKILL}</td>
					<td class="BOR2">${list.CERPRO}</td>
					<td><a
						href="./CertificateSelectDetail?CERJUMIN=${list.CERJUMIN}">
							상세보기 </a></td>
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
			<button type="button" id="update" name="update">수정버튼</button>
			<button type="button">인사기록카드</button>
			<button type="button">경력정보</button>
			<button type="button">근무정보</button>
		</fieldset>
	</div>
	<a
						href="./CertificateInsert">
							새로작성하기 </a>
</body>
</html>