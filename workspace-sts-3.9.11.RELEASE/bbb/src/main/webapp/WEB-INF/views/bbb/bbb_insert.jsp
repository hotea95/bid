<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	   $("#attachedfile")
	   .change(
	         function() {
	            if (this.files
	                  && this.files[0]) {
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
	            } else {
	               return false;
	            }
	         });
});
</script>
</head>
<body>
<h3>경비 등록</h3>

<form action="./Insert" method="post" enctype="multipart/form-data">
<table class="add">
<tbody>
<tr>
<th>사용내역</th>
<td>
<select name="name">
<option value="식대(야근)">식대(야근)</option>
<option value="택시비(야근)">택시비(야근)</option>
<option value="택시비(회식)">택시비(회식)</option>
<option value="사무용품구매">사무용품구매</option>
<option value="교육비">교육비</option>
<option value="접대비">접대비</option>
</select>
</td>
</tr>
<tr>
<th>사용일</th>
<td>
<input type="text" name="use_date" id="testDatepicker" value="년-월-일">
</td>
</tr>
<tr>
<th>금액</th>
<td><input type="text" name="use_price" id="use_price"></td>
</tr>
<tr>
<th>영수증</th>
<td><input type="file" name="multipartFile" id="attachedfile" accept="image/*"></td>
</tr>
</tbody>
</table>


<!-- <label for="process_status">처리상태</label>
<select name="process_status">
<option value="접수">접수</option>
<option value="승인">승인</option>
<option value="지급완료">지급완료</option>
<option value="반려">반려</option>
</select><br>
<label for="process_date">처리일시</label>
<input type="text" name="process_date" id="testDatepicker2" value="년-월-일"><br>
<label for="approve_price">금액</label>
<input type="text" name="approve_price" id="approve_price"><br>
<label for="remark">비고</label>
<input type="text" name="remark" id="remark"> -->
<button type="submit" >저장</button>
<button type="reset" onclick="location.href='./listSearch'">닫기</button>
</form>
</body>
</html>