<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
  /* 기본 테이블 스타일링 */
  table.SCHBOR {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    margin-top: 20px;
  }

  .SCHBOR th, .SCHBOR td {
    padding: 8px;
    text-align: center;
    border: 1px solid #ccc;
  }

  .SCHBOR th {
    background-color: #f5f5f5;
    font-weight: bold;
  }

  /* 선택된 행 스타일링 */
  .SCHBOR tr.selected {
    background-color: #e0f3ff;
  }

  /* 오버된 행 스타일링 */
  .SCHBOR tr:hover {
    background-color: #f0f0f0;
  }
</style>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>

<meta charset="UTF-8">
<title>멤버 전체조회</title>
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

				var NO = $("input[name=che]:checked").val();
				

				location.href = "MemberUpdate?NO=" + NO;
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
	                url: "./MemberDelete",
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

<script type="text/javascript">
$(function() {
    $('#keyword11, #keyword22').on('input', function() {
        var startDate = new Date($('#keyword11').val());
        var endDate = new Date($('#keyword22').val());

        if (startDate > endDate) {
            $('#dateErrorMessage').text('시작일은 종료일보다 이전이어야 합니다.');
        } else {
            $('#dateErrorMessage').text('');
        }
    });

    $('#keyword33').on('input', function() {
        var inputValue = $(this).val();
        var filteredValue = inputValue.replace(/[^가-힣ㄱ-ㅎㅏ-ㅣ]/g, ''); // Only Korean characters including 자음 and 모음

        if (filteredValue.length > 6) {
            filteredValue = filteredValue.substring(0, 6);
            $('#nameErrorMessage').text('6글자 이상 입력이 불가능합니다.');
        } else {
            $('#nameErrorMessage').text('');
        }

        $(this).val(filteredValue);
    });

    $('#keyword44').on('input', function() {
        var inputValue = $(this).val();
        var numericValue = inputValue.replace(/[^0-9]/g, ''); // Only numbers

        if (numericValue.length > 2) {
            numericValue = numericValue.substring(0, 2);
            $('#yearErrorMessage').text('2글자 이상 입력이 불가능합니다.');
        } else {
            $('#yearErrorMessage').text('');
        }

        $(this).val(numericValue);
    });
});


</script>
  <script>
    // 초기화 버튼 클릭 시 값들을 초기화하는 함수
    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById("clear").addEventListener("click", function() {
            document.getElementById("keyword11").value = "";
            document.getElementById("keyword22").value = "";
            document.getElementById("keyword33").value = "";
            document.getElementById("keyword44").value = "";
        });
    });
</script>
</head>
<body>
	

	<%@ include file="/WEB-INF/views/include/side.jsp" %>
	

        
	<div style="width: 800px;">
		<h1>사원 조회</h1>
		<div>
	
			
			<input type="text" value="입사일" readonly="readonly" style="border: none; background-color: transparent; width: 50px;">
			<input type="date" name="keyword" id="keyword11" value="${scri.keyword}" max="9999-12-31" style="width: 100px;">~
			<input type="date" name="keyword2" id="keyword22" value="${scri.keyword2}" max="9999-12-31" style="width: 100px;">
			<span id="dateErrorMessage" style="color: red;"></span>
			<input type="text" value="이름" readonly="readonly" style="border: none; background-color: transparent; width: 50px;">
			<input type="text" name="keyword3" id="keyword33" value="${scri.keyword3}" style="width: 50px;">
			<span id="nameErrorMessage" style="color: red;"></span>
			<input type="text" value="년차" readonly="readonly" style="border: none; background-color: transparent; width: 50px;">
			<input type="text" name="keyword4" id="keyword44" value="${scri.keyword4}" style="width: 50px;">
			<span id="yearErrorMessage" style="color: red;"></span>
			
			<button id="searchBtn2">검색</button>
			<button id="clear">초기화</button>
		</div>
		<br>

		<div>
		
				<button type="button" id="delete">삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<br><br>
		</div>
<input type="hidden" name="NO" id="NO" value="${memberDTO.NO }">
		<table class="SCHBOR">
			<thead>
				<tr class="COLOR">
					<th>선택</th>
					<th>이름</th>
					<th>ID</th>
					<!-- <th>주민등록번호</th> -->
					<th>성별</th>
					<th>상태</th>
					<th>근무</th>
					<th>번호</th>
					<th>입사일</th>
					<th>년차</th>
					<th>프로젝트</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach var="list" items="${list}">
				<c:set var="loggedInID" value="${sessionScope.ID}" />
			    <%-- <c:if test="${list.ID eq loggedInID || loggedInID eq not 'admin'}"> --%>
			     <c:if test="${loggedInID eq 'admin' || list.ID eq loggedInID}">
				<%-- <c:out value="${list.ID}11"/> | <c:out value="${loggedInID}22"/> --%>
				<%-- 사용자가 admin이거나 현재 사원의 ID와 로그인한 사용자의 ID가 일치할 때만 정보 출력 --%>
					<tr class="COLOR">
					<%-- <td><input type="checkbox" name="che" id="che"
							value="${list.NO}"></td> --%>
							<td><input type="checkbox" name="che" value="${list.NO}"></td>
						<td class=BOR2>
							<a href="./MemberSelectDetail?NO=${list.NO}">${list.STHKORNAME}</a></td>
						<%-- <td class="BOR2">${list.STHJUMIN}-${list.STHJUMIN2}</td> --%>
						<td class="BOR2">${list.ID}</td>
						<td class="BOR2">${list.STHSEX}</td>
						<td class="BOR2">${list.STHSTATE}</td>
						<td class="BOR2">${list.STHWORK}</td>
						<td class="BOR2">${list.NO}</td>
						<td class="BOR2">${list.MYDATE}</td>
						<td class="BOR2">${list.STHYEAR}</td>
						<td class="BOR2"><a href="./prolist?NO=${list.NO}">프로젝트</a></td>
					</tr>
					</c:if>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td>등록된 부서가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>

		<!-- 검색 -->
		<div class="search">


			<script>
				$(function() {
					$('#searchBtn').click(
							function() {
								self.location = "listSearch"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType=y"
										+ "&keyword="
										+ encodeURIComponent($('#keywordInput').val());
							});
				});
			</script>

			
<script>
    $(function() {
        $('#searchBtn2').click(function() {
        	var keyword11 = encodeURIComponent($('#keyword11').val());
            var keyword22 = encodeURIComponent($('#keyword22').val());
            var keyword33 = encodeURIComponent($('#keyword33').val());
            var keyword44 = encodeURIComponent($('#keyword44').val());
            
            
            
            if (keyword11 === "" && keyword22 === "" && keyword33 === "" && keyword44 === "") {
                alert("입사일과 이름, 년차 중 최소 한 가지를 입력해야 합니다.");
                return;
              }

              if ((keyword11 === "" && keyword22 !== "") || (keyword11 !== "" && keyword22 === "")) {
                alert("입사일 범위를 모두 입력해주세요.");
                return;
              }
            
            var url = "listSearch" + '${pageMaker.makeQuery(1)}';
            
            if (keyword11 !== "" && keyword22 !== "" && keyword33 !== "" && keyword44 !== "") {
                url += "&searchType=all&keyword=" + keyword11 + "&keyword2=" + keyword22 + "&keyword3=" + keyword33 + "&keyword4=" + keyword44;
            }
            
            if (keyword11 !== "" && keyword22 !== "" && keyword33 == "" && keyword44 == "") {
            	url += "&searchType=year&keyword=" + keyword11 + "&keyword2=" + keyword22;
            }
            
            if (keyword11 !== "" && keyword22 !== "" && keyword33 !== "" && keyword44 == "") {
            	url += "&searchType=yearAndName&keyword=" + keyword11 + "&keyword2=" + keyword22 + "&keyword3=" + keyword33;
            }
            
            if (keyword11 !== "" && keyword22 !== "" && keyword33 == "" && keyword44 !== "") {
            	url += "&searchType=yearAndYear&keyword=" + keyword11 + "&keyword2=" + keyword22 + "&keyword4=" + keyword44;
            }
            
            if (keyword11 == "" && keyword22 == "" && keyword33 !== "" && keyword44 == "") {
            	url += "&searchType=name&keyword3=" + keyword33;
            }
            
            if (keyword11 == "" && keyword22 == "" && keyword33 == "" && keyword44 !== "") {
            	url += "&searchType=duration&keyword4=" + keyword44;
            }
            
            if (keyword11 == "" && keyword22 == "" && keyword33 !== "" && keyword44 !== "") {
            	url += "&searchType=nameAndYear&keyword3=" + keyword33 + "&keyword4=" + keyword44;
            }
            
            self.location = url;
        });
    });
</script>




		</div>

		<div style="text-align: center;">

			<c:if test="${pageMaker.prev}">
				<a href="listSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<a href="listSearch${pageMaker.makeSearch(idx)}">${idx}</a>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="listSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
			</c:if>

		</div>

		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" id="update">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
			
		</div>

	</div>

</body>
</html>