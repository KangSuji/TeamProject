<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="static/css/admin.css"/> 
<script src="static/jquery/jquery-3.5.1.js"></script>
<script type="text/javascript" src="static/script/admin.js"></script>
</head>
<body>
<div id="wrap">
<header>
    <div id="header_base">
        <div id="header">
                <img src="static/images/logo.png">
                <input type="button" value="logout" id="logout_btn" onClick="location.href='admin_logout'">
        </div>
    </div>
</header>
