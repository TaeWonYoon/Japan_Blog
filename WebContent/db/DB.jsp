<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//mariadb 연결정보
String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
String DB_URL = "jdbc:mariadb://jeongps.com:3306/japan_dbsxodnjs456";
String DB_USER = "dbsxodnjs456";
String DB_PASSWORD = "dljeQPcyr0WZUKUS";

Connection conn = null;
PreparedStatement pstmt = null;
%>
