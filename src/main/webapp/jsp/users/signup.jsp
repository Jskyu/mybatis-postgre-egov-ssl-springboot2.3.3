<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>WEB MONITORING</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' href='../../css/reset.css' />
    <link rel='stylesheet' href='../../css/common.css' />
    <link rel='stylesheet' href='../../css/login.css' />
  </head>
  <body>
    <!-- 헤더 시작-->
    <%@ include file="../header_login.jsp" %>
    <!-- 헤더 끝-->

    <!-- 로그인 시작-->
    <div class="container">

      <!-- 로그인 제목 시작-->
      <div class="login_title mt80 mb80">
        <span class="fs50 fc-white">회원가입</span>
      </div>
      <!-- 로그인 제목 끝-->

      <!-- 로그인 폼 시작-->
      <form action="/signup" class="login_form pt50 pb30" method="POST" object="${userDTO}">
        <input type="text" name=username class="fs20 mt20" placeholder="username" required>
        <input type="password" name=password class="fs20 mt20"  placeholder="password" required>
        <input type="password" name=confirmPassword class="fs20 mt20"  placeholder="password" required>
        <input type="text" name=country class="fs20 mt20"  placeholder="country" required>
        <button id="signup" class="fs20 fc-white mt20 mb20">회원가입</button>
        <hr>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      </form>
      <!-- 로그인 폼 끝-->
    </div>
    <!-- 로그인 끝-->

    <!-- 푸터 시작 -->
    <%@ include file="../footer.jsp" %>
    <!-- 푸터 끝 -->
  </body>
</html>
