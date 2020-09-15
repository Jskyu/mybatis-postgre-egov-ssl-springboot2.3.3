<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>WEB MONITORING</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' href='${pageContext.request.contextPath}/css/reset.css' />
    <link rel='stylesheet' href='${pageContext.request.contextPath}/css/common.css' />
    <link rel='stylesheet' href='${pageContext.request.contextPath}/css/login.css' />
  </head>
  <body>
    <!-- 헤더 시작-->
    <%@ include file="../header_login.jsp" %>
    <!-- 헤더 끝-->

    <!-- 로그인 시작-->
    <div class="container">

      <!-- 로그인 제목 시작-->
      <div class="login_title mt80 mb80">
        <span class="fs50 fc-white">로그인</span>
      </div>
      <!-- 로그인 제목 끝-->

      <!-- 로그인 폼 시작-->
      <form action="${pageContext.request.contextPath}/login" class="login_form pt50 pb30" method="POST">
        <label><input type="text" name=username class="fs20 mt20" placeholder="아이디" required></label>
        <label><input type="password" name=password class="fs20 mt20"  placeholder="비밀번호" required></label>
        <button id="login" class="fs20 fc-white mt20 mb20">로그인</button>
        <hr>
        <button id="signup" class="fs20 fc-white mt20 mb20">회원가입</button>
        <ul class="fs15 fc-grey mt10 mb50">
          <li class="ml10 mr10">아이디 찾기</li>
          <li class="ml10 mr10">비밀번호 찾기</li>
        </ul>
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
