<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
                            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                            crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:choose>
    <c:when test="${!empty sessionScope.message}">
        <script>
            
        //alert("${sessionScope.message}"); // 세션 스코프에 저장된 메시지 사용
        alert("로그인 실패하였습니다.")
        </script>
    </c:when>
    <c:otherwise>
        <script>
            console.log("메시지 없음");
        </script>
    </c:otherwise>
</c:choose>
</head>
<body>


	<fieldset>
		<h1 style="text-align: center; margin-top: 50px; margin-bottom: 50px;">인사
			관리 시스템</h1>

		<form action="./login" role="form" method="POST" autocomplete="off">

			<div class="indexDiv">

				<div>
					<label for="ID">아이디 : </label> <input type="text" id="ID" name="ID">
				</div>

				<br>

				<div>
					<label for="PWD">패스워드 : </label> <input type="password" id="PWD"
						name="PWD">
				</div>

			</div>

			<div>
				<button type="submit" id="login"
					style="WIDTH: 60pt; HEIGHT: 60pt; margin-left: -450px;">로그인</button>
			</div>

		</form>

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
