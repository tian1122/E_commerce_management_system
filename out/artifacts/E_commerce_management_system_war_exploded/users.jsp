<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tian
  Date: 2022/6/2
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${ empty username }">
    <jsp:forward page="login.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>users</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/portal.css">
</head>
<body>
<div class="app-wrapper">
    <div class="app-content pt-3 p-md-3 p-lg-4">
        <div class="container-xl">
            <h1 class="app-page-title">用户中心</h1>
            <hr class="mb-4">
            <div class="row g-4 users-section">
                <div class="col-12 col-md-4">
                    <h3 class="section-title">基本信息</h3>
                    <div class="section-intro">
                        你可以查看和修改你的基本信息。
                    </div>
                </div>
                <div class="col-12 col-md-8">
                    <div class="app-card app-card-users shadow-sm p-4">
                        <div class="app-card-body">
                            <form>
                                <div class="mb-3">
                                    <label for="user-input-1" class="form-label">
                                        用户名
                                    </label>
                                    <input type="text" class="form-control" id="user-input-1" readonly required value="${ username }">
                                </div>
                                <div class="mb-3">
                                    <label for="user-input-2" class="form-label">联系方式</label>
                                    <input type="text" class="form-control" id="user-input-2" value="Steve Doe"
                                           required>
                                </div>
                                <div class="mb-3">
                                    <label for="user-input-3" class="form-label">修改密码</label>
                                    <input type="email" class="form-control" id="user-input-3" value="">
                                </div>
                                <button type="submit" class="btn app-btn-primary">保存</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="my-4">
            <div class="row g-4 users-section">
                <div class="col-12 col-md-4">
                    <h3 class="section-title">退出登录</h3>
                    <div class="section-intro">
                        安全的离开电商后台管理系统。
                    </div>
                </div>
                <div class="col-12 col-md-8">
                    <div class="app-card app-card-users shadow-sm p-4">
                        <div class="app-card-body">
                            <form method="post" action="login.jsp" target="test">
                                <button type="submit" class="btn btn-danger text-white">退出登录</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

