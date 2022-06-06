<%--
  Created by IntelliJ IDEA.
  User: tian
  Date: 2022/5/28
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${ pageContext.request.scheme }://${ pageContext.request.serverName }:${ pageContext.request.serverPort }${ pageContext.request.contextPath }/">
    <meta charset="UTF-8">
    <title>订单管理——《Web程序设计》课程设计</title>
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

        <nav id="orders-table-tab" class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
            <a class="flex-sm-fill text-sm-center nav-link active tag-nav" href="javascript:void(0);" onclick="changeType('unfinished', this)">未完成</a>
            <a class="flex-sm-fill text-sm-center nav-link tag-nav" href="javascript:void(0);" onclick="changeType('finished', this)">已完成</a>
            <a class="flex-sm-fill text-sm-center nav-link tag-nav" href="javascript:void(0);" onclick="changeType('going', this)">进行中</a>
            <a class="flex-sm-fill text-sm-center nav-link tag-nav" href="javascript:void(0);" onclick="changeType('refund', this)">已退款</a>
        </nav>
        <div class="tab-content" id="orders-table-tab-content">
            <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
                <div class="app-card app-card-orders-table shadow-sm mb-5">
                    <div class="app-card-body">
                        <div class="table-responsive">
                            <table class="table app-table-hover mb-0 text-left">
                                <thead>
                                <tr>
                                    <th class="cell">订单号</th>
                                    <th class="cell">商品</th>
                                    <th class="cell">顾客</th>
                                    <th class="cell">日期</th>
                                    <th class="cell">联系方式</th>
                                    <th class="cell">小计</th>
                                    <th class="cell">数量</th>
                                    <th class="cell">管理员</th>
                                    <th class="cell"></th>
                                </tr>
                                </thead>
                                <tbody id="itemView">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <nav class="app-pagination">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="insert.do">新建</a></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getData('Previous')">首页</a></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getData('Before')">上一页</a></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getData('Next')">下一页</a></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getData('Last')">尾页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script src="assets/js/jquery-3.6.0.min.js"></script>
<script src="assets/js/useAjax.js"></script>
<script>
    let page = 1;
    let maxPage = 0;
    let viewType = "unfinished"
    const navTag= $("nav > a")
    function changeType(viewTypeA, that) {
        viewType = viewTypeA;
        for (let i = 0; i < navTag.length; i++) {
            navTag[i].classList.remove("active")
        }
        that.classList.add("active")
        getData('')
    }
    function getData(arg) {
        let url = "order/" + viewType + "?numPage=10&toPage=1"
        switch (arg) {
            case 'Previous':
                url = "order/" + viewType + "?numPage=10&toPage=1"
                break;
            case 'Last':
                page = maxPage
                url = "order/" + viewType + "?numPage=10&toPage=-1"
                break
            case 'Before':
                page -= 1
                if (page <= 0)
                    page = maxPage
                url = "order/" + viewType + "?numPage=10&toPage=" + page
                break
            case 'Next':
                page += 1
                if (page > maxPage)
                    page = 1
                url = "order/" + viewType + "?numPage=10&toPage=" + page
                break
        }
        getXhrData(null, url, (e) => {
            let html = "<tr>"
            let myOrdersId;
            for (let i = 0; i < e.data.length; i++) {
                myOrdersId =  e.data[i][0]
                for (let j = 0; j < e.data[i].length; j ++) {
                    e.data[i][0] = "#" + e.data[i][0]
                    html += "<td class=\"cell\">"+ e.data[i][j] +"</td>"
                }
                html += "<td class=\"cell\"><a class=\"btn-sm app-btn-secondary\" href=\"beforeUpdate.do?orderId=" + myOrdersId + "\">查看</a></td></tr><tr>"
            }
            html += "</tr>"
            $("#itemView").html(html).hide().fadeIn()
            maxPage = e.countPage
        }, "get")
    }
    getData('')
</script>
</body>
</html>
