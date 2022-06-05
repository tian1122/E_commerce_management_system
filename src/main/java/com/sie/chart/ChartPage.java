package com.sie.chart;

import com.util.DateGet;
import com.util.JdbcUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet("/chart/chartPage")
public class ChartPage extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");
        Statement statement = null;
        ResultSet resultSet = null;
        JSONObject jsonObject = new JSONObject();
        JSONObject jsonObjectPie = new JSONObject();
        JSONObject jsonObjectOver = new JSONObject();
        DateGet dateGet = new DateGet();
        ArrayList<String> dateList = dateGet.getThisYearMonths();
        ArrayList<String> sqlDateList = new ArrayList<>();
        ArrayList<Integer> sqlIntList = new ArrayList<>();
        ArrayList<Double> sqlDoubleList = new ArrayList<>();
        double[] amountAll = new double[12];
        int[] numAll = new int[12];
        try {
            Connection connection = JdbcUtil.getConnection();
            statement = connection.createStatement();
            // 查询近一年的订单信息
            String sqlGetYear = "select *, sum(num) as numAll,  sum(amount) as amountAll from (select *, DATE_FORMAT(createtime,'%Y-%m') as smallDate from orders) as o, (SELECT DATE_FORMAT(CURDATE(), '%Y-%m') AS `month` UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 1 MONTH), '%Y-%m') AS `month` UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 2 MONTH), '%Y-%m') AS `month` UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 3 MONTH), '%Y-%m') AS `month` UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 4 MONTH), '%Y-%m') AS `month` UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 5 MONTH), '%Y-%m') AS `month` UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 6 MONTH), '%Y-%m') AS `month` UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 7 MONTH), '%Y-%m') AS `month` UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 8 MONTH), '%Y-%m') AS `month` UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 9 MONTH), '%Y-%m') AS `month` UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 10 MONTH), '%Y-%m') AS `month` UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 11 MONTH), '%Y-%m') AS `month`) as mymonth where mymonth.month = o.smallDate group by o.smallDate;";
            // 查询用户操作频率
            String sqlGetUserDo = "select a.username, s.num from users as a, (select count(*) as num, userid from orders group by userid) as s where s.userid = a.userid;";
            // 查询订单状态
            String sqlGetStatus = "select count(`status`) as countStatus, `status` from orders group by `status`;";
            // 查询商品出售情况
            String sqlGetGoods = "select sum(num) as countNum, goodsname from goods as g, orders as o where o.goodsid = g.goodsid group by goodsname";
            // 第一个图
            resultSet = statement.executeQuery(sqlGetYear);
            // 第一部分：包含一个折线图和一个柱形图
            while (resultSet.next()) {
                double amount = resultSet.getDouble("amountAll");
                int num = resultSet.getInt("numAll");
                String date = resultSet.getString("smallDate");
                sqlDateList.add(date);
                sqlIntList.add(num);
                sqlDoubleList.add(amount);
            }
            // 对数据进行处理
            for (int i = 0; i < dateList.size(); i++) {
                for (int j = 0; j < sqlDateList.size(); j++) {
                    if (dateList.get(i).equals(sqlDateList.get(j))) {
                        amountAll[i] = sqlDoubleList.get(j);
                        numAll[i] = sqlIntList.get(j);
                        break;
                    }
                }
            }

            // 第三个图
            resultSet = statement.executeQuery(sqlGetUserDo);
            JSONArray jsonArrayPie = new JSONArray();
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                int numDo = resultSet.getInt("num");
                jsonObjectPie.put("name", username);
                jsonObjectPie.put("value", numDo);
                jsonArrayPie.add(jsonObjectPie);
            }

            // 第四个图
            resultSet = statement.executeQuery(sqlGetStatus);
            JSONArray jsonArrayPie2 = new JSONArray();
            while (resultSet.next()) {
                int status = resultSet.getInt("status");
                int countStatus = resultSet.getInt("countStatus");
                String s = "";
                switch (status) {
                    case 1:
                        s = "未完成";
                        break;
                    case 2:
                        s = "已完成";
                        break;
                    case 3:
                        s = "进行中";
                        break;
                    case 4:
                        s = "已退款";
                        break;
                }
                jsonObjectPie.put("value", countStatus);
                jsonObjectPie.put("name", s);
                jsonArrayPie2.add(jsonObjectPie);
            }
            // 第四个图第二部分
            JSONArray jsonArrayPie3 = new JSONArray();
            resultSet = statement.executeQuery(sqlGetGoods);
            while (resultSet.next()) {
                int countNum = resultSet.getInt("countNum");
                String goodsName = resultSet.getString("goodsname");
                jsonObjectPie.put("vale", countNum);
                jsonObjectPie.put("name", goodsName);
                jsonArrayPie3.add(jsonObjectPie);
            }
            // 第一个折线图
            jsonObject.put("xData", dateList);
            jsonObject.put("yData", numAll);
            jsonObjectOver.put("line", jsonObject);
            // 第二个柱形图
            jsonObject.put("xData", dateList);
            jsonObject.put("yData", amountAll);
            jsonObjectOver.put("bar", jsonObject);
            // 第三个饼图
            jsonObjectOver.put("pie", jsonArrayPie);
            // 第四个双饼图
            jsonObjectOver.put("pie2", jsonArrayPie2);
            jsonObjectOver.put("pie3", jsonArrayPie3);
            // 返回Json数据
            resp.getWriter().write(String.valueOf(jsonObjectOver));
            JdbcUtil.closeResource(connection, statement, resultSet);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
