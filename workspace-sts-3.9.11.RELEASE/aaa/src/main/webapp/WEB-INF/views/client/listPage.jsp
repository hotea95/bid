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
			if (confirm("정말 수정하시겠습니까?") == true) {
				var CLINAMEVal = $("input[name=che]:checked").val();
				location.href = "ClientUpdate?CLINAME=" + CLINAMEVal;
			} else {
				alert("취소 되었습니다.");
				location.reload();
			}
		});
	});

	$(function() {
		$("#delete").click(function() {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				var CLINAMEVal = $("input[name=che]:checked").val();
				$.ajax({
					url : "./ClientDelete",
					type : "post",
					data : {
						"CLINAME" : CLINAMEVal
					}
				});
				alert("삭제 되었습니다.");
				location.reload();
			} else {
				alert("취소 되었습니다.");
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

	<div style="width: 800px;">
		<h1>사원 조회</h1>
		<select name="search" style="width: 200px;">
			<option value="전체">전체</option>
			<option value="이름">이름</option>
		</select> <input type="text" name="search" id="search"
			style="width: 300px; background-color: transparent;">
		<button type="button" style="width: 100px;">검색</button>
		<br>
		<br>

		<div style="WIDTH: 600px; text-align: center; float: left:;">
			<fieldset>
				<button type="button" id="delete">삭제</button>
				<button type="button">인사기록카드</button>
				<button type="button">경력정보</button>
				<button type="button">근무정보</button>
			</fieldset>
		</div>

		<table class="SCHBOR">
			<thead>
				<tr>
					<th>상호명</th>
					<th>업종</th>
					<th>업태</th>
					<th>전화번호</th>
					<th>담당자</th>
					<th>핸드폰번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr class="COLOR">
					
						<td class="BOR2">${list.CLINAME}</td>
						<td class="BOR2">${list.CLIBU}</td>
						<td class="BOR2">${list.CLIONE}</td>
						<td class="BOR2">${list.CLINUM}</td>
						<td class="BOR2">${list.CLIPER}</td>
						<td class="BOR2">${list.CLIPHONE}</td>
						
					</tr>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td>등록된 부서가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>

<div>
   <ul>
    <c:if test="${pageMaker.prev}">
     <li><a href="ClilistPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if>   
    
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
     <li><a href="ClilistPage${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>
      
    <c:if test="${pageMaker.next &amp;&amp; pageMaker.endPage > 0}">
     <li><a href="ClilistPage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if>   
   </ul>
</div>
		

		

		<div style="WIDTH: 600px; text-align: center; float: left;">
			<fieldset>
				<button type="button" id="update">수정</button>
				<button type="button">인사기록카드</button>
				<button type="button">경력정보</button>
				<button type="button">근무정보</button>
			</fieldset>
		</div>

	</div>

</body>
</html>