<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 세션 정보
	String id = null;
	id = (String)session.getAttribute("id");
	Boolean login = false;
	login = (Boolean)session.getAttribute("login");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
<title>BLOG</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/class.css">
</head>
<body>
<%
	if(id != null) {
%>
	<header>
     <span class="header_nav"><%=id%>님 환영합니다.</span><span class="header_nav"> | </span>
     <span><a href="/logout" class="under_none header_nav">로그아웃</a></span> <span class="header_nav" style="display: none;"> | </span>
     <span style="display: none;">관리자</span>
	</header>
<% 		
	}
	else {
%>
	<header>
    <span><a href="/auth/login.jsp" class="under_none header_nav">로그인</a></span> <span class="header_nav"> | </span>
    <span><a href="/auth/register.jsp" class="under_none header_nav">회원가입</a></span>
	</header>
<% 		
	}
%>    
<br>
<div id="logo" style="margin-top:20px;">
    <h1 id="Blog"><a href="/">BLOG</a></h1>
</div>
<hr>
</body>
</html>