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
<title>Insert title here</title>
<script type="text/javascript">
// 세션을 확인하고 남은 시간을 계산합니다
function getSessionTimeout() {
    var sessionTimeout = ${pageContext.session.maxInactiveInterval};
    var currentTime = new Date().getTime();
    var sessionCreationTime = ${pageContext.session.creationTime};
    var timeSinceCreation = currentTime - sessionCreationTime;
    
    return sessionTimeout * 1000 - timeSinceCreation;
}

// 세션 남은 시간을 화면에 표시합니다
function displaySessionTimeout() {
    var remainingTime = getSessionTimeout();
    
    var seconds = parseInt(remainingTime / 1000) % 60;
    var minutes = parseInt(remainingTime / (1000 * 60)) % 60;
    var hours = parseInt(remainingTime / (1000 * 60 * 60));
    
    document.getElementById('sessionTimeRemaining').innerHTML =
        ('0' + hours).slice(-2) + ':' +
        ('0' + minutes).slice(-2) + ':' +
        ('0' + seconds).slice(-2);
}
function checkSessionExpiration() {
    var remainingTime = getSessionTimeout();

    if (remainingTime <= 0) {
        alert('세션 시간이 만료되었습니다. 다시 로그인해 주세요!!.');
        location.href='/logout';
    }
}
/* function extendSessionTimeout() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/resetSessionTimeout', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert('세션 시간이 연장되었습니다.');
        }
    };
    xhr.send(null);
} */
// 세션 만료를 주기적으로 확인합니다.
setInterval(checkSessionExpiration, 1000);

// 주기적으로 세션 남은 시간을 업데이트합니다
setInterval(displaySessionTimeout, 1000);

function extendSessionTimeout() {
    $.ajax({
        url: '/resetSessionTimeout',
        method: 'GET',
        success: function(response) {
            console.log(response);
            console.log("성공");
            alert("성공");
        },
        error: function(xhr, status, error) {
            console.log(error);
        }
    });
} 


</script>


</head>
<body>
<div class="asides" style="float: left;" style="width:400px;" style="height:100vh;">
	 	<p>
			<img style="width: 100px;" src="resources/img/title.gif">
		</p>
		  <c:set var="loggedInID" value="${sessionScope.ID}" />
        <%-- ID가 있을 경우 환영 메시지 출력 --%>
        <c:if test="${not empty loggedInID}">
            <p><c:out value="${loggedInID}"/>님 반갑습니다.</p> <br>
            <p>남은 시간: <span id="sessionTimeRemaining"></span></p>

   
        </c:if>
        <c:if test="${loggedInID == 'admin'}">
        <button type="button" onclick="location.href='./logout'">로그아웃</button> <br>
       <button type="button" onclick="extendSessionTimeout()">세션 시간 초기화</button><br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./listSearch'">■ 사원정보</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./MemberInsert'">- 등록</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./Comproinsert'">■ 공통 프로젝트 작성</button>
			<br> <br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./Comproselectall'">■ 공통 프로젝트 조회</button> <br>	<br><br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./BoardSelectall'">■ 공지사항</button>	
				
			</c:if>
			<c:if test="${loggedInID != 'admin'}"> 
			<button type="button" onclick="location.href='./logout'">로그아웃</button> <br>
			<button type="button" onclick="extendSessionTimeout()">세션 시간 초기화</button><br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./listSearch'">■ 사원정보</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./MemberInsert'">- 등록</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./BoardSelectall1'">■ 공지사항</button>	
			</c:if>
		<!-- <button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./listSearchAsReg'">■ 직원명부</button>
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
		<br> -->

		<%-- <fieldset>
			<input type="text" value="■ 경력검색" readonly="readonly"
				style="border: none; background-color: transparent;"> <br>
			<input type="text" name="keyword" id="keywordInput"
				value="${scri.keyword}" style="width: 70px;" />
			<button id="searchBtn">검색</button>
		</fieldset> --%>

	</div>
</body>
</html>