<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>로그인</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            background: linear-gradient(270deg, blue, skyblue);
        }
        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            height: 100vh;
        }
        .container h2 {
            font-size: 30px;
            color: white;
            text-shadow: 2px 2px 4px black;
            margin-bottom: 20px;
        }
        .input_type {
            display: flex;
            justify-content: center;
            align-content: center;
            text-align: center;
            margin-bottom: 15px;
        }
        .container p {
            font-weight: 300;
            font-size: 25px;
            color: white;
            margin-top: 30px;
            text-shadow: 2px 2px 4px black;
        }
        .input_type input {
            text-align: left;
            flex-basis: 60%;
            padding: 5px;
            width: 120px;
        }
        .input_type_form {
        	text-align: left;
            flex-basis: 60%;
            padding: 5px;
            width: 120px;
        }
        
        .container .button {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }
        .button button {
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 600;
            background-color: rgb(36, 45, 173);
            border-radius: 0.35rem;
            color: white;
            border: none;
            box-shadow: 2px 2px 4px black;
        }
        .button button:hover {
            cursor: pointer;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
  		$(document).ready(function() {
  			var roleId = '${user.roleId}';
  			if(roleId === 'user') {
  				$('#roleId').text('일반회원으로');
  			} else {
  				$('#roleId').text('관리자로');
  			}
  			
  		});
    </script>
</head>
<body>
	<div class="container">
		<h2>환영합니다</h2>

		<p><c:out value="${user.name}"></c:out>님 반갑습니다.</p>
        <p><span id="roleId"></span> 로그인 하셨습니다.</p>
	</div>
</body>
</html>