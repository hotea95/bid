<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체보기</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function() {
    $( "#keywordInputYear" ).datepicker({
    });

   	 $("#excelConverBtn").on('click',function(){
   		 location.href="./Excel";
   		 
   	 });
    
});
</script>

<script type="text/javascript">
function test() {
	document.getElementById("keywordInputYear").value="전체";
	document.getElementById("keywordName").value="전체";
	document.getElementById("keywordStat").value="전체";
}
</script>
</head>
<body>

<table class="add">
<thead>
<tr>
<th>순번</th><th>사용일</th><th>사용내역</th><th>사용금액</th><th>승인금액</th><th>처리상태</th><th>등록일</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${list}">

<tr>
<td>${list.expense_no}</td>
<td>${list.use_date}</td>
<td><a href="./Update?expense_no=${list.expense_no}">${list.name}</a></td>
<td>${list.use_price}</td>
<td>${list.approve_price}</td>
<td>${list.process_status}</td>
<td>${list.registration_date}</td>
</tr>
</c:forEach>
<c:if test="${empty list}">
<tr>
<td>등록된 정보가 없습니다.</td>
</tr>
</c:if>
</tbody>
</table>
<button type="button" onclick="location.href='./Insert'">등록</button>
<button type="button" id="excelConverBtn">엑셀 다운로드</button>

<div class="search">
 <%--  <select name="searchType">
    <option value="re"<c:out value="${scri.searchType eq 're' ? 'selected' : ''}"/>>등록연월</option>
    <option value="name"<c:out value="${scri.searchType eq 'name' ? 'selected' : ''}"/>>사용내역</option>
    <option value="pr"<c:out value="${scri.searchType eq 'pr' ? 'selected' : ''}"/>>처리상태</option>
   </select>
   
   <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/> --%>
      
<br><br><br>
<div>
<input type="text" value="등록연월" readonly="readonly"
style="border: none; background-color: transparent;">
<input type="hidden" value="re" name="searchTypeYear" id="searchTypeYear">
<input type="text" name="keywordYear" id="keywordInputYear" value="전체">
<div>

<input type="text" value="사용내역"
style="border: none; background-color: transparent;">
<input type="hidden" value="name" name="searchTypeName" id="searchTypeName"
style="border: none; background-color: transparent;">
<select id="keywordName">
<option id="keywordInputName" value="전체" selected="selected">전체</option>
<option id="keywordInputName" value="식대(야근)">식대(야근)</option>
<option id="keywordInputName" value="택시비(야근)">택시비(야근)</option>
<option id="keywordInputName" value="택시비(회식)">택시비(회식)</option>
<option id="keywordInputName" value="사무용품구매">사무용품구매</option>
<option id="keywordInputName" value="교육비">교육비</option>
<option id="keywordInputName" value="접대비">접대비</option>
</select>
</div>

<div>
<input type="text" value="처리상태"
style="border: none; background-color: transparent;">
<input type="hidden" value="pr" name="searchTypeStat" id="searchTypeStat">
<select id="keywordStat">
<option id="keywordInputName" value="전체" selected="selected">전체</option>
<option id="keywordInputStat" value="접수">접수</option>
<option id="keywordInputStat" value="승인">승인</option>
<option id="keywordInputStat" value="지급완료">지급완료</option>
<option id="keywordInputStat" value="반려">반려</option>
</select>
</div>
<button id="searchBtn">검색</button>
<button onclick="test()">초기화</button>
  </div>
   <script>
   $(function(){
	   
	   $('#searchBtn').click(function() {
		   
		   var str = $("#keywordInputYear").val();

		   if(str == "전체") { 
			   
			   self.location = "listSearch"
			       + '${pageMaker.makeQuery(1)}'
			       + "&searchTypeYear="
			       + $("#searchTypeYear").val()
			       + "&keywordYear="
			       + '전체'
			       + "&searchTypeStat="
			       + $("#searchTypeStat").val()
			       + "&keywordStat="
			       + $("#keywordStat option:selected").val()
			       + "&searchTypeName="
			       + $("#searchTypeName").val()
			       + "&keywordName="
			       + $("#keywordName option:selected").val();

			   
		   }else {
		   
			var index = str.indexOf('/');

			var Month = str.substr(0,index);

			var YearLater = str.substr(index+1);

			var index2 = YearLater.indexOf('/');
			
			var Day = YearLater.substr(0,index2);
			
			var Year4 = YearLater.substr(index2+1);
			var Year = Year4.substr(2);
			
	     self.location = "listSearch"
	       + '${pageMaker.makeQuery(1)}'
	       + "&searchTypeYear="
	       + $("#searchTypeYear").val()
	       + "&keywordYear="
	       + Year+'/'+Month+'/'+Day
	       + "&searchTypeStat="
	       + $("#searchTypeStat").val()
	       + "&keywordStat="
	       + $("#keywordStat option:selected").val()
	       + "&searchTypeName="
	       + $("#searchTypeName").val()
	       + "&keywordName="
	       + $("#keywordName option:selected").val();
	       
		   }
		   
		   
	   });
	 });

   </script>
</div>

<div>
   <ul>
    <c:if test="${pageMaker.prev}">
     <li><a href="listSearch${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if>   
    
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
     <li><a href="listSearch${pageMaker.makeSearch(idx)}">${idx}</a></li>
    </c:forEach>
      
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
     <li><a href="listSearch${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if>   
   </ul>
</div>
</body>
</html>