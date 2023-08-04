<%@ page contentType="application/vnd.ms-excel; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>	<%--엑셀 파일 선언 --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    //출력 데이타 받기
	Object obj = request.getAttribute("result");
	obj= (obj == null) ? new ArrayList() : obj ;
	List<Map<String,Object>> result= (List) obj;

	
	//파일명에 다운로드 날짜 붙여주기 위해 작성
	Date date=new Date();
	SimpleDateFormat dayformat=new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	SimpleDateFormat hourformat=new SimpleDateFormat("hhmmss", Locale.KOREA);
	String day=dayformat.format(date);
	String hour=hourformat.format(date);
	String fileName="member"+day+"_"+hour;
	
	//필수 선언 부분
	//.getBytes("KSC5601"),"8859_1") 을 통한 한글파일명 깨짐 방지
	response.setHeader("Content-Disposition", "attachment; filename="+new String((fileName).getBytes("KSC5601"),"8859_1")+".xls");
	response.setHeader("Content-Description", "JSP Generated Date");
%>

<!doctype html>
<html lang="ko" style="overflow:hidden">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title></title>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">

<table width="784" border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bordercolordark="#6C717D" cellspacing="0" cellpadding="0">
	<thead>
<tr>
<th>순번</th><th>사용일</th><th>사용내역</th><th>사용금액</th><th>승인금액</th><th>처리상태</th><th>등록일</th>
</tr>
</thead>
	<tbody>
	<% for(int i=0; i<result.size(); i++){ 	%>
		<tr>
			<td style="text-align:left; mso-number-format:\#\,\#\#0\;" ><%= result.get(i).get("expense_no")%> </td>
			<td style="text-align:left;"><%= result.get(i).get("use_date")%> </td>
			<td style="text-align:left;"> <%= result.get(i).get("name")%> </td>
			<td style="text-align:left; mso-number-format:\#\,\#\#0\;" ><%= result.get(i).get("use_price")%> </td>
			<td style="text-align:left; mso-number-format:\#\,\#\#0\;" ><%= result.get(i).get("approve_price")%> </td>
			<td style="text-align:left;"><%= result.get(i).get("process_status")%> </td>
			<td style="text-align:left;"><%= result.get(i).get("registration_date")%> </td>	
		</tr>
	 <%}%>
	</tbody>
</table>

</body>

</html>