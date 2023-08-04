<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>교육정보 수정</title>
<script>
				$(function() {
					$('#searchBtn').click(
			function() {
				self.location = "listSearch"
						+ "?page=1&perPageNum=10"
						+ "&searchType=y"
						+ "&keyword="
						+ encodeURIComponent($('#keywordInput')
								.val());
							});
				});
			</script>
</head>
<body>
<div style="float: left;" style="width:400px;" style="height:800px;">
		<p>
			<img style="width: 100px;" src="resources/img/title.gif">
		</p>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./listSearch'">■ 기본정보</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./MemberInsert'">- 등록</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./listSearch'">■ 직원명부</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./Retirement'">■ 퇴직자현황</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./Preliminary'">■ 예비 인력정보</button>
		<br> <br>
		<br> <br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./ClientSelectAll'">■ 거래처 정보</button>
		<br>
		<br>
		<button type="button"
			style="border: none; background-color: transparent; cursor: pointer;"
			onclick="location.href='./ClientInsert'">- 등록</button>
		<br> <br>
		<br>
		<fieldset>
			<label for="label3">진행 프로젝트<br>
			<br> 현황
			</label><br>
			<br>
			<br>
		</fieldset>
		<br>

		<fieldset>
			<input type="text" value="■ 경력검색" readonly="readonly"
				style="border: none; background-color: transparent;"> <br>
			<input type="text" name="keyword" id="keywordInput"
				value="${scri.keyword}" style="width: 70px;" />
			<button id="searchBtn">검색</button>
		</fieldset>

	</div>
	<h1>교육 정보 수정</h1>
<div style="WIDTH: 700px; text-align: center; float: left:;">
		<fieldset>
			<button type="button" onclick="location.href='./MemberUpdate?STHKORNAME=${educationDTO.EDNAME}&STHJUMIN=${educationDTO.EDJUMIN}&STHJUMIN2=${educationDTO.EDJUMIN2}'">회원정보</button>
			<button type="button" onclick="location.href='./CertificateUpdate?CERNAME=${educationDTO.EDNAME}&CERJUMIN=${educationDTO.EDJUMIN}&CERJUMIN2=${educationDTO.EDJUMIN2}'">자격증-보유기술정보</button>
			<button type="button" onclick="location.href='./ProjectUpdate?PRONAME=${educationDTO.EDNAME}&PROJUMIN=${educationDTO.EDJUMIN}&PROJUMIN2=${educationDTO.EDJUMIN2}'">프로젝트정보</button>
		</fieldset>
	</div>
	<div>
		<fieldset>
			<form action="EducationUpdate" method="POST">
			
				<label for="EDNAME">사원명</label> 
				<input type="text" name="EDNAME"
					id="EDNAME" value="${educationDTO.EDNAME}">
					 
					<label for="EDJUMIN">주민번호</label> 
					<input type="text" name="EDJUMIN" id="EDJUMIN" value="${educationDTO.EDJUMIN}">-<label
					for="EDJUMIN2"></label> 
					
					<input type="text" name="EDJUMIN2"
					id="EDJUMIN2" value="${educationDTO.EDJUMIN2}"> <br>
				<br> <label>■ 학력</label><br> 
				
				    <input type="text"
					name="EDSC" id="EDSC" value="${educationDTO.EDSC}"> 
					<label for="EDSC">고등학교</label> 
					
					<input type="text" name="EDD" id="EDD" value="${educationDTO.EDD}"> 
					<label for="EDD">과 졸업</label> 
					
					<input type="text" name="EDYE" id="EDYE" value="${educationDTO.EDYE}"> 
					<label for="EDYE">년</label> 
					
					<input type="text" name="EDM" id="EDM" value="${educationDTO.EDM}">
					<label for="EDM">월</label><br> 
					
			    	<input type="text" name="EDSC2" id="EDSC2" value="${educationDTO.EDSC2}"> 
			    	<label for="EDSC2">전산원</label> &nbsp;&nbsp; 
			    	
			    	<input type="text" name="EDD2" id="EDD2" value="${educationDTO.EDD2}"> 
			    	<label for="EDD2">과 졸업</label> 
			    	
			    	<input type="text" name="EDYE2" id="EDYE2" value="${educationDTO.EDYE2}"> 
			    	<label for="EDYE2">년</label> 
					
					<input type="text" name="EDM2" id="EDM2" value="${educationDTO.EDM2}">
				    <label for="EDM2">월</label><br>
				 
				    <input type="text" name="EDSC3" id="EDSC3" value="${educationDTO.EDSC3}"> 
					<label for="EDSC3">전문대학</label> 
					
					<input type="text" name="EDD3" id="EDD3" value="${educationDTO.EDD3}"> 
					<label for="EDD3">과 졸업</label> 
					
					<input type="text" name="EDYE3" id="EDYE3" value="${educationDTO.EDYE3}"> 
					<label for="EDYE3">년</label> 
					
					<input type="text" name="EDM3" id="EDM3" value="${educationDTO.EDM3}">
					<label for="EDM3">월</label><br> 
				
				    <input type="text" name="EDSC4" id="EDSC4" value="${educationDTO.EDSC4}"> 
					<label for="EDSC4">대학교</label> &nbsp;&nbsp; 
					
					<input type="text" name="EDD4" id="EDD4" value="${educationDTO.EDD4}"> 
					<label for="EDD4">과 졸업</label> 
					
					<input type="text" name="EDYE4" id="EDYE4" value="${educationDTO.EDYE4}"> 
					<label for="EDYE4">년</label> 
					
					<input type="text" name="EDM4" id="EDM4" value="${educationDTO.EDM4}">
					<label for="EDM4">월</label><br> 
					
				    <input type="text" name="EDSC5" id="EDSC5" value="${educationDTO.EDSC5}"> 
					<label for="EDSC5">대학원</label> &nbsp;&nbsp; 
					
					<input type="text" name="EDD5" id="EDD5" value="${educationDTO.EDD5}"> 
					<label for="EDD5">과 졸업</label> 
					
					<input type="text" name="EDYE5" id="EDYE5" value="${educationDTO.EDYE5}">
					<label for="EDYE5">년</label> 
					
					<input type="text" name="EDM5" id="EDM5" value="${educationDTO.EDM5}">
				    <label for="EDM5">월</label><br>
				    
				    <br> 
				   
				    <label>■ 교육</label><br> <label for="EDUCATIONNAME">교육명</label>
				    <input type="text" id="EDUCATIONNAME" name="EDUCATIONNAME" style="width : 400px;" value="${educationDTO.EDUCATIONNAME}"><br>
				    
				    <label for="EDST">교육시작일</label> 
				    <input type="text" id="EDST" name="EDST" value="${educationDTO.EDST}"> 
				    
				    <label for="EDEND">교육종료일</label> 
				    <input type="text" id="EDEND" name="EDEND" value="${educationDTO.EDEND}">
				    
				    <label for="EDIN">교육기관</label>
				    <input type="text" id="EDIN" name="EDIN" value="${educationDTO.EDIN}"><br> 
				    
				    <label for="EDUCATIONNAME2">교육명</label> 
				    <input type="text" id="EDUCATIONNAME2" name="EDUCATIONNAME2" style="width : 400px;" value="${educationDTO.EDUCATIONNAME2}"><br> 
				    
				    <label for="EDST2">교육시작일</label> 
				    <input type="text" id="EDST2" name="EDST2" value="${educationDTO.EDST2}"> 
				    
				    <label for="EDEND2">교육종료일</label> 
				    <input type="text" id="EDEND2" name="EDEND2" value="${educationDTO.EDEND2}">
				    
				    <label for="EDIN2">교육기관</label>
				    <input type="text" id="EDIN2" name="EDIN2" value="${educationDTO.EDIN2}"><br> 
				    
				    <label for="EDUCATIONNAME3">교육명</label>
				    <input type="text" id="EDUCATIONNAME3" name="EDUCATIONNAME3" style="width : 400px;" value="${educationDTO.EDUCATIONNAME3}"><br> 
				    
				    <label for="EDST3">교육시작일</label> 
				    <input type="text" id="EDST3" name="EDST3" value="${educationDTO.EDST3}"> 
				    
				    <label for="EDEND3">교육종료일</label> 
				    <input type="text" id="EDEND3" name="EDEND3" value="${educationDTO.EDEND3}"> 
				    
				    <label for="EDIN3">교육기관</label>
				    <input type="text" id="EDIN3" name="EDIN3" value="${educationDTO.EDIN3}"><br>
				
				<div style="text-align: center;">
					<button type="submit" style="WIDTH: 60pt; HEIGHT: 30pt;">수정</button>
					<button type="reset" style="WIDTH: 60pt; HEIGHT: 30pt;" onclick="location.href='./listSearch'">취소</button>
				</div>
			</form>
		</fieldset>
	</div>
</body>
</html>