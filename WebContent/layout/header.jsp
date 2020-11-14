<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 세션 정보
	String id = null;
	id = (String)session.getAttribute("id");
	Boolean login = false;
	login = (Boolean)session.getAttribute("login");
	
%>
<%-- 
	if( id == null || !login ) {
		response.sendRedirect("/auth/login.jsp");
	}
--%>

<%
	if(id != null) {
%>
	<header>
     <span class="header_nav"><%=id%>님 환영합니다.</span><span class="header_nav"> | </span>
     <span class="header_nav">로그아웃</span> <span class="header_nav"> | </span>
     <span style="display: none;">관리자</span>
	</header>
<% 		
	}
	else {
%>
	<header>
    <span class="header_nav"><a href="/auth/login.jsp" class="under_none header_nav">로그인</a></span> <span class="header_nav"> | </span>
    <span class="header_nav"><a href="/auth/register.jsp" class="under_none header_nav">회원가입</a></span>
	</header>
<% 		
	}
%>    
<br>
<div id="logo" style="margin-top:20px;">
    <h1 id="Blog"><a href="/">BLOG</a></h1>
</div>
<hr>
