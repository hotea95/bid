<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
#wrap{
	width:1100px;
	margin:auto;
	min-height: 500px;
}
#siderBar{
	float:left;
	margin-top:60px;
	margin-left:20px;
	margin-right:20px;
	width:200px;
	border:2px solid #5F7294;
	min-height: 300px;
}
#siderBar ul{
	width:200px;
	margin:10px 0;
	padding:0;
}
#siderBar li{
	list-style: none;
	color: black;
	height:30px;
	width:155px;
	padding:0 20px;
	margin-left:5px;
	font-size:12px;
	line-height:30px;
}
#siderBar #currier{
	width:180px;
	height:50px;
	padding:15 15px;
	line-height: 30px;
}
#currier img{
	margin-left:10px;
}
#currier.btn{
	padding:5px;
}
#contents{
	margin-top:30px;
	margin-left:10px;
	width:780px;
	min-height: 300px;
	float:left;
	border-top: 30px solid rgba(161,182,204, 0.9);
	border-bottom: 15px solid rgba(161,182,204, 0.9);
	border-left:5px solid rgba(161,182,204, 0.9);
	border-right: 5px solid rgba(161,182,204, 0.9);
}
#content{
	border:2px solid #fff;
	border-radius: 5px 5px 5px 5px;
	width:776px;
	min-height: 300px;
}
#content .title{
	height:20px;
	margin:10px 15px;
	font-size:14px;
	padding:2px 1px;
	border-bottom: 1px dotted #5F7294;
}
#content #selectBox{
	width:340px;
	margin-left:400px;
}
#selectBox .label{
	margin-left:13px;
	padding:0 10px;
}
#naviBar{
	width:300px;
	height:30px;
	margin-left:400px;
	margin-top:30px;
}
#naviBar a{
	margin-left:10px;
	line-height: 30px;
}
#tableText{
	width:700px;
	margin:10px auto;
}
#downLoad{
	width:150px;
	margin-left:600px;
	margin-bottom:20px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
<div id="wrap">
<div id="header">
    
</div><!-- header end -->
<div id="siderBar">
<div>
	<ul>
		<li><img src="resources/img/left_icon.gif"> 기본정보</li>
		<li> - 등록</li>
		<li><img src="resources/img/left_icon.gif"> 직원명부</li>
		<li><img src="resources/img/left_icon.gif"> 퇴직자현황</li>
		<li><img src="resources/img/left_icon.gif"> 예비인력정보</li>
		<li><img src="resources/img/left_icon.gif"> 거래처정보</li>
		<li> - 등록</li>
	</ul>
</div>
<div>
	<ul>
		<li>진행 프로젝트</li>
		<li>현 황</li>
	</ul>
</div>
<div id="currier">
  <!------------------------------ 경력검색 ---------------------------------->
    <img src="resources/img/left_icon.gif" width="11" height="11" align="absmiddle">
        <strong>경력검색</strong><br>
        <input name="textfield" type="text" class="flat" size="15" maxlength="14"> 
          <button class="btn">검색</button>
  <!------------------------------ 경력검색 ---------------------------------->
</div>
</div><!-- siderBar end --> 
<div id="contents">
	<div id="content"> 
	<div class="title"><img src="./main_files/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원조회</strong></div>
   <div id="selectBox">
  <div>
  	<select name="select" class="INPUT">
  	<option selected="">:::::  전 체  :::::</option>
  	<option>:::::  이 름  :::::</option>
  	<option>::: 주민번호 :::</option></select>
  	 <input name="textfield" type="text" class="INPUT"> <button>검색</button>
  </div>	 
  <div>
  	<label class="label">:::: 성 &nbsp;&nbsp; 별 ::::</label>
  	 <input name="textfield" type="text" class="INPUT"> 
  </div>	 
  <div>
   <label class="label">:::: 연 &nbsp;&nbsp; 차 :::: </label>
  	 <input name="textfield" type="text" class="INPUT" placeholder="뒤에7자리"> 
  </div>	 
  <div>
  	<label class="label">:::: 주 &nbsp;&nbsp; 소 ::::</label>
  	 <input name="textfield" type="text" class="INPUT" placeholder="ex)서울시"> 
  </div>	
  </div> 
  <div id="naviBar">
  	<a href="file:///C:/Users/qorgh/AppData/Local/Temp/BNZ.648180c1f7829e1/main.html#">수정</a> <img src="./main_files/all_icon.gif" width="11" height="11" align="absmiddle">
    <a href="file:///C:/Users/qorgh/AppData/Local/Temp/BNZ.648180c1f7829e1/main.html#">인사기록카드</a> <img src="./main_files/all_icon.gif" width="11" height="11" align="absmiddle">
    <a href="file:///C:/Users/qorgh/AppData/Local/Temp/BNZ.648180c1f7829e1/main.html#">경력정보</a> <img src="./main_files/all_icon.gif" width="11" height="11" align="absmiddle"> 
    <a href="file:///C:/Users/qorgh/AppData/Local/Temp/BNZ.648180c1f7829e1/main.html#">근무정보</a><img src="./main_files/all_icon.gif" width="11" height="11" align="absmiddle"> 
  </div>
  <div id="tableText">
        <table>
        	<thead>
              <tr> 
              	<td width="35" height="20" align="center"></td>
              	<td width="85" align="center">이름</td>
              	<td width="85" align="center">주민번호</td>
              	<td width="85" align="center">성별</td>
              	<td width="85" align="center">기술등급</td>
              	<td width="85" align="center">상태</td>
              	<td width="85" align="center">근무형태</td>
              </tr><tr> 
              </tr></thead>
				<!-------------------------  리스트 ------------------------------>
				<tbody>
					<tr> 
                      <td colspan="7" background="./main_files/line_bg.gif"></td>
                    </tr>
                    <tr> 
                      <td width="35" height="20" align="center"><input type="checkbox" name="checkbox" value="checkbox"></td>
                      <td width="85" align="center">홍길동</td>
                      <td width="153" align="center">123456-1234567</td>
                      <td width="91" align="center">남</td>
                      <td width="91" align="center">중급</td>
                      <td width="91" align="center">상태</td>
                      <td width="94" align="center">근무</td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="./main_files/line_bg.gif"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><input type="checkbox" name="checkbox2" value="checkbox"></td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="./main_files/line_bg.gif"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><input type="checkbox" name="checkbox3" value="checkbox"></td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="./main_files/line_bg.gif"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><input type="checkbox" name="checkbox4" value="checkbox"></td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="./main_files/line_bg.gif"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><input type="checkbox" name="checkbox5" value="checkbox"></td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="./main_files/line_bg.gif"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><input type="checkbox" name="checkbox6" value="checkbox"></td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="./main_files/line_bg.gif"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><input type="checkbox" name="checkbox7" value="checkbox"></td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="7" background="./main_files/line_bg.gif"></td>
                    </tr>
                    <tr> 
                      <td height="20" align="center"><input type="checkbox" name="checkbox8" value="checkbox"></td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                      <td align="center">&nbsp;</td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr> 
                      <td colspan="7" background="./main_files/line_bg.gif"></td>
                    </tr>
                    <tr> 
                      <td height="35" colspan="7" align="center" style="padding-bottom:3"><a href="file:///C:/Users/qorgh/AppData/Local/Temp/BNZ.648180c1f7829e1/main.html#"><img src="resources/img/prev.gif" width="22" height="15" border="0" align="absmiddle"></a>&nbsp;<a href="file:///C:/Users/qorgh/AppData/Local/Temp/BNZ.648180c1f7829e1/main.html#"><img src="resources/img/pre.gif" width="42" height="15" border="0" align="absmiddle"></a>&nbsp; 
                        1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 &nbsp;<a href="file:///C:/Users/qorgh/AppData/Local/Temp/BNZ.648180c1f7829e1/main.html#"><img src="resources/img/next.gif" width="42" height="15" border="0" align="absmiddle"></a>&nbsp;<a href="file:///C:/Users/qorgh/AppData/Local/Temp/BNZ.648180c1f7829e1/main.html#"><img src="resources/img/next_.gif" width="22" height="15" border="0" align="absmiddle"></a></td>
                    </tr>
                    </tfoot>
                  </table>
 			</div><!-------------------------  리스트 ------------------------------>
 			<div id="downLoad">
 				<button><img src="resources/img/all_icon.gif" width="11" height="11" align="absmiddle">자료다운</button>
 			</div>
           </div>   
    </div><!-- contents end -->          
</div>


</body>
</body>
</html>