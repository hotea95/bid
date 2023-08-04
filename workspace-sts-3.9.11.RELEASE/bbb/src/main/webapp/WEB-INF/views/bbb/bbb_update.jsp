<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성페이지</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function() {
    $( "#testDatepicker" ).datepicker({
    });
});
</script>
<script type="text/javascript">
$(function() {
    $( "#testDatepicker2" ).datepicker({
    });
});
</script>
<script type="text/javascript">
$(function() {
	
	$("#attachedfile").change(function() {
		  
		var reader = new FileReader;
        reader.onload = function(
              data) {
           $(".select_img img")
                 .attr(
                       "src",
                       data.target.result)
                 .width(50);
        }
        reader
              .readAsDataURL(this.files[0]);
	
  });
  
});
</script>
</head>
<body>
<div style="float : left; height: 10px;">
<h3>사용내역</h3> <br><br>
</div>
<div style="text-align: center">
<h3>영수증</h3>
</div>
<form action="./Update" method="post" enctype="multipart/form-data" style="margin-top: 50px;">
<div class="select_img"
					style="width: 300px; height: 300px;  float: right ; text-align: center; margin-right: 570px;">

					<img id="imgSrc"
						src="${pageContext.request.contextPath}/${dto.receipt}"  style="width: 100%; height: 100%; object-fit: fill;"/>
					<input type="hidden" name="receipt" value="${dto.receipt}" />


				</div>
<input type="hidden" value="${dto.expense_no}" name="expense_no">
<label for="name">사용내역</label>
<select name="name">
<c:if test="${dto.name eq '식대(야근)'}">
<option value="식대(야근)" selected="selected">식대(야근)</option>
</c:if>
<c:if test="${dto.name eq '택시비(야근)'}">
<option value="택시비(야근)" selected="selected">택시비(야근)</option>
</c:if>
<c:if test="${dto.name eq '택시비(회식)'}">
<option value="택시비(회식)" selected="selected">택시비(회식)</option>
</c:if>
<c:if test="${dto.name eq '사무용품구매'}">
<option value="사무용품구매" selected="selected">사무용품구매</option>
</c:if>
<c:if test="${dto.name eq '교육비'}">
<option value="교육비" selected="selected">교육비</option>
</c:if>
<c:if test="${dto.name eq '접대비'}">
<option value="접대비" selected="selected">접대비</option>
</c:if>
</select> <br>
<!-- <option value="식대(야근)">식대(야근)</option>
<option value="택시비(야근)">택시비(야근)</option>
<option value="택시비(회식)">택시비(회식)</option>
<option value="사무용품구매">사무용품구매</option>
<option value="교육비">교육비</option>
<option value="접대비">접대비</option> -->

<label for="use_dat">사용일</label>
<input type="text" name="use_date" id="testDatepicker" value="${dto.use_date}"><br>
<label for="use_price">금액</label>
<input type="text" name="use_price" id="use_price" value="${dto.use_price}"><br>
<label for="receipt">영수증</label>
<input type="file" name="multipartFile" id="attachedfile" accept="image/*" value="5959">



<h3>청구내역</h3>
<label for="process_status">처리상태</label>
<select name="process_status">
<c:if test="${dto.process_status eq '접수'}">
<option value="접수" selected="selected">접수</option>
</c:if>
<c:if test="${dto.process_status eq '승인'}">
<option value="승인" selected="selected">승인</option>
</c:if>
<c:if test="${dto.process_status eq '지급완료'}">
<option value="지급완료" selected="selected">지급완료</option>
</c:if>
<c:if test="${dto.process_status eq '반려'}">
<option value="반려" selected="selected">반려</option>
</c:if>
<c:if test="${dto.process_status eq null}">
<option value="접수">접수</option>
<option value="승인">승인</option>
<option value="지급완료">지급완료</option>
<option value="반려">반려</option>
</c:if>
</select><br>
<label for="process_date">처리일시</label>
<input type="text" name="process_date" id="testDatepicker2" value="${dto.process_date}"><br>
<label for="approve_price">금액</label>
<input type="text" name="approve_price" id="approve_price" value="${dto.approve_price}"><br>
<label for="remark">비고</label>
<input type="text" name="remark" id="remark" value="${dto.remark}"><br><br>
<button type="submit" >저장</button>
<button type="reset" onclick="location.href='./listSearch'">닫기</button>
</form>
</body>
</html>