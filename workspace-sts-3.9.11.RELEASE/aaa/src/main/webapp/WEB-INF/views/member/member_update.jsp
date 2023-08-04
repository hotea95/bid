<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script>

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

<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h1>사원 정보 수정</h1>
	<div style="WIDTH: 700px; text-align: center; float: left:;">
		<fieldset>
			<button type="button" onclick="location.href='./EducationUpdate?EDNAME=${memberDTO.STHKORNAME}&EDJUMIN=${memberDTO.STHJUMIN}&EDJUMIN2=${memberDTO.STHJUMIN2}'">학력-교육정보</button>
			<button type="button" onclick="location.href='./CertificateUpdate?CERNAME=${memberDTO.STHKORNAME}&CERJUMIN=${memberDTO.STHJUMIN}&CERJUMIN2=${memberDTO.STHJUMIN2}'">자격증-보유기술정보</button>
			<button type="button" onclick="location.href='./ProjectUpdate?PRONAME=${memberDTO.STHKORNAME}&PROJUMIN=${memberDTO.STHJUMIN}&PROJUMIN2=${memberDTO.STHJUMIN2}'">프로젝트정보</button>
		</fieldset>
	</div>
	<div>
		<form method="post" enctype="multipart/form-data"
			action="./MemberUpdate">
			<fieldset>

				<div class="select_img"
					style="width: 60px; height: 60px; float: left;">

					<img id="imgSrc"
						src="${pageContext.request.contextPath}/${memberDTO.STHPHOTO}"  style="width: 100%; height: 100%; object-fit: fill;"/>
					<input type="hidden" name="STHPHOTO" value="${memberDTO.STHPHOTO}" />


				</div>

				<label for="STHKORNAME">한글 이름</label> <input type="text"
					name="STHKORNAME" id="STHKORNAME" value="${memberDTO.STHKORNAME}" readonly="readonly">
				<br> <label for="STHENGNAME">영문 이름</label> <input type="text"
					name="STHENGNAME" id="STHENGNAME" value="${memberDTO.STHENGNAME}"> <br> <label
					for="STHCHNAME">한문 이름</label> <input type="text" name="STHCHNAME"
					id="STHCHNAME" value="${memberDTO.STHCHNAME}"> <br>
					 <label for="STHJUMIN"
					for="STHJUMIN2">주민등록번호</label> <input type="text" name="STHJUMIN"
					id="STHJUMIN" maxlength="6" value="${memberDTO.STHJUMIN}"
					onkeyup="if(this.value.length>=6)this.form.STHJUMIN2.focus();">-<input
					type="text" name="STHJUMIN2" id="STHJUMIN2"
					value="${memberDTO.STHJUMIN2}"> <br> 
					
					<label
					for="STHPHOTO">사진 파일명</label> <input
                        type="file" name="multipartFile" id="attachedfile"
                        accept="image/*" value="5959"> <br>
					
				<label for="STHBIRTH">생년월일</label> 
				
				<input type="text" name="STHBIRTH" id="STHBIRTH" style="width: 100px;" value="${year}" required="required">년 
				
				<input type="text" name="STHBIRTH" id="STHBIRTH2" style="width: 40px;" value="${month}" required="required">월
				
				<input type="text" name="STHBIRTH" id="STHBIRTH3" style="width: 40px;" value="${date}" required="required">일
	
				  <c:if test="${lunOrSol eq '양력'}">
				  ( <input type="radio" name="STHBIRTH" id="STHBIRTH4" value="양력" checked="checked" required="required"> 앙력 
				  <input type="radio" name="STHBIRTH" id="STHBIRTH5" value="음력"> 음력 ) 
				  </c:if>

                  <c:if test="${lunOrSol eq '음력'}">
				  ( <input type="radio" name="STHBIRTH" id="STHBIRTH4" value="양력"> 앙력 
				  <input type="radio" name="STHBIRTH" id="STHBIRTH5" value="음력" checked="checked"> 음력 ) 
				  </c:if>
				  
				  <c:if test="${empty lunOrSol}">
				  <input type="radio" name="STHBIRTH" id="STHBIRTH4" value="양력"> ( 앙력 
				  <input type="radio" name="STHBIRTH" id="STHBIRTH5" value="음력"> 음력 ) 
				  </c:if>

				  <br> 
				  
				  <label for="STHSEX">성별</label> 
	
				  <c:if test="${memberDTO.STHSEX eq '남자'}">
				  <input type="radio" name="STHSEX" id="STHSEX" value="남자" checked="checked">남자 
				  <input type="radio" name="STHSEX" id="STHSEX2" value="여자">여자
				  </c:if>

                  <c:if test="${memberDTO.STHSEX eq '여자'}">
				  <input type="radio" name="STHSEX" id="STHSEX" value="남자">남자 
				  <input type="radio" name="STHSEX" id="STHSEX2" value="여자" checked="checked">여자
				  </c:if>
				  
				  <c:if test="${empty memberDTO.STHSEX}">
				  <input type="radio" name="STHSEX" id="STHSEX" value="남자">남자 
				  <input type="radio" name="STHSEX" id="STHSEX2" value="여자">여자
				  </c:if>
				  
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 
				<label for="STHWEDDING">결혼유무</label>
				
				<c:if test="${memberDTO.STHWEDDING eq '기혼'}">
				  <input type="radio" name="STHWEDDING" id="STHWEDDING" value="기혼" checked="checked">기혼
				<input type="radio" name="STHWEDDING" id="STHWEDDING2" value="미혼">미혼
				  </c:if>

                  <c:if test="${memberDTO.STHWEDDING eq '미혼'}">
				  <input type="radio" name="STHWEDDING" id="STHWEDDING" value="기혼">기혼
				<input type="radio" name="STHWEDDING" id="STHWEDDING2" value="미혼" checked="checked">미혼
				  </c:if>
				  
				  <c:if test="${empty memberDTO.STHWEDDING}">
				  <input type="radio" name="STHWEDDING" id="STHWEDDING" value="기혼">기혼
				<input type="radio" name="STHWEDDING" id="STHWEDDING2" value="미혼">미혼
				  </c:if>

				<br> 
				
				<label for="STHYEAR">년차</label> <input type="text" name="STHYEAR" id="STHYEAR" value="${memberDTO.STHYEAR}">
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <label for="STHWORK">급여지급유형</label>
			 
				<select name="STHWORK">
					<option value="주급">주급</option>
					<option value="월급">월급</option>
				</select> <br> <label for="STHSISM">희망직무</label> <select name="STHSISM">
					<option value="si">si</option>
					<option value="sm">sm</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <label for="STHSTATE">입사유형</label> <select name="STHSTATE">
					<option value="정규직">정규직</option>
					<option value="계약직">계약직</option>
				</select> <br> 
				<label for="STHADDRESS">주소</label> 
				<input type="text" name="STHADDRESS" id="STHADDRESS" value="${memberDTO.STHADDRESS}"> 
				<input type="text" name="STHADDRESS2" id="STHADDRESS2" style="width: 300px;" value="${memberDTO.STHADDRESS2}">
				<br> <label for="STHPHONE">연락처</label> <input type="text"
					name="STHPHONE" id="STHPHONE" style="width: 50px;" value="${memberDTO.STHPHONE}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 <label
					for="STHEMAIL">이메일</label> <input type="text" name="STHEMAIL"
					id="STHEMAIL" value="${memberDTO.STHEMAIL}"> <br> <label for="STHSKILL">기술등급</label>
				<input type="text" name="STHSKILL" id="STHSKILL" value="${memberDTO.STHSKILL}"> <br>
				<label for="STHSOJU">주량</label> <input type="text" name="STHSOJU"
					id="STHSOJU" value="${memberDTO.STHSOJU}"><br>
				<div style="text-align: center;">
					<button type="submit" style="WIDTH: 60pt; HEIGHT: 30pt;">수정</button>
					<button type="reset" style="WIDTH: 60pt; HEIGHT: 30pt;"
						onclick="location.href='./listSearch'">취소</button>
				</div>

			</fieldset>
		</form>
	</div>
</body>
</html>