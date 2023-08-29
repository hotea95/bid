<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
}

/* 검색 입력 필드 및 버튼 스타일 */
#searchContainer {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 20px;
}

#searchContainer input[type="text"] {
	border: none;
	border-bottom: 1px solid #ddd;
	padding: 5px;
	font-size: 14px;
}

#searchBtn {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 8px 12px;
	font-size: 14px;
	cursor: pointer;
}

#searchBtn:hover {
	background-color: #45a049;
}

/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

/* 추가된 사원들의 정보를 보여줄 테이블 스타일 */
#addedEmployeesTable {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

#addedEmployeesTable th, #addedEmployeesTable td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

#addedEmployeesTable th {
	background-color: #f2f2f2;
}

/* 입력 필드 스타일 */
#inputFields {
	margin-bottom: 20px;
}

#inputFields h3 {
	margin-bottom: 5px;
}

#inputFields label {
	display: block;
	margin-bottom: 5px;
}

#inputFields input[type="text"], #inputFields input[type="date"] {
	width: 200px;
	padding: 5px;
	font-size: 14px;
}

/* 전송 버튼 스타일 */
#myForm input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 8px 12px;
	font-size: 14px;
	cursor: pointer;
}
 .role-label {
    display: inline-block;
    width: 60px; /* 라벨 너비 조정 */
    font-weight: bold;
    margin-right: 5px;
  }

#myForm input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>사원 정보 입력</title>
</head>
<body>
	<!-- 검색 입력 필드 및 버튼 코드 추가 -->
	<input type="text" value="이름" readonly="readonly"
		style="border: none; background-color: transparent;">
	<input type="text" name="keyword3" id="keywordInput33"
		value="${scri.keyword3}" style="width: 70px;">
	<button id="searchBtn">검색</button>

	
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주민등록번호</th>
				<th>배치</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.NO}</td>
					<td>${list.STHKORNAME}</td>
					<td>${list.STHJUMIN}</td>
					<td><input type="button" value="배치"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<br>

<h4>프로젝트 정보</h4>
	<table>
		<thead>
			<tr>
				<th>프로젝트 번호</th>
				<th>시작날짜</th>
				<th>종료날짜</th>
				<th>프로젝트명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list2" items="${list2}">
				<c:if test="${param.pno == list2.PNO}">
					<tr>
						<td>${list2.PNO}</td>
						<td>${list2.STDATE}</td>
						<td>${list2.ENDDATE}</td>
						<td>${list2.PRONAME}</td>
					</tr>
				</c:if>
			</c:forEach>
			
			<div style="text-align: center;">

			<c:if test="${pageMaker.prev}">
				<a href="Pou${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<a href="Pou${pageMaker.makeSearch(idx)}">${idx}</a>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="Pou${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
			</c:if>

		</div>
		</tbody>
	</table>
	<h4>등록된 사원</h4>
<table>
			<thead>
			<tr>
			<th>번호</th>	
			<th>역할</th>	
			<th>프로젝트명</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="list4" items="${list4}">
			<c:if test="${param.pno == list4.PNO}">
			<tr>
			<td>${list4.NO}</td>
			<td>${list4.ROLE}</td>
			<td>${list4.PRONAME}</td>
			</tr>
			</c:if>
			</c:forEach>
			</tbody>
			</table>
	<!-- 추가된 사원들의 정보를 보여줄 테이블 -->
	<h2>추가된 사원 정보</h2>
	<table id="addedEmployeesTable">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주민등록번호</th>
			</tr>
		</thead>
		<tbody>
			<!-- 추가된 사원들의 정보가 동적으로 생성되어 추가됨 -->
		</tbody>
	</table>
	<br>
	<br>
	
	<!-- 폼 추가 -->
	<form id="myForm" action="./Myproinsert3" method="post" onsubmit="return checks3();">
		<!-- 추가된 사원들의 프로젝트 정보를 입력할 필드들 -->
		<div id="inputFields">
			<!-- 선택한 사원들의 정보를 동적으로 생성하여 추가 -->
		</div>

		<!-- 전송 버튼은 여기에 있어야 폼이 전송됨 -->
		<input type="submit" value="전송">
	</form>


	<script>
		$(function() {
			// 검색 버튼 클릭 이벤트 핸들러
			$('#searchBtn').click(
					function() {
						var keyword333 = encodeURIComponent($('#keywordInput33')
								.val());
						 
						
						/* if (keyword333 !== "") {
			            	url += "&searchType=name&keyword3=" + keyword333;
			            } */
						
					 	var urlParams = new URLSearchParams(
								window.location.search);
						var pno = urlParams.get('pno');
						var proname = urlParams.get('proname');
						var url;
						if (pno && proname) {
							url = "/Pou?page=1&searchType=name&keyword3="
									+ keyword333 + "&pno=" + pno + "&proname="
									+ proname;
						} else {
							url = "/Pou?page=1&searchType=name&keyword3="
									+ keyword333;
						} 
						self.location = url;
					});
			// 선택한 사원들의 정보를 저장할 배열
			var selectedEmployees = [];
		
			
			
			$(document).on('click', 'input[value="배치"]', function() {
				var row = $(this).closest('tr');
				var no = row.find('td:eq(0)').text();
				var sthkorname = row.find('td:eq(1)').text();
				var sthjumin = row.find('td:eq(2)').text();

				if (isDuplicate(no)) {
					alert('이미 선택한 사원입니다.');
				}
				else {
					// 선택한 사원들의 정보를 배열에 추가
					selectedEmployees.push({
						NO : no,
						STHKORNAME : sthkorname,
						STHJUMIN : sthjumin
					});

					// 추가된 사원들의 정보를 테이블에 동적으로 생성하여 추가
					updateAddedEmployees();
				}
			});

			// 중복 체크 함수 (배치했을때 밑에 떠있는 인원 중복체크)
			function isDuplicate(no) {
				for (var i = 0; i < selectedEmployees.length; i++) {
					if (selectedEmployees[i].NO === no) {
						return true;
					}
				}
				return false;
			}

			function updateAddedEmployees() {
				var addedEmployeesTable = $('#addedEmployeesTable');
				addedEmployeesTable.find('tbody').empty();

				var inputFields = $('#inputFields');
				inputFields.empty();

				for (var i = 0; i < selectedEmployees.length; i++) {
					var employee = selectedEmployees[i];
					
					

					// 추가된 사원들의 정보를 테이블에 동적으로 추가
					addedEmployeesTable.append('<tr>' + '<td>' + employee.NO
							+ '</td>' + '<td>' + employee.STHKORNAME + '</td>'
							+ '<td>' + employee.STHJUMIN + '</td>' + '</tr>');

					// URL의 쿼리 파라미터 값을 가져옴
					var urlParams = new URLSearchParams(window.location.search);
					var pno = urlParams.get('pno');
					var proname = urlParams.get('proname');

					// 추가된 사원들의 프로젝트 정보를 입력할 필드들을 동적으로 추가
					inputFields
							.append('<h3>사원 '
									+ (i + 1)
									+ '</h3>'
									+ '<input type="hidden" id="NO' + i + '" name="NO" value="' + employee.NO + '" readonly><br>'
									+ '<input type="hidden" id="PNO' + i + '" name="PNO" value="' + pno + '" readonly><br>'
									+ '<input type="hidden" id="PRONAME' + i + '" name="PRONAME" value="' + proname + '" readonly><br>'
									+ '<span class="date-label">시작날짜 : </span><input type="date" name="STMDATE" id="STMDATE" max="9999-12-31">'
							        + '<span class="date-label">종료날짜 : </span><input type="date" name="ENDMDATE" id="ENDMDATE" max="9999-12-31">'
							        + '<span class="role-label">역할 : </span><input type="text" name="ROLE" id="ROLE"><br><br>');
				}
			}

			// 폼 전송 이벤트 핸들러 등록
			$('#myForm').submit(function() {
				// 폼 전송 전 필요한 작업 수행
				// ...

				// 폼 전송
				this.submit();
				
			});
		});
	</script>
	<script type="text/javascript">

function checks3() {
	//var PRONAME = /^[\uac00-\ud7a3]{0,20}$/;
	
	
	if($("#STMDATE").val() == "") {
		alert("시작날짜를 입력해주세요.");
		$("#STMDATE").focus();
		return false;
	}
	
	if($("#ENDMDATE").val() == "") {
		alert("철수날짜를 입력해주세요.");
		$("#ENDMDATE").focus();
		return false;
	}
	
	 // 시작 날짜와 철수 날짜 비교
    var startDate = new Date($("#STMDATE").val());
    var endDate = new Date($("#ENDMDATE").val());

    if (endDate < startDate) {
        alert("시작날짜가 철수날짜보다 앞에 있어야 합니다.");
        $("#ENDMDATE").focus();
        return false;
    }
    
    if($("#ROLE").val() == "") {
		alert("역할를 입력해주세요.");
		$("#ROLE").focus();
		return false;
	}
    
	return true;
}
</script>
</body>
</html>