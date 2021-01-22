<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
// 세션 정보
	String id = "";
	if((String)session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	};
	Boolean login = false;
	login = (Boolean)session.getAttribute("login");
	int level = 0;
	if(session.getAttribute("level") != null) {
		level = (Integer)session.getAttribute("level");
	}
	String grade = null;
	if((String)session.getAttribute("grade") != null) {
		grade = (String)session.getAttribute("grade");
	};
	String nickName = (String)session.getAttribute("nickName");
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
<style>
	* {
		background: #f2f2f2;
	}
	header {
		margin-right: 40px;
		
	}
</style>
</head>
<body>
<%
	if(id == null || id.equals("")) {
%>
	<header>
    <span><a href="/auth/login.jsp" class="under_none header_nav">ログイン</a></span> <span class="header_nav"> | </span>
    <span><a href="/auth/register.jsp" class="under_none header_nav">会員加入</a></span>
	</header>
<% } else { %>
	<header>
     <span class="header_nav"><%=id%>様 歓迎致します</span><span class="header_nav"> | </span>
     <span><a href="/logout" class="under_none header_nav">ログアウト</a></span>
     
     <%if(level == 5) { %>
     	<span class="header_nav" > | </span> <span ><a href="/admin/admin.jsp" class="under_none header_nav">管理者</a></span>
     <%} %>
     <%if(level == 4) { %>
     	<span class="header_nav" > | </span> <span ><a href="/admin/admin_sub.jsp" class="under_none header_nav">補助者</a></span>
     <%} %>
   
	</header>
<%} %>
<br>
<div id="logo" style="margin-top:20px;">
    <h1 id="Blog"><a href="/">BLOG</a></h1>
</div>
<hr>
</body>
</html>