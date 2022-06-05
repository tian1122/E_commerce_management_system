<%@ page import="com.util.JdbcUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: tian
  Date: 2022/5/28
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>overview</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/portal.css">
    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/echarts.min.js"></script>
</head>
<body>
<c:if test="${ empty username }">
    <jsp:forward page="login.jsp"/>
</c:if>
<div class="app-wrapper">
    <div class="app-content pt-3 p-md-3 p-lg-4">
        <div class="container-xl">
            <h1 class="app-page-title">概览</h1>
            <%
                double todaySubtotal = 0;
                int orderTotal = 0;
                int orderDone = 0;
                int orderGoing = 0;
                // 到数据库中查询页面所需要的数据
                try {
                    Connection connection = JdbcUtil.getConnection();
                    Statement statement = null;
                    ResultSet resultSet = null;
                    statement = connection.createStatement();
                    // 获取当前日期
                    Date dNow = new Date( );
                    SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
                    // 查询今日金额小计
                    String sql = "select amount, status from orders where createtime like '"+ ft.format(dNow) + "%'";
                    resultSet = statement.executeQuery(sql);
                    // 读取数据
                    while (resultSet.next()) {
                        double s = resultSet.getDouble("amount");
                        int status = resultSet.getInt("status");
                        todaySubtotal += s;
                        orderTotal += 1;
                        switch ((int)status) {
                            case 1:
                                break;
                            case 2:
                                orderDone ++;
                                break;
                            case 3:
                                orderGoing ++;
                                break;
                        }
                    }
                    JdbcUtil.closeResource(connection, statement, resultSet);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
            <div class="row g-4 mb-4">
                <div class="col-6 col-lg-3">
                    <div class="app-card app-card-stat shadow-sm h-100">
                        <div class="app-card-body p-3 p-lg-4">
                            <h4 class="stats-type mb-1">今日销售额</h4>
                            <% out.print("<div class=\"stats-figure\">" + todaySubtotal + "</div>"); %>
                            <div class="stats-meta text-success">
                                ￥
                            </div>
                        </div>
                        <a class="app-card-link-mask" href="#"></a></div>
                </div>
                <div class="col-6 col-lg-3">
                    <div class="app-card app-card-stat shadow-sm h-100">
                        <div class="app-card-body p-3 p-lg-4">
                            <h4 class="stats-type mb-1">今日订单总数</h4>
                            <% out.print("<div class=\"stats-figure\">" + orderTotal + "</div>"); %>
                            <div class="stats-meta text-success">
                                个
                            </div>
                        </div>
                        <a class="app-card-link-mask" href="#"></a></div>
                    </div>
                <div class="col-6 col-lg-3">
                    <div class="app-card app-card-stat shadow-sm h-100">
                        <div class="app-card-body p-3 p-lg-4">
                            <h4 class="stats-type mb-1">已完成</h4>
                            <% out.print("<div class=\"stats-figure\">" + orderDone + "</div>"); %>
                            <div class="stats-meta">Done</div>
                        </div>
                        <a class="app-card-link-mask" href="#"></a></div>
                </div>
                <div class="col-6 col-lg-3">
                    <div class="app-card app-card-stat shadow-sm h-100">
                        <div class="app-card-body p-3 p-lg-4">
                            <h4 class="stats-type mb-1">进行中</h4>
                            <% out.print("<div class=\"stats-figure\">" + orderGoing + "</div>"); %>
                            <div class="stats-meta">Going</div>
                        </div>
                        <a class="app-card-link-mask" href="#"></a></div>
                </div>
            </div>
            <div class="row g-4 mb-4">
                <div class="col-12 col-lg-6">
                    <div class="app-card app-card-chart h-100 shadow-sm">
                        <div class="app-card-header p-3">
                            <div class="row justify-content-between align-items-center">
                                <div class="col-auto">
                                    <h4 class="app-card-title">周数据变化趋势图</h4>
                                </div>
                            </div>
                        </div>
                        <div style="height: 350px" class="chart_div p-3"></div>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="app-card app-card-chart h-100 shadow-sm">
                        <div class="app-card-header p-3">
                            <div class="row justify-content-between align-items-center">
                                <div class="col-auto">
                                    <h4 class="app-card-title">周数据变化柱形图</h4>
                                </div>
                            </div>
                        </div>
                        <div style="height: 350px" class="chart_div p-3"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/useAjax.js"></script>
<script>
    // 创建图表
    getXhrData(null, 'chart/index', (e) => {
        var chartType = ['line', 'bar']
        var chartTooltip = ['line', 'shadow']
        const chartDoc = document.getElementsByClassName('chart_div')
        for (let i = 0; i < chartDoc.length; i++) {
            const myChart = echarts.init(chartDoc[i]);

            // 指定图表的配置项和数据
            const option = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: chartTooltip[i]
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                legend: {
                    data: ['销售额']
                },
                xAxis: {
                    type: 'category',
                    data: e.xData,
                    axisTick: {
                        alignWithLabel: true
                    },
                    axisLabel: {
                        interval:0,
                        rotate:40
                    },
                },
                yAxis: {},
                series: [
                    {
                        name: '销售额',
                        smooth: true,
                        type: chartType[i],
                        data: e.yData
                    }
                ]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }

    }, 'get')
</script>
</body>
</html>
