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
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	
	$("#update").click(function() {
		
		
		if (!$("input[name=che]:checked").val()) {
			alert("수정하실 항목을 선택해주세요.")
			return false;
		}if ($("input[name=che]:checked").length != 1) {
		    alert("회원 한명만 선택해주세요");
		    return false;
		}
		else {

			var BNO = $("input[name=che]:checked").val();
			

			location.href = "BoardUpdate?BNO=" + BNO;
		}
	});
});

$(function() {
    $("#delete").click(function() {
        var selectedItems = $("input[name=che]:checked");

        if (selectedItems.length === 0) {
            alert("삭제하실 항목을 선택해주세요.");
            return false;
        }

        if (confirm("정말 삭제하시겠습니까?")) {
            var noValues = [];

            selectedItems.each(function() {
                noValues.push($(this).val());
            });
            
            $.ajax({
                url: "./BoardDelete",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(noValues),
                dataType: "json",
                success: function(data) {
                    alert("삭제 되었습니다.");
                    location.reload();
                    console.log("서버 응답 데이터:", data); // 추가
                },
                error: function(xhr, status, error) {
                    alert("삭제 중 오류가 발생했습니다.");
                    console.log("오류 상태:", status); // 추가
                    console.log("오류 메시지:", error); // 추가
                }
            });

        } else {
            alert("삭제가 취소 되었습니다.");
        }
    });
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/side.jsp" %>
<h1>공지사항</h1>
<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./BoardInsert'">공지사항 등록</button>
			<button type="button" id="delete"
			style="border: none; background-color: transparent; cursor: pointer;"
			>삭제</button>
			<button type="button" id="update"
			style="border: none; background-color: transparent; cursor: pointer;"
			>수정</button>
<table>
<thead>
<tr>
<th>선택</th>
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
<td><input type="checkbox" name="che" value="${list.BNO}"></td>
<td><a href="./BoardSelect?BNO=${list.BNO}">${list.BNO}</a></td>
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