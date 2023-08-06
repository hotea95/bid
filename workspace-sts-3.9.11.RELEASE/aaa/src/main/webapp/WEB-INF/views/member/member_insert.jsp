<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="./resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>

<meta charset="UTF-8">
<title>헤드</title>

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
   $("#attachedfile")
   .change(
         function() {
            if (this.files
                  && this.files[0]) {
               var reader = new FileReader;
               reader.onload = function(
                     data) {
                  $(".select_img")
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
			
			<script type="text/javascript">

			function checks() {
				var STHKORNAME = RegExp(/^[ㄱ-ㅎ|가-힣]{2,6}$/);
				var STHENGNAME = RegExp(/^[a-z|A-Z]{4,20}$/);
				var STHCHNAME = RegExp(/^[\u4e00-\u9fff]{2,6}$/);
				var STHJUMIN = RegExp(/^[0-9]+$/);
				var STHJUMIN2 = RegExp(/^[0-9]{7}$/);   //^입력의 시작을 나타내고 \d모든 숫자와 일치하며 {7}숫자가 정확히 7번 발생하도록 지정합니다.
			    
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
				
			}
			
			</script>
</head>
<body>
<%-- <div style="float: left;" style="width:400px;" style="height:800px;">
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

	</div> --%>
	<%@ include file="/WEB-INF/views/include/side.jsp" %>
	<h1>사원 기본 정보 작성</h1>
	<div>
		<form method="post" action="./MemberInsert" enctype="multipart/form-data" onsubmit="return checks()">
			<fieldset>
			
				<div class="select_img" style="width: 60px; height: 60px; float: left;">
                        <img src="" />
                        
                 </div>
                     
                 <div>
				<label for="STHKORNAME">한글 이름</label> <input type="text"
					name="STHKORNAME" id="STHKORNAME" placeholder="필수사항"> <br>
					 <label for="STHENGNAME">영문 이름</label> <input type="text" name="STHENGNAME"
					id="STHENGNAME" placeholder="필수사항"> <br> <label for="STHCHNAME">한문
					이름</label> <input type="text" name="STHCHNAME" id="STHCHNAME"> <br>
				<label for="STHJUMIN" for="STHJUMIN2">주민등록번호</label> <input
					type="text" name="STHJUMIN" id="STHJUMIN" maxlength="6"
					onkeyup="if(this.value.length>=6)this.form.STHJUMIN2.focus();" placeholder="필수사항">-<input
					type="text" name="STHJUMIN2" id="STHJUMIN2" placeholder="필수사항"> <br> 
					
					</div>
					
					<label for="STHPHOTO">사진 파일명</label> <input
                        type="file" name="multipartFile" id="attachedfile"
                        accept="image/*">
                        
   	
					 <br> <label for="STHBIRTH">생년월일</label>
				<input type="text" name="STHBIRTH" id="STHBIRTH"
					style="width: 100px;" required="required" placeholder="필수사항">년 <input type="text" name="STHBIRTH"
					id="STHBIRTH2" style="width: 50px;" required="required" placeholder="필수사항">월 <input type="text"
					name="STHBIRTH" id="STHBIRTH3" style="width: 50px;" required="required" placeholder="필수사항">일( <input
					type="radio" name="STHBIRTH" id="STHBIRTH4" value="양력" required="required" checked="checked"> 앙력
				<input type="radio" name="STHBIRTH" id="STHBIRTH5" value="음력" required="required">
				음력 ) <br> <label for="STHSEX" class="STHSEX">성별</label>
				 <!-- 	<input type="radio"
					name="STHSEX" id="STHSEX" value="1" class="STHSEX">남자 <input type="radio"
					name="STHSEX" id="STHSEX" value="2" class="STHSEX">여자   -->
					<label
					for="STHWEDDING" class="STHWEDDING">결혼유무</label><!--  <input type="radio" name="STHWEDDING"
					id="STHWEDDING" value="기혼">기혼 <input type="radio"
					name="STHWEDDING" id="STHWEDDING2" value="미혼">미혼 --> <br>
				<label for="STHYEAR">년차</label> <input type="text" name="STHYEAR"
					id="STHYEAR" style="width: 60px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label for="STHWORK">급여지급유형</label> <select
					name="STHWORK" class="STHWORK">
					<option value="1">주급</option>
					<option value="2">월급</option>
				</select> <br> <label for="STHSISM">희망직무</label>
				 <select name="STHSISM" class="STHSISM">
					<option value="1">si</option>
					<option value="2">sm</option>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <label for="STHSTATE">입사유형</label> <select name="STHSTATE" class="STHSTATE">
					<option value="1">정규직</option>
					<option value="2">계약직</option>
				</select> <br> <label for="STHADDRESS">주소</label> <input type="text"
					name="STHADDRESS" id="STHADDRESS"> <input type="text"
					name="STHADDRESS2" id="STHADDRESS2" style="width: 300px;"> <br>
				<label for="STHPHONE">
				연락처</label> <input type="text" name="STHPHONE"
					id="STHPHONE" style="width: 120px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label for="STHEMAIL">이메일</label> <input type="text" name="STHEMAIL"
					id="STHEMAIL"> <br> <label for="STHSKILL">기술등급</label>
				<input type="text" name="STHSKILL" id="STHSKILL" style="width: 50px;"> <br>
				<label for="STHSOJU">주량</label> 
				<input type="text" name="STHSOJU" id="STHSOJU" style="width: 70px;"> <br>
				<label for="MYDATE">입사일</label>
				<input type="date" name="MYDATE" id="MYDATE" style="width: 100px;"> <br>
				<div style="text-align: center;">
					<button type="submit" style="WIDTH: 60pt; HEIGHT: 30pt;">등록</button>
					<button type="reset" style="WIDTH: 60pt; HEIGHT: 30pt;"
						onclick="location.href='./listSearch'">취소</button>
				</div>

			</fieldset>
		</form>
	</div>
</body>
</html>