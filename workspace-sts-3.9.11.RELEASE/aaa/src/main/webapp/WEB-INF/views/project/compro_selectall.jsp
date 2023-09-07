<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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

<meta charset="UTF-8">
<title>공통 프로젝트 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//공통플젝 삭제
$(document).on('click', '.delete', function() {
    var pno = $(this).closest('tr').find('td:eq(0)').text(); // 해당 행의 첫 번째 열 (프로젝트 번호) 값을 가져옴
    confirmDeleteProject(pno); // pno 값을 confirmDeleteProject 함수에 전달
});

function confirmDeleteProject(pno) {
    var confirmDelete = confirm("정말 삭제하시겠습니까???"); // 확인 대화상자 띄우기

    if (confirmDelete) {
        deleteProjectData(pno); // 확인을 선택한 경우에만 삭제 작업 수행
    } else {
        console.log("삭제 취소");
    }
}

function deleteProjectData(pno) {
    $.ajax({
        type: 'POST',
        url: '/comprodelete',
        data: { pno: pno }, // 'pno' 값을 'PNO' 파라미터로 보냄
        success: function(response) {

        	alert("삭제성공");
            console.log('삭제 성공');
            console.log(response);
            
            //  location.reload();
            // 여기서 새로운 데이터를 로드하고 프로젝트 목록 테이블을 갱신하는 작업을 수행할 수 있습니다.
            // 예를 들어, loadProjects 함수를 다시 호출하여 테이블을 갱신할 수 있습니다.
            //loadProjects(pno);
        },
        error: function() {
        	alert("삭제 오류")
            console.log("삭제 오류 발생");
            // 오류 발생 시 처리할 내용 작성
        }
    });
}

</script>

<script>

//개인플젝  "삭제" 버튼 클릭 이벤트 처리
$(document).on('click', '.delete-participant', function() {
    var no = $(this).closest('tr').find('td:eq(0)').text(); // 해당 행의 2번째 열 (프로젝트 번호) 값을 가져옴
    confirmDeleteParticipant(no); // 확인 대화상자 표시
});

function confirmDeleteParticipant(no) {
    var confirmDelete = confirm("정말 삭제하시겠습니까?"); // 확인 대화상자 띄우기

    if (confirmDelete) {
        deleteParticipantData(no); // 확인을 선택한 경우에만 삭제 작업 수행
    } else {
        console.log("삭제 취소");
    }
}

function deleteParticipantData(no) {
    $.ajax({
        type: 'POST',
        url: '/myprodelete',
        data: { NO: no }, // 'no' 값을 'NO' 파라미터로 보냄
        success: function(response) {
            console.log('삭제 성공');
            console.log(response);
            // 여기서 새로운 데이터를 로드하고 참여 인원 테이블을 갱신하는 작업을 수행할 수 있습니다.
            // 예를 들어, loadParticipants 함수를 다시 호출하여 테이블을 갱신할 수 있습니다.
            loadParticipants(no);
        },
        error: function() {
            console.log("삭제 오류 발생");
            // 오류 발생 시 처리할 내용 작성
        }
    });
}
</script> 

<script>
    // "참여 인원 보기" 버튼 클릭 이벤트 처리 (AJAX 호출 함수 정의와 동일한 방법)
    $(document).on('click', '.view-participants', function() {
        var pno = $(this).data('pno');
        loadParticipants(pno);
    });

    function loadParticipants(pno) {
        $.ajax({
            type: 'GET',
            url: '/participants',
            data: { pno: pno },
            success: function(data) {
                console.log(data);
                // AJAX 요청 성공 시, 가져온 데이터를 테이블에 추가
                var tableBody = $('#participants-table tbody');
                tableBody.empty(); // 기존 데이터 삭제 (새로고침)

                // 가져온 데이터를 테이블에 추가하는 작업
                for (var i = 0; i < data.length; i++) {
                    var participant = data[i];
                    var row = '<tr>' +
                        '<td>' + participant.no + '</td>' +
                        '<td>' + participant.pno + '</td>' +
                        '<td>' + participant.stmdate + '</td>' +
                        '<td>' + participant.endmdate + '</td>' +
                        '<td>' + participant.role + '</td>' +
                        '<td>' + participant.proname + '</td>' +
                        '<td><a href="./MyproUpdate?NO=' + participant.no + '&PNO=' + participant.pno + '">수정하기</a></td>' +
                        '<td><button class="delete-participant" data-participant-id="' + participant.id + '">삭제</button></td>' +
                       // '<td><a href="./myprodelete/' + participant.id + '">삭제</a></td>'
                       '</tr>';
                    tableBody.append(row);
                }
            },
            error: function() {
                console.log("오류 발생");
                // AJAX 요청 실패 시, 처리할 내용 작성
            }
        });
    }

</script>
  <script>
  function new_window(pno, proname) {
	    window.open(
	        "/Pou?pno=" + pno + "&proname=" + encodeURIComponent(proname),
	        "Child",
	        "width=400, height=300, top=50, left=50"
	    );
	}

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/side.jsp" %>
    <h1>공통 프로젝트 조회</h1>
    <!-- 원래 테이블 -->
    <table>
        <thead>
            <tr>
                <th>프로젝트 번호</th>
                <th>시작날짜</th>
                <th>종료날짜</th>
                <th>프로젝트 명</th>
                <th>확인</th>
                <th>추가</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="list" items="${list}">
                <tr>
                    <td><a href="./Comproselectone?PNO=${list.PNO}">${list.PNO}</a> </td>
                    <td>${list.STDATE}</td>
                    <td>${list.ENDDATE}</td>
                    <td>${list.PRONAME}</td>
                    <td><button class="view-participants" data-pno="${list.PNO}">참여 인원 보기</button></td>
                	<td><p> <input type="button" value="사원 추가하기" onclick="new_window(${list.PNO}, '${list.PRONAME}');"></p></td>
					  <td><a href="./ComproUpdate?PNO=${list.PNO}">수정하기</a></td>
					<!-- <td><input type="button" value="${list.PNO}">수정하기</td>-->
					<td><a href="/comprodelete?pno=${list.PNO}"><button <%-- name="pno" value="${list.PNO }" data-pno="${list.PNO}" class="delete" --%>>삭제하기</button></a></td>




                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 새로운 테이블 (참여 인원 보여주는 테이블) -->
    <h2>참여 인원 목록</h2>
    <table id="participants-table">
        <thead>
            <tr>
                <th>번호</th>
                <th>프로젝트 번호</th>
                <th>시작날짜</th>
                <th>종료날짜</th>
                <th>역할</th>
                <th>프로젝트명</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <!-- AJAX로 가져온 데이터가 이 곳에 추가됩니다. -->
        </tbody>
    </table>
</body>
</html>
