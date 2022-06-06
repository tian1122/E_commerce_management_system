<%--
  Created by IntelliJ IDEA.
  User: tian
  Date: 2022/6/5
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${ pageContext.request.scheme }://${ pageContext.request.serverName }:${ pageContext.request.serverPort }${ pageContext.request.contextPath }/">
    <title>修改订单——《Web程序设计》课程设计</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/portal.css">
</head>
<body class="app">
<div class="app-wrapper">
    <jsp:include page="../base/index.jsp">
        <jsp:param name="active" value="2"/>
    </jsp:include>
    <div class="app-content pt-3 p-md-3 p-lg-4">
        <div class="container-xl">
            <div class="row g-3 mb-4 align-items-center justify-content-between">
                <div class="col-auto">
                    <h1 class="app-page-title mb-0">订单</h1>
                </div>
            </div>
            <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start hide" id="view">
                <div class="app-card-header p-3 border-bottom-0">
                    <div class="row align-items-center gx-3">
                        <div class="col-auto">
                            <div class="app-icon-holder">
                                <jsp:include page="../assets/images/orderview.icon.svg.jsp"/>
                            </div>
                        </div>
                        <div class="col-auto">
                            <h4 class="app-card-title">订单操作</h4>
                        </div>
                    </div>
                </div>
                <form class="w-100" action="update.do" method="post">
                    <div class="app-card-body px-4 w-100" id="pageForm">
                    </div>
                    <div class="app-card-footer p-4 mt-auto">
                        <a class="btn app-btn-secondary" href="orders/view.jsp">返回上一级</a>
                        <button type="submit" class="btn btn-success" href="#">保存当前信息</button>
                        <a class="btn btn-danger" id="delete">删除</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="assets/js/jquery-3.6.0.min.js"></script>
<script>
    const pageData = [
        ["订单号", "${ insertData.orderIdReadOnly }", "orderId", "${ insertData.orderId }"],
        ["商品", "${ insertData.goodsNameReadOnly }", "goodsName", "${ insertData.goodsName }"],
        ["顾客", "${ insertData.customersNameReadOnly }", "customersName", "${ insertData.customersName }"],
        ["顾客ID", "${ insertData.customerIdReadOnly }", "customersId", "${ insertData.customerId }"],
        ["日期", "${ insertData.createDateReadOnly }", "createDate", "${ insertData.createDate }"],
        ["联系方式", "${ insertData.contactWayReadOnly }", "contactWay", "${ insertData.contactWay }"],
        ["小计", "${ insertData .subtotalReadOnly}", "subtotal", "${ insertData.subtotal }"],
        ["数量", "${ insertData.numReadOnly }", "num", "${ insertData.num }"],
        ["管理员", "${ insertData.adminReadOnly }", "admin", "${ insertData.admin }"],
        ["管理员ID", "${ insertData.adminIdReadOnly }", "adminId", "${ insertData.adminId }"],
    ]
    const dom = $("#pageForm")
    let html = ""
    for (let i = 0; i < pageData.length; i++) {
        const disable = pageData[i][1] === "readonly"? "cursor-disable": ""
        html += '<div class="item border-bottom pt-3">' +
            '<div class="row justify-content-between align-items-center w-100">' +
            '<div class="col-auto w-100">' +
            '<div class="item-label">' +
            '<strong>' + pageData[i][0] + '</strong>' +
            '</div>' +
            '<div class="item-data w-100">' +
            '<input type="text" class="form-control border-0 w-100 p-0 bg-white ' + disable + '" value="' + pageData[i][3] + '" name="' + pageData[i][2] + '" ' + pageData[i][1] + '/>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '</div>'
    }

    $("#delete").attr("href", "delete.do?ordersId=${ insertData.orderId }")
    dom.html(html).hide().fadeIn()
</script>
</html>

