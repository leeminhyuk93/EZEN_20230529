<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>회원가입</title>
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
    </script>
    
    <!-- script -->
    <script type="text/javascript">
        function joinCheck() {      	

			const id = $('#id').val();
			const pwd = $('#pwd').val();
            const pwd_check = $('#pwd_check').val();
            const name = $('#name').val();
            const email = $('#email').val();

            const strLength_regex = /^.{0,13}$/;
            const id_regex = /^[a-z][a-z0-9]*$/;
            const pwd_regex = /^(?=.*[A-Za-z0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]+$/;
            const name_regex = /^[가-힣]+$/;
            const email_regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

			
			if(id === '' || id === null) {
				alert('아이디를 입력해주세요.');
				$('#id').focus();
				return;
			}

			if(idCheck(id)) {
				alert('이미 존재하는 아이디입니다.')
				$('#id').focus();
				return;
			}
			
            if(!id_regex.test(id)) {
				alert('아이디는 영소문자와 숫자만 입력 가능합니다.');
				$('#id').focus();
				return;
			}

            if(!strLength_regex.test(id)) {
                alert('아이디의 최대 길이는 13입니다.');
				$('#id').focus();
				return;
            }

            if(pwd === '' || pwd === null) {
				alert('비밀번호를 입력해주세요.');
				$('#pwd').focus();
				return;
			}

            if(!pwd_regex.test(pwd)) {
                alert('비밀번호는 영문자, 숫자, 특수문자가 1개 이상 들어가야 합니다.');
				$('#pwd').focus();
				return;
            }

            if(pwd_check === '' || pwd_check === null) {
				alert('비밀번호 확인란을 입력해주세요');
				$('#pwd_check').focus();
				return;
			}

            if(pwd.localeCompare(pwd_check)) {
                alert('입력한 비밀번호가 일치하지 않습니다.');
                $('#pwd_check').focus();
                return;
            }

            if(name === '' || name === null) {
				alert('이름을 입력해주세요');
				$('#name').focus();
				return;
			}

            if(!name_regex.test(name)) {
                alert('이름을 한글만 입력 가능합니다.');
                $('#name').focus();
                return;
            }

            if(email === '' || email === null) {
				alert('이메일을 입력해주세요');
				$('#email').focus();
				return;
			}

            if(!email_regex.test(email)) {
                alert('이메일 형식으로만 입력 가능합니다.');
                $('#email').focus();
                return;
            }
            
            if(confirm('작성하신 내용으로 가입하시겠습니까?')) {
            	alert('회원가입 되었습니다.');
            	document.getElementById('joinForm').submit();
            }
        }
        
        
    </script>
</head>
<body>
	<form:form id="joinForm" modelAttribute="user" action="${pageContext.request.contextPath}/join" method="post">
		<div class="container">
			<h2>회원가입</h2>
			<div class="input_type">
				<label for="id">아이디</label>
				<form:input path="id" />
			</div>
	
	        <div class="input_type">
				<label for="pwd">비밀번호</label>
				<form:password path="pwd"/>
			</div>
	
	        <div class="input_type">
				<label for="pwd_check">비밀번호 확인</label>
				<input style="color: blue" type="password" id="pwd_check" name="pwd_check">
			</div>
	
	        <div class="input_type">
				<label for="name">이름</label>
				<form:input path="name" />
			</div>
	
	        <div class="input_type">
				<label for="email">이메일</label>
				<form:input path="email"/>
			</div>
	
	        <div class="input_type">
				<label for="gender">성별</label>
				<form:select path="gender" items="${selectData.gender}" cssClass="input_type_form"></form:select>
			</div>
	
	        <div class="input_type">
				<label for="roleId">회원구분</label>
				<form:select path="roleId" items="${selectData.roleId}" cssClass="input_type_form"></form:select>
			</div>
	        <div class="button">
	            <button type="button" onclick="joinCheck();">회원가입</button>
	        </div>
		</div>
	</form:form>
</body>
</html>