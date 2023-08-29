<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 기본 테이블 스타일 */
    table {
        width: 70%;
        border-collapse: collapse;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
    }

    /* 추가된 스타일 */
    .participants-btns {
        display: flex;
        gap: 10px;
    }

    .delete-participant, .view-participants {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 8px 12px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        cursor: pointer;
    }

    .delete-participant {
        background-color: #f44336;
    }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/side.jsp" %>
<h1>공지사항</h1>
<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./BoardInsert'">공지사항 등록</button>
<table>
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>내용</th>
<th>작성자</th>
<th>날짜</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.BNO}</td>
<td>${list.TITLE}</td>
<td>${list.CONTENT}</td>
<td>${list.WRITER}</td>
<td>${list.REG_DATETIME}</td>
</tr>
</c:forEach>
<c:if test="${empty list}">
<tr>
<td>등록된 게시물이 없습니다</td>
</tr>
</c:if>
</tbody>
</table>
</body>
</html>