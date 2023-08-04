<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>경력정보 상세보기</h1>
<table>
		<thead>
			<tr>
				<th>사원명</th>
				<th>주민등록번호</th>
				<th>회사명</th>
				<th>직위</th>
				<th>기간</th>
				<th>담당업무</th>
				<th>회사명</th>
				<th>직위</th>
				<th>기간</th>
				<th>담당업무</th>
				<th>회사명</th>
				<th>직위</th>
				<th>기간</th>
				<th>담당업무</th>
				<th>회사명</th>
				<th>직위</th>
				<th>기간</th>
				<th>담당업무</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>${careerDTO.CARNAME}</td>
					<td>${careerDTO.CARJUMIN}-${careerDTO.CARJUMIN2}</td>
					<td>${careerDTO.CARCOM}</td>
					<td>${careerDTO.CARPOS}</td>
					<td>${careerDTO.CARDATE}</td>
					<td>${careerDTO.CARIN}</td>
					<td>${careerDTO.CARCOM2}</td>
					<td>${careerDTO.CARPOS2}</td>
					<td>${careerDTO.CARDATE2}</td>
					<td>${careerDTO.CARIN2}</td>
					<td>${careerDTO.CARCOM3}</td>
					<td>${careerDTO.CARPOS3}</td>
					<td>${careerDTO.CARDATE3}</td>
					<td>${careerDTO.CARIN3}</td>
					<td>${careerDTO.CARCOM4}</td>
					<td>${careerDTO.CARPOS4}</td>
					<td>${careerDTO.CARDATE4}</td>
					<td>${careerDTO.CARIN4}</td>
					<td><a href="./CareerSelect?CARJUMIN=${list.CARJUMIN}">내용상세보기</a></td>
				</tr>
		</tbody>
	</table>
<a href="./CareerUpdate?CARJUMIN=${careerDTO.CARJUMIN}">
수정 </a>
<a href="./CertificateDelete?CERJUMIN=${certificateDTO.CERJUMIN}">
삭제 </a>
</body>

</body>
</html>