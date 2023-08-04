<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>멤버 전체조회</title>
<script type="text/javascript">

	$(function() {
		$("#update").click(function() {
			
			if (!$("input[name=che]:checked").val()) {
				alert("수정하실 항목을 선택해주세요.")
				return false;
			} else {
				var STHKORNAMEVal = $("input[name=che]:checked").val();
				location.href = "MemberUpdate?STHKORNAME=" + STHKORNAMEVal;

			}
		});
	});

	$(function() {
		
		$("#delete").click(function() {
			
			if (!$("input[name=che]:checked").val()) {
				alert("삭제하실 항목을 선택해주세요.")
				return false;
			}
			
			if (confirm("정말 삭제하시겠습니까?") == true) {
				var STHKORNAMEVal = $("input[name=che]:checked").val();
				$.ajax({
					url : "./MemberDelete",
					type : "post",
					data : {
						"STHKORNAME" : STHKORNAMEVal
					}
				});
				alert("삭제 되었습니다.");
				location.reload();
			} else {
				alert("삭제가 취소 되었습니다.");
				location.reload();
			}
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
			onclick="location.href='./ClilistSearch'">■ 거래처 정보</button>
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



	<div style="width: 800px;">
		<h1>직원 명부</h1>
		<div>

			<select name="searchType" style="width: 100px;">
				<option value="n"
					<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
				<option value="a"
					<c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>주민번호</option>
			</select> <input type="text" name="keyword2" id="keywordInput2"
				value="${scri.keyword2}" style="width: 300px;" />

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
			<br>
		</div>

		<table class="SCHBOR">
			<thead>
				<tr class="COLOR">
					<th>이름</th>
					<th>주민등록번호</th>
					<th>성별</th>
					<th>기술등급</th>
					<th>상태</th>
					<th>근무</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr class="COLOR">
						<td class=BOR2><input type="radio" name="che" id="che"
							value="${list.STHKORNAME}"><a
							href="./MemberSelectDetail?STHKORNAME=${list.STHKORNAME}">${list.STHKORNAME}</a></td>
						<%-- <td class="BOR2">${list.STHKORNAME}</td> --%>
						<td class="BOR2">${list.STHJUMIN}</td>
						<td class="BOR2">${list.STHSEX}</td>
						<td class="BOR2">${list.STHSKILL}</td>
						<td class="BOR2">${list.STHSTATE}</td>
						<td class="BOR2">${list.STHWORK}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td>등록된 부서가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>


		<!-- 검색 -->
		<div class="search">


			<script>
				$(function() {
					$('#searchBtn').click(
							function() {
								self.location = "listSearchAsReg"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType=y"
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput')
												.val());
							});
				});
			</script>

			<script>
				$(function() {
					$('#searchBtn2')
							.click(
									function() {
										self.location = "listSearchAsReg"
												+ '${pageMaker.makeQuery(1)}'
												+ "&searchType="
												+ $("select option:selected")
														.val()
												+ "&keyword2="
												+ encodeURIComponent($(
														'#keywordInput2').val());
									});
				});
			</script>
		</div>

		<div style="text-align: center;">

			<c:if test="${pageMaker.prev}">
				<a href="listSearchAsReg${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<a href="listSearchAsReg${pageMaker.makeSearch(idx)}">${idx}</a>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="listSearchAsReg${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
			</c:if>

		</div>

		<div>
				<button type="button" id="update">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>

	</div>

</body>
</html>