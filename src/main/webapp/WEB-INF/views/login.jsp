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
        .input_type label {
            font-weight: 600;
            color: white;
            margin-right: 10px;
            text-align: right;
            width: 150px;
            text-shadow: 2px 2px 4px black;
            flex-basis: 40%;
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
    
    <!-- 함수 정의 -->
    <script type="text/javascript">
    	
    	/* 
    		아이디를 체크하는 함수.
    		ajax 요청으로 함수의 반환값을 설정하기 위해서 사용   
    	*/
    	function idCheck(id) {
			/* 아이디의 존재를 체크하는 ajax 요청 */
			var externValue = false;
			$.ajax({
				url: '${contextPath}/checkId/' + id,
				method: 'GET',
				dataType: 'text',
				async: false,
				success: function(data) {
					var result = JSON.parse(data);
					if(result) {
						externValue = true;
					}
				},
				error: function(xhr, status, err) {
					console.log('[AJAX 요청 실패]');
					console.log('상태코드: ', xhr.status);
					console.log('상태메시지: ', xhr.statusText);
					console.log('에러: ', err)
				}
			}); // end ajax
			
			return externValue;
    	}
    	
    	/* 
		아이디를 체크하는 함수.
		ajax 요청으로 함수의 반환값을 설정하기 위해서 사용   
	*/
	function pwdCheck(id, pwd) {
		/* 아이디의 존재를 체크하는 ajax 요청 */
		var externValue = false;
		$.ajax({
			url: '${contextPath}/checkPwd/' + id + '/' + pwd,
			method: 'GET',
			dataType: 'text',
			async: false,
			success: function(data) {
				result = JSON.parse(data);
				if(result) {
					externValue = true;
				}
			},
			error: function(xhr, status, err) {
				console.log('[AJAX 요청 실패]');
				console.log('상태코드: ', xhr.status);
				console.log('상태메시지: ', xhr.statusText);
				console.log('에러: ', err)
			}
		}); // end ajax
		
		return externValue;
	}
    	
    	

    </script>
    
    <!-- script -->
    <script type="text/javascript">
    	$(document).ready(function() {
    		$('#id').focus();
    	});
    
    
        function loginCheck(event) {      
        	event.preventDefault();

			const id = $('#id').val();
			const pwd = $('#pwd').val();
			
			if(id === '' || id === null) {
				alert('아이디를 입력해주세요.');
				$('#id').focus();
				return;
			}
			
			if(!idCheck(id)) {
				alert('입력하신 아이디는 존재하지 않습니다.');
				$('#id').focus();
				return;
			}
			
            if(pwd === '' || pwd === null) {
				alert('비밀번호를 입력해주세요.');
				$('#pwd').focus();
				return;
			}
            
            if(!pwdCheck(id, pwd)) {
            	alert('아이디와 비밀번호가 일치하지 않습니다.');
            	$('#pwd').focus();
            	return;
            }
            
            alert('로그인 완료!');
            $('#loginForm').submit();

        }
    </script>
</head>
<body>
	<form id="loginForm" modelAttribute="user" action="${pageContext.request.contextPath}/login" method="post">
		<div class="container">
			<h2>로그인</h2>
			<div class="input_type">
				<label for="id">아이디</label>
				<input type="text" id="id" name="id"/>
			</div>
	
	        <div class="input_type">
				<label for="pwd">비밀번호</label>
				<input type="password" id="pwd" name="pwd"/>
			</div>
	
	        <div class="button">
	            <button type="submit" onclick="loginCheck(event);">로그인</button>
	        </div>
		</div>
	</form>
</body>
</html>