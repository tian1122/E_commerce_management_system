<%--
  Created by IntelliJ IDEA.
  User: tian
  Date: 2022/6/2
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh">
<head>
  <title>电商后台管理系统 - 《Web程序设计》课程设计</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/portal.css">
</head>
<body class="app app-login p-0">
<div class="row g-0 app-auth-wrapper">
  <div class="col-12 col-md-7 col-lg-6 auth-main-col text-center p-5 login-margin">
    <div class="d-flex flex-column align-content-end">
      <div class="app-auth-body mx-auto">
        <h2 class="auth-heading text-center mb-5">欢迎登录电商后台管理系统</h2>
        <div class="auth-form-container text-left">
          <form class="auth-form login-form" action="login.do" method="post">
            <div class="email mb-3">
              <label class="sr-only" for="signin-user">UserName</label>
              <input id="signin-user" name="username" type="text" class="form-control signin-email" placeholder="UserName" required="required">
            </div>
            <div class="password mb-3">
              <label class="sr-only" for="signin-password">Password</label>
              <input id="signin-password" name="password" type="password" class="form-control signin-password" placeholder="Password" required="required">
            </div>
            <div class="text-center mb-3">
              <c:remove var="username"/>
              <c:if test="${ not empty loginMsg }">
                <span class="text-danger">${ loginMsg }</span>
                <c:remove var="loginMsg"/>
              </c:if>
            </div>
            <div class="text-center">
              <button type="submit" class="btn app-btn-primary btn-block theme-btn mx-auto">登录</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="col-12 col-md-5 col-lg-6 h-100 auth-background-col">
    <div class="auth-background-holder"></div>
  </div>
</div>
</body>
</html>

