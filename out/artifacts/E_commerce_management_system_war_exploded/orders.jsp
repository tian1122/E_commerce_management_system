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
    <meta charset="UTF-8">
    <title>orders</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/portal.css">
    <script src="./assets/js/app.js"></script>
</head>
<body>
<div class="app-wrapper">
    <div class="app-content pt-3 p-md-3 p-lg-4">
        <div class="container-xl">
            <div class="row g-3 mb-4 align-items-center justify-content-between">
                <div class="col-auto">
                    <h1 class="app-page-title mb-0">订单</h1>
                </div>
            </div>
        </div>
        <nav id="orders-table-tab" class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
            <a class="flex-sm-fill text-sm-center nav-link active" id="orders-all-tab" data-toggle="tab"
               href="#orders-all" role="tab" aria-controls="orders-all" aria-selected="true">未完成</a>
            <a class="flex-sm-fill text-sm-center nav-link" id="orders-paid-tab" data-toggle="tab" href="#orders-paid"
               role="tab" aria-controls="orders-paid" aria-selected="false">已完成</a>
            <a class="flex-sm-fill text-sm-center nav-link" id="orders-pending-tab" data-toggle="tab"
               href="#orders-pending" role="tab" aria-controls="orders-pending" aria-selected="false">进行中</a>
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
                                    <th class="cell">管理员</th>
                                    <th class="cell"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="cell">#15346</td>
                                    <td class="cell">
                                        <span class="truncate">Lorem ipsum dolor sit amet eget volutpat erat</span>
                                    </td>
                                    <td class="cell">John Sanders</td>
                                    <td class="cell">
                                        <span>17 Oct</span>
                                        <span class="note">2:16 PM</span>
                                    </td>
                                    <td class="cell">
                                        <span class="badge bg-success">Paid</span>
                                    </td>
                                    <td class="cell">$259.35</td>
                                    <td class="cell"></td>
                                    <td class="cell">
                                        <a class="btn-sm app-btn-secondary" href="#">View</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cell">#15345</td>
                                    <td class="cell">
                                        <span class="truncate">Consectetur adipiscing elit</span>
                                    </td>
                                    <td class="cell">Dylan Ambrose</td>
                                    <td class="cell">
                                        <span class="cell-data">16 Oct</span>
                                        <span class="note">03:16 AM</span>
                                    </td>
                                    <td class="cell">
                                        <span class="badge bg-warning">Pending</span>
                                    </td>
                                    <td class="cell">$96.20</td>
                                    <td class="cell"></td>
                                    <td class="cell">
                                        <a type="button" class="btn-sm app-btn-secondary" onclick="onclickView()">查看</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <nav class="app-pagination mt-3">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </div>
            <!--//tab-pane-->
            <div class="tab-pane fade" id="orders-paid" role="tabpanel" aria-labelledby="orders-paid-tab">
                <div class="app-card app-card-orders-table mb-5">
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
                                    <th class="cell">管理员</th>
                                    <th class="cell"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="cell">#15346</td>
                                    <td class="cell">
                                        <span class="truncate">Lorem ipsum dolor sit amet eget volutpat erat</span>
                                    </td>
                                    <td class="cell">John Sanders</td>
                                    <td class="cell">
                                        <span>17 Oct</span>
                                        <span class="note">2:16 PM</span>
                                    </td>
                                    <td class="cell">
                                        <span class="badge bg-success">Paid</span>
                                    </td>
                                    <td class="cell">$259.35</td>
                                    <td class="cell"></td>
                                    <td class="cell">
                                        <a class="btn-sm app-btn-secondary" href="#">View</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cell">#15345</td>
                                    <td class="cell">
                                        <span class="truncate">Consectetur adipiscing elit</span>
                                    </td>
                                    <td class="cell">Dylan Ambrose</td>
                                    <td class="cell">
                                        <span class="cell-data">16 Oct</span>
                                        <span class="note">03:16 AM</span>
                                    </td>
                                    <td class="cell">
                                        <span class="badge bg-warning">Pending</span>
                                    </td>
                                    <td class="cell">$96.20</td>
                                    <td class="cell"></td>
                                    <td class="cell">
                                        <a class="btn-sm app-btn-secondary" href="#">View</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <nav class="app-pagination mt-3">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>

            </div>
            <div class="tab-pane fade" id="orders-pending" role="tabpanel" aria-labelledby="orders-pending-tab">
                <div class="app-card app-card-orders-table mb-5">
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
                                    <th class="cell">管理员</th>
                                    <th class="cell"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="cell">#15346</td>
                                    <td class="cell">
                                        <span class="truncate">Lorem ipsum dolor sit amet eget volutpat erat</span>
                                    </td>
                                    <td class="cell">John Sanders</td>
                                    <td class="cell">
                                        <span>17 Oct</span>
                                        <span class="note">2:16 PM</span>
                                    </td>
                                    <td class="cell">
                                        <span class="badge bg-success">Paid</span>
                                    </td>
                                    <td class="cell">$259.35</td>
                                    <td class="cell"></td>
                                    <td class="cell">
                                        <a class="btn-sm app-btn-secondary" href="#">View</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="cell">#15345</td>
                                    <td class="cell">
                                        <span class="truncate">Consectetur adipiscing elit</span>
                                    </td>
                                    <td class="cell">Dylan Ambrose</td>
                                    <td class="cell">
                                        <span class="cell-data">16 Oct</span>
                                        <span class="note">03:16 AM</span>
                                    </td>
                                    <td class="cell">
                                        <span class="badge bg-warning">Pending</span>
                                    </td>
                                    <td class="cell">$96.20</td>
                                    <td class="cell"></td>
                                    <td class="cell">
                                        <a class="btn-sm app-btn-secondary" href="#">View</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <nav class="app-pagination mt-3">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </div>
        </div>

        <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start hide" id="view">
            <div class="app-card-header p-3 border-bottom-0">
                <div class="row align-items-center gx-3">
                    <div class="col-auto">
                        <div class="app-icon-holder">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-sliders" fill="currentColor"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                      d="M11.5 2a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM9.05 3a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0V3h9.05zM4.5 7a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM2.05 8a2.5 2.5 0 0 1 4.9 0H16v1H6.95a2.5 2.5 0 0 1-4.9 0H0V8h2.05zm9.45 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm-2.45 1a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0v-1h9.05z"></path>
                            </svg>
                        </div>
                        <!--//icon-holder--></div>
                    <!--//col-->
                    <div class="col-auto">
                        <h4 class="app-card-title">Preferences</h4>
                    </div>
                    <!--//col--></div>
                <!--//row--></div>
            <!--//app-card-header-->
            <div class="app-card-body px-4 w-100">
                <div class="item border-bottom py-3">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto">
                            <div class="item-label"><strong>Language </strong></div>
                            <div class="item-data">English</div>
                        </div>
                        <!--//col-->
                        <div class="col text-right"><a class="btn-sm app-btn-secondary" href="#">Change</a></div>
                        <!--//col--></div>
                    <!--//row--></div>
                <!--//item-->
                <div class="item border-bottom py-3">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto">
                            <div class="item-label"><strong>Time Zone</strong></div>
                            <div class="item-data">Central Standard Time(UTC-6)</div>
                        </div>
                        <div class="col text-right"><a class="btn-sm app-btn-secondary" href="#">Change</a></div>
                    </div>
                </div>
                <div class="item border-bottom py-3">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto">
                            <div class="item-label"><strong>Currency</strong></div>
                            <div class="item-data">$(US Dollars)</div>
                        </div>
                        <div class="col text-right"><a class="btn-sm app-btn-secondary" href="#">Change</a></div>
                    </div>
                </div>
                <div class="item border-bottom py-3">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto">
                            <div class="item-label"><strong>Email Subscription</strong></div>
                            <div class="item-data">Off</div>
                        </div>
                        <div class="col text-right"><a class="btn-sm app-btn-secondary" href="#">Change</a></div>
                    </div>
                </div>
                <div class="item border-bottom py-3">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto">
                            <div class="item-label"><strong>SMS Notifications</strong></div>
                            <div class="item-data">On</div>
                        </div>
                        <div class="col text-right"><a class="btn-sm app-btn-secondary" href="#">Change</a></div>
                    </div>
                </div>
            </div>
            <div class="app-card-footer p-4 mt-auto"><a class="btn app-btn-secondary" href="#">Manage Preferences</a>
            </div>
        </div>
    </div>
</div>

<script src="assets/js/jquery-3.6.0.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script>
    function onclickView(){
        $('#orders-table-tab-content').hide()
        $('#orders-table-tab').hide()
        $('#view').show()
    }
</script>
</body>
</html>
