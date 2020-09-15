<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<header>
    <!-- 로고 시작 -->
    <section class="header_logo" onclick="location.href='..';">
        <img class="ml50" src="../img/logo_kcs.png" alt="관세청로고">
        <div class="logo_name">
            <span class="fs20 fc-white">관세청</span><br>
            <span class="fs10 fc-white SCD1">Korea Customs Service</span>
        </div>
    </section>
    <!-- 로고 끝 -->

    <!-- 메뉴 시작 -->
    <section class="header_menu ml10 mr10">
        <ul class="fs15 fc-white">
            <li>
                <span>반입 DATA 정보</span>
                <nav class="dropdown SCD1 fs15">
                    <a href="#">반입 현황</a>
                    <a href="#">정제 현황</a>
                    <a href="#">학습 현황</a>
                </nav>
            </li>
            <li>
                <span>AI 식별 정보</span>
                <nav class="dropdown SCD1 fs15">
                    <a href="#">AI 식별 현황</a>
                </nav>
            </li>
            <li>
                <span>생성 데이터 정보</span>
                <nav class="dropdown SCD1 fs15">
                    <a href="#">정제 현황</a>
                    <a href="#">학습 현황</a>
                </nav>
            </li>
            <li>
                <span>Total 정제/학습 현황</span>
                <nav class="dropdown SCD1 fs15">
                    <a href="#">정제 현황</a>
                    <a href="#">학습 현황</a>
                </nav>
            </li>
        </ul>
    </section>
    <!-- 메뉴 끝 -->

    <!-- 로그인 시작 -->
    <div class="header_login">
        <sec:authorize access="isAnonymous()">
            <a class="fs20 fc-white SCD1 mr50" href="/login">로그인</a>
            <a class="fs20 fc-white SCD1 mr50" href="/signup">회원가입</a>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <a class="fs20 fc-white SCD1 mr50" href="/userInfo"><%=username%></a>
            <a class="fs20 fc-white SCD1 mr50" href="/logout">로그아웃</a>
        </sec:authorize>

    </div>
    <!-- 로그인 끝 -->
</header>