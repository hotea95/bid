<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function() {
    // select 태그 값이 변경되었을 때 이벤트 리스너 등록
    $("select[name='projectName']").on("change", function() {
        var selectedProject = $(this).val(); // 선택된 프로젝트 번호(pno)
		console.log(selectedProject);
        // AJAX 요청 보내기
        $.ajax({
            url: "/Comproselectall2",
            method: "GET",
            data: { pno : selectedProject },  //pno라는 파라미터를 보낼껀데 ----selectedProject 이거는 값
            dataType: "json",
            success: function(data) {
                console.log(data);

                // 서버로부터 받은 데이터를 페이지에 업데이트
                if (data && data.length > 0) {
                    // 선택한 프로젝트명과 일치하는 프로젝트 정보를 찾아서 업데이트
                    var projectInfo = data[0];
                    $("input[name='PNO']").val(projectInfo.pno);
                    $("input[name='PRONAME']").val(projectInfo.proname);
                    $("input[name='STDATE']").val(projectInfo.stdate);
                    $("input[name='ENDDATE']").val(projectInfo.enddate);
                } else {
                    console.log("No data received or data format is invalid.");
                }
            },
            error: function() {
                console.log("Failed to fetch common project information.");
            }
        });
    });
});

</script>
<style>
  body {
    font-family: '맑은 고딕', sans-serif;
    background-color: #f9f9f9;
    margin: 0; /* 페이지 여백 제거 */
  }

  /* ... 나머지 스타일은 여기에 추가 ... */

  /* 버튼 스타일 변경 */
  button[type="submit"],
  button[type="reset"] {
    display: inline-block; /* 인라인 블록 요소로 설정하여 옆으로 나란히 배치 */
    margin: 0 5px; /* 버튼들 사이의 간격 조정 */
    padding: 10px 20px;
    font-size: 16px;
    background-color: #004080; /* 어두운 파란색 배경 */
    color: #fff; /* 흰색 글자색 */
    border: none;
    cursor: pointer;
  }

  /* 버튼 호버 효과 */
  button[type="submit"]:hover,
  button[type="reset"]:hover {
    background-color: #0055a0; /* 밝은 파란색 배경 */
  }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/side.jsp" %>
<h1>프로젝트 작성</h1>

<c:if test="${param.NO != null}">
  <label for="NO">번호</label>
  <input type="text" name="NO" id="NO" value="${param.NO}" readonly="readonly">
</c:if>

 <fieldset>
<h3>공통 프로젝트</h3>
<label for="projectName">프로젝트 명</label>
<select name="projectName" id="projectName">
<c:forEach var="list3" items="${list3}">
<option value="${list3.PNO}">${list3.PRONAME}
</c:forEach>
</select>
 <br> <br>
<label>프로젝트 번호 : </label>
<input type="text" name="PNO" readonly="readonly"> <br>
<label>프로젝트 이름 : </label>
<input type="text" name="PRONAME" id="PRONAME" readonly="readonly"> <br>
<label>시작 날짜 : </label>
<input type="text" name="STDATE" readonly="readonly"> <br>
<label>철수 날짜 : </label>
<input type="text" name="ENDDATE" readonly="readonly"> <br>
</fieldset>
<br>

<form action="./Myproinsert" method="post">
<fieldset>
<h3>개인 프로젝트</h3>
<c:if test="${param.NO != null}">
<label>회원 번호 : </label>
<input type="text" value="${param.NO}" id="NO" name="NO" readonly="readonly"> <BR>
</c:if>
<label>프로젝트 번호 : </label>
<input type="text" name="PNO" id="PNO" readonly="readonly">
 <BR>
<label>프로젝트 이름 : </label>
<input type="text" name="PRONAME" id="PRONAME" readonly="readonly"> <br>
<label>시작날짜 : </label>
<input type="date" name="STMDATE" id="STMDATE" max="9999-12-31"> <br>
<label>종료날짜 : </label>
<input type="date" name="ENDMDATE" id="ENDMDATE" max="9999-12-31"> <br>
<label>역할</label>
<input type="text" name="ROLE" id="ROLE"> <br>
</fieldset>

  <div style="text-align: center;">
    <button type="submit">등록</button>
    <button type="reset">취소</button>
  </div>
</form>
</body>
</html>