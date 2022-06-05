window.onload = () => {
    const chartDoc = document.getElementsByClassName('chart_div')
    for (let i = 0; i < chartDoc.length; i++) {
        const myChart = echarts.init(chartDoc[i]);

        // 指定图表的配置项和数据
        const option = {
            tooltip: {},
            legend: {
                data: ['销量']
            },
            xAxis: {
                data: ['衬衫', '羊毛衫', '雪纺衫', '裤子', '高跟鞋', '袜子']
            },
            yAxis: {},
            series: [
                {
                    name: '销量',
                    type: 'bar',
                    data: [5, 20, 36, 10, 10, 20]
                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }
}
