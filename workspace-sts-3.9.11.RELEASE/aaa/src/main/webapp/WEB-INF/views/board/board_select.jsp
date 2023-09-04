<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
$(document).ready(function() {
  $(".reply-button").click(function() {
    var parentRno = $(this).data("parent-rno");
    var formContainer = $(this).siblings(".reply-form-container");
    
    // 부모 댓글의 PARENT_RNO 값을 폼의 PARENT_RNO 필드에 설정
    formContainer.find("#PARENT_RNO").val(parentRno);
    
    // 폼 보여주기
    formContainer.show();
  });
});
</script>

</head>

<body>
<div>
<%@ include file="/WEB-INF/views/include/side.jsp" %>
</div>
<H1>공지사항 상세보기</H1>
<div>
<h2>${list.TITLE}</h2>
<span>${list.WRITER}</span>
<span>${list.REG_DATETIME}</span><br><br>
<span>${list.CONTENT}</span>
</div>
<h2>댓글작성하기</h2>
 <div>
 <form action="ReplyInsert" method="post">
<input type="hidden" id="BNO" name="BNO" value="${list.BNO}">
<input type="hidden" id="RNO" name="RNO">
<c:set var="loggedInID" value="${sessionScope.ID}" />
<input type="hidden" id="ID" name="ID" value="${loggedInID }">
<input type="text" id="CONTENT" name="CONTENT">
<input type="hidden" id="PARENT_RNO" name="PARENT_RNO">
<button type="submit">작성</button>
</form>
</div>
<div>
    <h2>댓글</h2>
    <div>
        <c:forEach var="relist" items="${relist}">
        <c:forEach begin="2" end="${relist.level }">
        	ㄴ&nbsp;
        </c:forEach>
            <span>${relist.INDENTED_CONTENT}</span>
            <input type="hidden" value="${relist.PARENT_RNO}">
            <button class="reply-button" data-parent-rno="${relist.RNO}" type="button">답글달기</button>
            <br><br>
        </c:forEach>
        <div class="reply-form-container" style="display: none;">
                <form action="ReplyInsert" method="post">
                    <input type="hidden" id="BNO" name="BNO" value="${list.BNO}">
                    <input type="hidden" id="RNO" name="RNO">
                    <c:set var="loggedInID" value="${sessionScope.ID}" />
                    <input type="hidden" id="ID" name="ID" value="${loggedInID}">
                    <input type="text" id="CONTENT" name="CONTENT">
                    <input type="hidden" id="PARENT_RNO" name="PARENT_RNO">
                    <button type="submit">작성</button>
                </form>
            </div>
            
    </div>
</div>

</body>
</html>