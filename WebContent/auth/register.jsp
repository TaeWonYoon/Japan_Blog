<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
	<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/css/index.css">
	<link rel="stylesheet" href="/css/header.css">
	<link rel="stylesheet" href="/css/class.css">
	<link href="/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		
	<style>
		.login-box {
			margin-top: 100px;
		}
	</style>

	<title>회원가입</title>
</head>
<body>
<%@ include file="/layout/header.jsp" %>
	<div class="container">
	
		<div class="row justify-content-md-center">
			<div class="col-md-6">
			
				<div class="card login-box">
					<div class="card-header">
						회원가입
					</div>
			  		<div class="card-body">
			    		<form class="" id="registerForm" method="post" action="<c:url value='/' />register">
				    		<div class="input-group">
    							<div class="input-group-prepend">
    								<div class="form-group">
		    							<label>아이디(필수)</label>
			    						<div class="form-inline">
				    						<input type="text" class="form-control mr-sm-2" name="id" placeholder="아이디" required maxlength="50">
				    						<input type="button" class="btn btn-outline-primary mr-sm-2" value="중복확인" id="btnCheckValid">
		    							</div>
	   								</div>		
	  							</div>
	  						</div>	
			    			<div class="form-group">
    							<label>비밀번호(필수)</label>
    							<input type="password" class="form-control" name="password" placeholder="비밀번호(최대20글자)" required maxlength="20">
  							</div>
			    			<div class="form-group">
    							<label>이름(필수)</label>
    							<input type="text" class="form-control" name="name" placeholder="이름" required maxlength="10">
  							</div>			    			
  							<div class="form-group">
    							<label>이메일(선택)</label>
    							<input type="email" class="form-control" name="email" placeholder="이메일" >
  							</div>
  							<div class="form-group">
    							<label>닉네임(필수)</label>
    							<input type="text" class="form-control" name="nickname" placeholder="닉네임" required maxlength="4">
  							</div>
  							<div class="form-group">
    							<label>전화번호(필수)</label>
    							<input type="text" class="form-control" name="phone" placeholder="010-XXXX-XXXX" maxlength="13" required oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, '$1-$2-$3').replace('--', '-') ;">
  							</div>
  							<div class="form-group">
    							<label>생년월일</label>
    							<div class="form-inline">    					
	    							<select name="year" id="year" title="년도" class="custom-select"></select>
									<select name="month" id="month" title="월" class="custom-select"></select>
									<select name="day" id="day" title="일" class="custom-select"></select>
    							</div>
  							</div>
			    		</form>
			  		</div>
			  		<div class="card-footer">
			  			<button type="button" class="btn btn-primary" id="btnRegister">회원가입</button>
			  			<div class="float-right">
			  				<a href="<c:url value='/' />auth/login.jsp">로그인</a>
			  			</div>
			  		</div>
				</div>
			</div>
		</div>		
	</div>
	<br><br>
	<%@ include file="/layout/footer.jsp" %>
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	
	
	<script>
		$(document).ready(function () {
        	setDateBox();
      	});
    
      // select box 연도 , 월 표시
      function setDateBox() {
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
    
        // 발행 뿌려주기
        $("#year").append("<option value=''>년도</option>");
    
        // 올해 기준으로 -50년부터 +1년을 보여준다.
        for (var y = (com_year - 90); y <= (com_year-1); y++) {
          $("#year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
        }
    
        // 월 뿌려주기(1월부터 12월)
        var month;
        $("#month").append("<option value=''>월</option>");
        for (var i = 1; i <= 12; i++) {
          $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
        }
    
        // 일 뿌려주기(1일부터 31일)
        var day;
        $("#day").append("<option value=''>일</option>");
        for (var i = 1; i <= 31; i++) {
          $("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
        }
    
      }
		// 이메일 검사
		function isEmail(value) {
			let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			return regExp.test(value); // 형식에 맞는 경우 true 리턴	
		}
		
		// 회원가입 버튼을 누른 경우
		$('#btnRegister').on('click', function(e) {
			e.preventDefault();
			
			//$('input[name="email"]').val( $.trim($('input[name="email"]').val()) );
			
			let id = $.trim( $('input[name="id"]').val() );
			let password = $.trim( $('input[name="password"]').val() );
			let name = $.trim( $('input[name="name"]').val() );
			let email = $.trim( $('input[name="email"]').val() );
			let phone = $.trim( $('input[name="phone"]').val() );
			
			if ( !id ) {
				alert('아이디를 입력해주세요');
				$('input[name="id"]').focus();
				return false;	
			}
			
			if ( id.length < 5 ) {
				alert('아이디는 5글자 이상을 입력해주세요');
				$('input[name="id"]').focus();
				return false;	
			}
			
			if ( form.idDuplication.value != "idCheck") {
				alert('아이디 중복확인을 해주세요.');
				return false;	
			}
			
			if ( !password ) {
				alert('비밀번호를 입력해주세요');
				$('input[name="password"]').focus();
				return false;	
			}
			
			if ( !nickname ) {
				alert('닉네임을 입력해주세요');
				$('input[name="nickname"]').focus();
				return false;	
			}
			
			/*
			if ( !email ) {
				alert('이메일을 입력해주세요');
				$('input[name="email"]').focus();
				return false;	
			}
			*/
			
			if ( !isEmail(email) ) {
				alert('올바른 형식의 이메일을 입력해주세요');
				$('input[name="email"]').focus();
				return false;
			}
			
			if ( !phone ) {
				alert('전화번호를 입력해주세요');
				$('input[name="phone"]').focus();
				return false;	
			}
			*/
			// 아이디, 비밀번호, 이름, 이메일, 전화번호 전송
			$('#registerForm').submit();
		});
		
		$('#btnCheckValid').on('click', function() {
			if ( !$('input[name=id]').val() ) {
				alert('아이디를 입력해주세요');
				$('input[name="id"]').focus();
				return false;	
			}
			
			// 아이디 검증
			$.ajax({
				method: "POST",
				url: "<c:url value='/' />valid",
				data: { 
					id: $('input[name=id]').val(), 
				}
			}).done(function(response) {
				console.log(response.data);
				if (response.data == 'valid') {
					alert('아이디가 존재합니다');
				} else {
					alert('사용가능한 아이디입니다');
				}
			});
		});		
	</script>
</body>
</html>