<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="com.example.demo.dto.UserDTO" %>
<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    Object principal = auth.getPrincipal();
    String username = "";
    if(principal instanceof UserDTO){
        username = ((UserDTO) principal).getUsername();
    }
%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>로그인 성공</title>
</head>
<body>
<h1>로그인 성공!!</h1>
<hr>
<p>
    <sec:authorize access="isAuthenticated()">
        <%=username%>님 반갑습니다<br/>
        <a href="/">메인으로 이동</a>
    </sec:authorize>
</p>
</body>
</html>