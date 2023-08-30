<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
                            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                            crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style type="text/css">
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        fieldset {
            width: 300px;
            margin: 100px auto;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
        }

        h1 {
            text-align: center;
            margin-top: 50px;
        }

        form {
            text-align: center;
        }

        label {
        	display:block; 
        	margin-bottom:10px; 
        	text-align:left; 
        	font-weight:bold; 
        	font-size:.9em
    	}

    	input[type=text], input[type=password] {
    		width : 200px ;
    		padding : .5em ;
    		margin-bottom : .5em ;
    	}

     .form-container {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    button[type=submit] {
        width: auto;
        padding: 0.5em 1em;
        background-color: #4CAF50; /* Green */
        color: white;
        border: none;
        border-radius: 0.25em;
    }
        
    </style>
<c:choose>
    <c:when test="${!empty sessionScope.message}">
        <script>
            
        //alert("${sessionScope.message}"); // 세션 스코프에 저장된 메시지 사용
        alert("로그인 실패하였습니다.")
        </script>
    </c:when>
    <c:otherwise>
        <script>
            console.log("메시지 없음");
        </script>
    </c:otherwise>
</c:choose>
</head>
<body>


	<fieldset>
		<h1 style="text-align: center; margin-top: 50px; margin-bottom: 50px;">인사
			관리 시스템</h1>

		<form action="./login" role="form" method="POST" autocomplete="off">

			<div class="">

					<label for="ID">아이디 : </label> <input type="text" id="ID" name="ID">

				<br>

					<label for="PWD">패스워드 : </label> <input type="password" id="PWD"
						name="PWD">

			</div>

			<div>
				<button type="submit" id="login" style="width: 100%;">로그인</button>
			</div>

		</form>

	</fieldset>

</body>

</html>
