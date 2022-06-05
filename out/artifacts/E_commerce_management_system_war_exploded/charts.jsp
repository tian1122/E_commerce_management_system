<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tian
  Date: 2022/5/28
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>charts</title>
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
            <h1 class="app-page-title">图表</h1>
            <div class="row g-4 mb-4">
                <div class="col-12 col-lg-6">
                    <div class="app-card app-card-chart h-100 shadow-sm">
                        <div class="app-card-header p-3 border-0">
                            <h4 class="app-card-title">近一年订单量趋势图</h4>
                        </div>
                        <div class="app-card-body p-4">
                            <div class="chart_div" style="height: 250px">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="app-card app-card-chart h-100 shadow-sm">
                        <div class="app-card-header p-3 border-0">
                            <h4 class="app-card-title">近一年订单金额柱形图</h4>
                        </div>
                        <div class="app-card-body p-4">
                            <div class="chart_div" style="height: 250px">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="app-card app-card-chart h-100 shadow-sm">
                        <div class="app-card-header p-3 border-0">
                            <h4 class="app-card-title">操作员操作占比饼状图</h4>
                        </div>
                        <div class="app-card-body p-4">
                            <div class="chart_div" style="height: 250px">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="app-card app-card-chart h-100 shadow-sm">
                        <div class="app-card-header p-3 border-0">
                            <h4 class="app-card-title">订单类型环形图</h4>
                        </div>
                        <div class="app-card-body p-4">
                            <div class="chart_div" style="height: 250px">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/useAjax.js"></script>
<script>
    // 创建图表
    getChartData(null, 'chart/chartPage', (e) => {
        console.log("chart数据为：", e);
        const chartDoc = document.getElementsByClassName('chart_div')
        const myChart1 = echarts.init(chartDoc[0]);
        const option1 = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'line'
                }
            },
            xAxis: {
                type: 'category',
                data: e.line.xData
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    data: e.line.yData,
                    type: 'line',
                    smooth: true
                }
            ]
        };
        myChart1.setOption(option1)
        const myChart2 = echarts.init(chartDoc[1]);
        const option2 = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: e.bar.xData,
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: 'Direct',
                    type: 'bar',
                    barWidth: '60%',
                    data: e.bar.yData
                }
            ]
        };
        myChart2.setOption(option2);
        const myChart3 = echarts.init(chartDoc[2]);
        const option3 = {
            tooltip: {
                trigger: 'item'
            },
            legend: {
                orient: 'vertical',
                left: 'left'
            },
            series: [
                {
                    name: '管理员',
                    type: 'pie',
                    radius: '50%',
                    data: e.pie,
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        myChart3.setOption(option3);
        const myChart4 = echarts.init(chartDoc[3]);
        const option4 = {
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b}: {c} ({d}%)'
            },
            series: [
                {
                    name: '状态',
                    type: 'pie',
                    selectedMode: 'single',
                    radius: [0, '30%'],
                    label: {
                        position: 'inner',
                        fontSize: 12
                    },
                    labelLine: {
                        show: false
                    },
                    data: e.pie2
                },
                {
                    name: '名称',
                    type: 'pie',
                    radius: ['45%', '60%'],
                    labelLine: {
                        length: 30
                    },
                    label: {
                        formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                        backgroundColor: '#F6F8FC',
                        borderColor: '#8C8D8E',
                        borderWidth: 1,
                        borderRadius: 4,
                        rich: {
                            a: {
                                color: '#6E7079',
                                lineHeight: 22,
                                align: 'center'
                            },
                            hr: {
                                borderColor: '#8C8D8E',
                                width: '100%',
                                borderWidth: 1,
                                height: 0
                            },
                            b: {
                                color: '#4C5058',
                                fontSize: 14,
                                fontWeight: 'bold',
                                lineHeight: 33
                            },
                            per: {
                                color: '#fff',
                                backgroundColor: '#4C5058',
                                padding: [3, 4],
                                borderRadius: 4
                            }
                        }
                    },
                    data: e.pie3
                }
            ]
        };
        myChart4.setOption(option4)
    }, "get")
</script>
</body>
</html>
