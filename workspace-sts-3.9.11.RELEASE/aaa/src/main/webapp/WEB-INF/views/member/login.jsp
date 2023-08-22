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
</head>
<body>
<c:if test="${ !empty sessionScope.message }">
	<script>
	console.log("h");
                            alert("${message}");

                        </script>

	<c:remove var="message" scope="session" />
</c:if>

<c:if test="${ !empty message }">
	<script>
	console.log("o");
                            alert("${message}");

                        </script>
</c:if>

<script type="text/javascript">

location.href="./listSearch"
</script>
<!-- 
	<fieldset>
		<h1 style="text-align: center; margin-top: 50px; margin-bottom: 50px;">인사
			관리 시스템</h1>

		<form action="./listSearch" role="form" method="GET"
			autocomplete="off">

			<div class="indexDiv">

				<div>
					<label for="id">아이디 : </label> <input type="text" id="id" name="id">
				</div>

				<br>

				<div>
					<label for="pwd">패스워드 : </label> <input type="password" id="pwd"
						name="pwd">
				</div>

			</div>

			<div>
				<button type="submit" id="login"
					style="WIDTH: 60pt; HEIGHT: 60pt; margin-left: -450px;">확인</button>
			</div>

		</form> -->

		<!-- <button type="button" style="border: none; cursor: pointer;" onclick="location.href='./CertificateSelect'"><img src="resources/img/bt_remove.gif"></button>
<p><img src="resources/img/left_top.gif"></p> -->
	</fieldset>
	<!-- <button type="button" onclick="location.href='./ProjectSelect'">프로젝트 전체보기</button>
<button type="button" onclick="location.href='./CareerSelectAll'">경력정보 전체보기</button>
<button type="button" onclick="location.href='./WorkSelectAll'">근무 전체보기</button>
<button type="button" onclick="location.href='./EducationSelectAll'">교육정보 전체보기</button>
<button type="button" onclick="location.href='./ClilistSearch'">거래처 전체보기</button>
<button type="button" onclick="location.href='./Retirement'">퇴직자 전체보기</button>
<button type="button" onclick="location.href='./MemberSelect'">퇴직자xx전체보기</button>
<button type="button" onclick="location.href='./ClilistSearch'">test</button>
<a href="/member/listPage.jsp">페이징</a>
<a href="/member/member_insert.jsp">테스트</a>
<a href="/career/career_update.jsp">자격증 수정</a>
 -->
</body>
</html>