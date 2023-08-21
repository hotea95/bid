<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>

<script type="text/javascript">
getSTHWORKTypeOptions();
getSTHSISMTypeOptions()
getSTHSTATETypeOptions()
getSTHSEXypeOptions()
getSTHWEDDINGypeOptions()

function getSTHWORKTypeOptions() {
    $.ajax({
      type: "GET",
      url: "/code/codeVal",
      data: { codeVal : "A10" },
      dataType: "json", 
      success: function(response) {
    	console.log(response);
        var options = "<button disabled>급여지급유형</button>";
        options += "<select name='STHWORK' id='STHWORK'>";
        $.each(response, function(index, option) {
          options += "<option value='" + option.codenum + "'>" + option.codem + "</option>";
        });
        options += "</select>";
        $(".STHWORK").html(options);
      },
      error: function(xhr, status, error) {
        console.log(error);
      }
    });
}
    function getSTHSISMTypeOptions() {
        $.ajax({
          type: "GET",
          url: "/code/codeVal",
          data: { codeVal : "A20" },
          dataType: "json", 
          success: function(response) {
        	console.log(response);
            var options = "<button disabled>희망직무</button>";
            options += "<select name='STHSISM' id='STHSISM'>";
            $.each(response, function(index, option) {
              options += "<option value='" + option.codenum + "'>" + option.codem + "</option>";
            });
            options += "</select>";
            $(".STHSISM").html(options);
          },
          error: function(xhr, status, error) {
            console.log(error);
          }
        });
  }
    
    function getSTHSTATETypeOptions() {
        $.ajax({
          type: "GET",
          url: "/code/codeVal",
          data: { codeVal : "A30" },
          dataType: "json", 
          success: function(response) {
        	console.log(response);
            var options = "<button disabled>입사유형</button>";
            options += "<select name='STHSTATE' id='STHSTATE'>";
            $.each(response, function(index, option) {
              options += "<option value='" + option.codenum + "'>" + option.codem + "</option>";
            });
            options += "</select>";
            $(".STHSTATE").html(options);
          },
          error: function(xhr, status, error) {
            console.log(error);
          }
        });
  }
    
    function getSTHSEXypeOptions() {
    	  $.ajax({
    	    type: "GET",
    	    url: "/code/codeVal",
    	    data: { codeVal: "B10" },
    	    dataType: "json",
    	    success: function (response) {
    	      console.log(response);
    	      var options = "<label>성별</label>";
    	      $.each(response, function (index, option) {
    	        options += "<input type='radio' name='STHSEX' value='" + option.codenum + "'>" + option.codem + "<br>";
    	      });
    	      $(".STHSEX").html(options);
    	    }, // Missing a comma here to separate the success function from the error function
    	    error: function (xhr, status, error) {
    	      console.log(error);
    	    }
    	  });
    	}
    
    function getSTHWEDDINGypeOptions() {
  	  $.ajax({
  	    type: "GET",
  	    url: "/code/codeVal",
  	    data: { codeVal: "B20" },
  	    dataType: "json",
  	    success: function (response) {
  	      console.log(response);
  	      var options = "<label>결혼유무</label>";
  	      $.each(response, function (index, option) {
  	        options += "<input type='radio' name='STHWEDDING' value='" + option.codenum + "'>" + option.codem + "<br>";
  	      });
  	      $(".STHWEDDING").html(options);
  	    }, // Missing a comma here to separate the success function from the error function
  	    error: function (xhr, status, error) {
  	      console.log(error);
  	    }
  	  });
  	}

</script>
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
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .select_img img {
            width: 60px;
            height: 60px;
            float: left;
        }
        .STHSEX {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .STHWEDDING {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        button[type="submit"], button[type="reset"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            background-color: #007BFF;
            color: #fff;
            transition: background-color 0.3s;
        }
        button[type="reset"] {
            background-color: #f44336;
            margin-left: 10px;
        }
        button[type="submit"]:hover, button[type="reset"]:hover {
            background-color: #0056b3;
        }
    </style>
	<script type="text/javascript">

			function checks() {
				var STHKORNAME = RegExp(/^[ㄱ-ㅎ|가-힣]{2,6}$/);
				var ID = RegExp(/^[a-zA-Z0-9]{4,12}$/);
				var PWD = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
				var STHENGNAME = RegExp(/^[a-z|A-Z]{4,20}$/);
				var STHCHNAME = RegExp(/^[\u4e00-\u9fff]{2,6}$/);
				var STHJUMIN = RegExp(/^[0-9]+$/);
				var STHJUMIN2 = RegExp(/^[0-9]{7}$/);   //^입력의 시작을 나타내고 \d모든 숫자와 일치하며 {7}숫자가 정확히 7번 발생하도록 지정합니다.
				var STHYEAR = RegExp(/^[0-9]{1,2}$/);
				var STHPHONE = RegExp(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/);
				var STHEMAIL = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			    
				if($("#STHKORNAME").val() == "") {
					alert("한글이름을 입력바랍니다.");
					$("#STHKORNAME").focus();
					return false;
				}
				if(!STHKORNAME.test($("#STHKORNAME").val())){
			        alert("한글로만 입력해주세요(2~6글자)");
			        $("#STHKORNAME").val("");
			        $("#STHKORNAME").focus();
			        return false;
			      }
				if($("#ID").val() == "") {
					alert("아이디 입력바랍니다.");
					$("#ID").focus();
					return false;
				}
				
				  if(!ID.test($("#ID").val())){
				        alert("아이디를 숫자와 영문으로 작성해주시고 4~12글자로 작성해주세요");
				        $("#ID").val("");
				        $("#ID").focus();
				        return false;
				      }
				  
				  if($("#PWD").val() == ""){
				        alert("비밀번호 입력바랍니다");
				        $("#PWD").focus();
				        return false;
				      }
				  
				  if(!PWD.test($("#PWD").val())){
				        alert("비밀번호를 숫자와 영문 특수문자 모두 사용해주세요. 8~15글자");
				        $("#PWD").val("");
				        $("#PWD").focus();
				        return false;
				      }
				  
				  if($("#PWD").val() != $("#PWD2").val()){
			          alert("비밀번호가 상이합니다");
			          $("#PWD").val("");
			          $("#PWD2").val("");
			          $("#PWD").focus();
			          return false;
			      }
				if($("#STHENGNAME").val() == "") {
					alert("영어이름을 입력바랍니다.");
					$("#STHENGNAME").focus();
					return false;
				}
				if(!STHENGNAME.test($("#STHENGNAME").val())){
			        alert("영어로만 입력해주세요(4~20글자)");
			        $("#STHENGNAME").val("");
			        $("#STHENGNAME").focus();
			        return false;
			      }
				if ($("#STHCHNAME").val() !== "" && !STHJUMIN.test($("#STHCHNAME").val())) {
					  
					  alert

					 
					alert("한문으로만 입력해주세요(2~6글자)");
					  $(
					 
					"#STHCHNAME").val("");
					  $(
					 
					"#STHCHNAME").focus();
					  return false;
					}
				
				if($("#STHJUMIN").val() == "") {
					alert("앞주민번호을 입력바랍니다.");
					$("#STHJUMIN").focus();
					return false;
				}
				if(!STHJUMIN.test($("#STHJUMIN").val())){
			        alert("앞자리숫자로만 입력해주세요");
			        $("#STHJUMIN").val("");
			        $("#STHJUMIN").focus();
			        return false;
			      }
				if($("#STHJUMIN2").val() == "") {
					alert("뒷주민번호을 입력바랍니다.");
					$("#STHJUMIN2").focus();
					return false;
				}
				if(!STHJUMIN2.test($("#STHJUMIN2").val())){
			        alert("뒷자리숫자로만 입력해주세요(7자리)");
			        $("#STHJUMIN2").val("");
			        $("#STHJUMIN2").focus();
			        return false;
			      }
				   var fileCheck = document.getElementById("attachedfile").value;
				    if(!fileCheck){
				        alert("파일을 첨부해 주세요");
				        return false;
				    }
						
				    var STHYEARValue = $("#STHYEAR").val();
				    if (STHYEARValue !== "") {
				        if (!STHYEAR.test(STHYEARValue)) {
				            alert("숫자로만 입력해주세요(1~2자리)");
				            $("#STHYEAR").val("");
				            $("#STHYEAR").focus();
				            return false;
				        }
				    }
				    
				    var STHPHONEValue = $("#STHPHONE").val();
				    if (STHPHONEValue !== "") {
				    	if (!STHPHONE.test(STHPHONEValue)) {
							alert("번호 형식에 맞게 입력해주세요(-사용)")
							$("#STHPHONE").val("");
				            $("#STHPHONE").focus();
				            return false;
						}
				    }
				    
				    var STHEMAILValue = $("#STHEMAIL").val();
				    if (STHEMAILValue !== "") {
				        if (!STHEMAIL.test(STHEMAILValue)) {
				            alert("이메일형식으로 작성해주세요.");
				            $("#STHEMAIL").val("");
				            $("#STHEMAIL").focus();
				            return false;
				        }
				    }
				
			}
			
			</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/side.jsp" %>
	<h1>사원 정보 수정</h1>
	
	<div>
		<form method="post" enctype="multipart/form-data"
			action="./MemberUpdate" onsubmit="return checks()">
			<fieldset>

				<div class="select_img"
					style="width: 60px; height: 60px; float: left;">

					<img id="imgSrc"
						src="${memberDTO.STHPHOTO}"  style="width: 100%; height: 100%; object-fit: fill;"/>
					<input type="hidden" name="STHPHOTO" value="${memberDTO.STHPHOTO}" />


				</div>
				<input type="text"
					name="NO" id="NO" value="${memberDTO.NO}" readonly="readonly">
				<label for="STHKORNAME">한글 이름</label> <input type="text"
					name="STHKORNAME" id="STHKORNAME" value="${memberDTO.STHKORNAME}" readonly="readonly">
				<br>
				<label for="ID">ID</label>
					<input type="text" name="ID" id="ID" placeholder="필수사항" value="${memberDTO.ID}"> <br>
					<label for="PWD">비밀번호</label>
					<input type="text" name="PWD" id="PWD" placeholder="필수사항"> <br>
					<label for="PWD2">비밀번호 확인</label>
					<input type="text" name="PWD2" id="PWD2" placeholder="필수사항"> <br>
				 <label for="STHENGNAME">영문 이름</label> <input type="text"
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
					
				
				  
				  <label for="STHSEX" class="STHSEX">성별</label> 
	
				<%--   <c:if test="${memberDTO.STHSEX eq '남자'}">
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
				  </c:if> --%>
				  
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 
				<label for="STHWEDDING" class="STHWEDDING">결혼유무</label>
				
				<%-- <c:if test="${memberDTO.STHWEDDING eq '기혼'}">
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
				  </c:if> --%>

				<br> 
				
				<label for="STHYEAR">년차</label> <input type="text" name="STHYEAR" id="STHYEAR" value="${memberDTO.STHYEAR}">
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   <label for="STHWORK">급여지급유형</label>
			 
				<select name="STHWORK" class="STHWORK">
					<option value="주급">주급</option>
					<option value="월급">월급</option>
				</select> <br> <label for="STHSISM">희망직무</label> <select name="STHSISM" class="STHSISM">
					<option value="si">si</option>
					<option value="sm">sm</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <label for="STHSTATE">입사유형</label> <select name="STHSTATE" class="STHSTATE">
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
					
					<label for="MYDATE">입사일</label>
				<input type="date" name="MYDATE" id="MYDATE" style="width: 100px;"  value="${memberDTO.MYDATE}"> <br>
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