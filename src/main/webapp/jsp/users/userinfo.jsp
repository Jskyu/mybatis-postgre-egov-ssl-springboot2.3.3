<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="com.example.demo.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
    String username = "";
    if(principal instanceof UserDTO){
        username = ((UserDTO) principal).getUsername();
    }
%>
<html>
<head>
    <title>
        개인정보 페이지
    </title>
</head>
<body>
<div class="container">
    <a class="fs20 fc-white SCD1 mr50"><%=username%>님의 개인정보 페이지</a>
    <div>
        <button onclick="history.back()">뒤로 가기</button>
    </div>
</div>
</body>

</html>
