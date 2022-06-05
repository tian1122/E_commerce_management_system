function getChartData(data, url, fn, method) {
    $.ajax({
        url: url,
        type: method,
        data: data,
        success: (e) => {
            fn(e)
        },
        error: (e) => {
            console.log("请求发生错误！", e)
        }
    })
}