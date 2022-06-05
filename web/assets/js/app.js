function onChangePage(arg, that) {
    console.log(arg)
    const iframeDom = $('#page_iframe')
    const onActiveList = $('.onActive')
    if (arg !== 'view') {
        for (let i = 0; i <= 4; i++) {
            onActiveList[i].classList.remove('active')
        }
        that.classList.add('active')
    }
    switch (arg) {
        case 'overview':
            iframeDom.attr('src', './overview.jsp')
            break;
        case 'chart':
            iframeDom.attr('src', './charts.jsp')
            break;
        case 'orders':
            iframeDom.attr('src', './orders.jsp')
            break;
        case 'help':
            iframeDom.attr('src', './helps.jsp')
            break;
        case 'user':
            iframeDom.attr('src', './users.jsp')
            break;
    }
}