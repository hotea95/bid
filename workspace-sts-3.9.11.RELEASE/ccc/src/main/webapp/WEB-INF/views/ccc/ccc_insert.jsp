<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 작성</title>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<h5>사원 기본 정보 수정</h5>
<div>
<form action="./Insert" method="post">
<table class="MAIN">
<tbody>
<tr>
<td class="BOR"><strong>한글이름 : </strong></td>
<td class="BOR"><input type="text" name="STHKORNAME" id="STHKORNAME" class="close"> </td>
</tr>
<tr>
<td class="BOR"><strong>영어이름 : </strong> </td>
<td class="BOR"> <input type="text" id="STHENNAME" name="STHENNAME" class="close"></td>
</tr>
<tr>
<td class="BOR"><strong>한문이름 : </strong> </td>
<td class="BOR"> <input type="text" id="STHCHNAME" name="STHCHNAME" class="close"></td>
</tr>
<tr>
<td class="BOR"><strong>주민등록번호 : </strong> </td>
<td class="BOR"><input type="text" id="STHJUMIN" name="STHJUMIN" class="close">-<input type="text" id="STHJUMIN2" name="STHJUMIN2" class="close"></td>
</tr>

<tr>
<td class="BOR"> <strong>사진파일명</strong> </td>
<td class="BOR"> <input type="text" id="STHPHOTO" name="STHPHOTO" class="close"></td>
</tr>
<tr>
<td class="BOR"><strong>생년월일 : </strong> </td>
<td class="BOR"><input type="text" id="STHBIRTH" name="STHBIRTH" class="close">년<input type="text" id="STHBIRTH2" name="STHBIRTH2" class="close">월<input type="text" id="STHBIRTH3" name="STHBIRTH3" class="close">일
(<input type="radio" id="STHBIRTH4" name="STHBIRTH4" value="앙력" class="close">앙력
<input type="radio" id="STHBIRTH4" name="STHBIRTH4" value="음력" class="close">	음력)</td>
</tr>
<tr>
<td class="BOR"> <strong>성별</strong> </td>
<td class="BOR"> <input type="radio" id="STHMAN" name="STHMAN" value="남자" class="close">남자
<input type="radio" id="STHMAN" name="STHMAN" value="여자" class="close">여자</td>
</tr>
<tr>
<td class="BOR"> <strong>결혼유무</strong> </td>
<td class="BOR"> <input type="radio" id="STHWEDDING" name="STHWEDDING" value="미혼" class="close">미혼
<input type="radio" id="STHWEDDING" name="STHWEDDING" value="기혼" class="close">기혼</td>
</tr>
<tr>
<td class="BOR"> <strong>년차</strong> </td>
<td class="BOR"> <input type="text" id="STHYEAR" name="STHYEAR" class="close"></td>
</tr>
<tr>
<td class="BOR"> <strong>급여 지급유형</strong> </td>
<td class="BOR"> <select name="STHWORK">
<option id="STHWORK" value="월급">월급
<option id="STHWORK" value="주급">주급
</select> </td>
</tr>
<tr>
<td class="BOR"> <strong>희망직무</strong> </td>
<td class="BOR"> <select name="STHSISM">
<option id="STHSISM" value="SI">SI
<option id="STHSISM" value="SM">SM
</select> </td>
</tr>
<tr>
<td class="BOR"> <strong>입사 유형</strong> </td>
<td class="BOR"> <select name="STHSTATE">
<option id="STHSTATE" value="정규직">정규직
<option id="STHSTATE" value="계약직">계약직
</select> </td>
</tr>
<tr>
<td class="BOR"><strong>주소 :  </strong> </td>
<td class="BOR"><input type="text" id="STHADDRES" name="STHADDRES" class="close"><input type="text" id="STHADDRES2" name="STHADDRES2" class="close"></td>
</tr>
<tr>
<td class="BOR"><strong>연락처 :  </strong> </td>
<td class="BOR"><input type="text" id="STHPHONE" name="STHPHONE" class="close">-<input type="text" id="STHPHONE2" name="STHPHONE2" class="close">-<input type="text" id="STHPHONE3" name="STHPHONE3" class="close"></td>
</tr>
<tr>
<td class="BOR"><strong>이메일 </strong></td>
<td class="BOR"><input type="text" name="STHEMAIL" id="STHEMAIL" class="close"> </td>
</tr>
<tr>
<td class="BOR"><strong>기술등급 </strong></td>
<td class="BOR"><input type="text" name="STHSKILL" id="STHSKILL" class="close"> </td>
</tr>
<tr>
<td class="BOR"><strong>주량 </strong></td>
<td class="BOR"><input type="text" name="STHSOJU" id="STHSOJU" class="close"> </td>
</tr>
</tbody>
</table>
<button type="submit">작성</button>
<button type="reset">취소</button>
</form>
</div>
</body>
</html>