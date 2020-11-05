<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<%--
// 세션 정보
String id = (String)session.getAttribute("id");
Boolean login = (Boolean)session.getAttribute("login");

//세션 정보가 없을 경우 로그인 페이지로 이동
if (id == null || !login) {
	response.sendRedirect("auth/login.jsp");
}
--%>

<%--@ include file="/layout/top.jsp" --%>
	
<div class="container">
	<div class="row justify-content-md-center">
		<div class="col-md-4">	
			<div class="card">
				<div class="card-body">
					<form name="addForm" method="post" action="<c:url value='/' />user/add">
						<div class="form-group">
							<label>구분</label>
							<select type="text" class="form-control" name="user_type">
								<option value="">선택</option>
								<option value="1">관리자</option>
								<option value="2">일반회원</option>
								<option value="3">정회원</option>
								<option value="4">우수회원</option>
								<option value="5">최우수회원</option>
							</select>
						</div>					
		    			<div class="form-group">
							<label>아이디</label>
	  						<input type="text" class="form-control" name="name" placeholder="아이디">
						</div>
		    			<div class="form-group">
	 						<label>이름</label>
	  						<input type="text" class="form-control" name="school_number" placeholder="이름">
						</div>
						<div class="form-group">
	 						<label>닉네임</label>
	  						<input type="text" class="form-control" name="school_number" placeholder="닉네임">
						</div>
						<div class="form-group">
	  						<label>비밀번호</label>
	  						<input type="text" class="form-control" name="password" placeholder="비밀번호">
						</div>
						<div class="form-group">
	  						<label>이메일</label>
	  						<input type="text" class="form-control" name="email" placeholder="이메일">
						</div>
						<div class="form-group">
	  						<label>핸드폰번호</label>
	  						<div class="form-row">
	  							<div class="col">
	  								<input type="text" class="form-control" name="mobile1" placeholder="앞자리">
	  							</div>
	  							<div class="col">
	  								<input type="text" class="form-control" name="mobile2" placeholder="중간">
	  							</div>
	  							<div class="col">
	  								<input type="text" class="form-control" name="mobile3" placeholder="뒷자리">
	  							</div>
	  						</div>
						</div>
						<div class="form-group">
    							<label>생년월일</label>
    							<div class="form-inline">    							
	    							<input type="date" class="form-control mr-sm-2" name="date_of_birth" placeholder="년(4자)" size="6">
	      							<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
								        <option selected>월</option>
								        <option value="1">1</option>
								        <option value="2">2</option>
								        <option value="3">3</option>
								        <option value="4">4</option>
								        <option value="5">5</option>
								        <option value="6">6</option>
								        <option value="7">7</option>
								        <option value="8">8</option>
								        <option value="9">9</option>
								        <option value="10">10</option>
								        <option value="11">11</option>
								        <option value="12">12</option>
	     						 	</select>
	     						 	<input type="text" class="form-control mr-sm-2" name="birthdd" maxlength="2" placeholder="일" size="4">
    							</div>
  							</div>
						<!-- 
						<div class="form-group">
	  						<label>우편번호</label>
	  						<input type="text" class="form-control" name="post" placeholder="우편번호">
						</div>
						<div class="form-group">
	  						<label>주소</label>
	  						<input type="text" class="form-control" name="address" placeholder="주소">
						</div>
						<div class="form-group">
	  						<label>상세주소</label>
	  						<input type="text" class="form-control" name="address_detail" placeholder="상세주소">
						</div>
						-->
		    		</form>
				</div>
				<div class="card-footer">
					<a href="<c:url value='/' />board/list.jsp" class="btn btn-primary">목록</a>
					<div class="float-right">
						<button type="button" class="btn btn-success" id="btnAdd">등록</button>
					</div>
				</div>
			</div>			
		</div>
	</div>	
</div>

<%@ include file="/layout/script.jsp" %>
		
<script>
	$('#btnAdd').on('click', function(e) {
		e.preventDefault();
		
		let userType = $.trim( $('select[name="user_type"]').val() );
		let name = $.trim( $('input[name="name"]').val() );
		let schoolNumber = $.trim( $('input[name="school_number"]').val() );
		let password = $.trim( $('input[name="password"]').val() );
		let email = $.trim( $('input[name="email"]').val() );
		let phone1 = $.trim( $('input[name="phone1"]').val() );
		let phone2 = $.trim( $('input[name="phone2"]').val() );
		let phone3 = $.trim( $('input[name="phone3"]').val() );
		let mobile1 = $.trim( $('input[name="mobile1"]').val() );
		let mobile2 = $.trim( $('input[name="mobile2"]').val() );
		let mobile3 = $.trim( $('input[name="mobile3"]').val() );
		
		if ( !userType ) {
			alert('구분을 선택해주세요');
			$('select[name="user_type"]').focus();
			return false;
		}	
		
		if ( !name ) {
			alert('이름을 입력해주세요');
			$('input[name="name"]').focus();
			return false;
		}
		
		if ( !schoolNumber ) {
			alert('학번/교번을 입력해주세요');
			$('input[name="school_number"]').focus();
			return false;
		}
		
		if ( !password ) {
			alert('비밀번호를 입력해주세요');
			$('input[name="password"]').focus();
			return false;
		}
		
		if ( !email ) {
			alert('이메일을 입력해주세요');
			$('input[name="email"]').focus();
			return false;
		}
		
		if ( !mobile1 || !mobile2 || !mobile3 ) {
			alert('핸드폰번호를 입력해주세요');
			$('input[name="!mobile1"]').focus();
			return false;
		}
		
		// 폼 전송
		$('form[name=addForm]').submit();
	});
</script>

