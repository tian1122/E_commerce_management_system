package com.sie.order;

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

/**
 * getContextPath 取得项目名
 * getServletPath 取得Servlet名
 * getPathInfo 取得Servlet后的URL名，不包括URL参数
 * getRequestURL 取得不包括参数的URL
 * getRequestURI 取得不包括参数的URI，即去掉协议和服务器名的URL
* */
@WebServlet({"/order/*", })
public class Show extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");
        String urlArg = req.getPathInfo();
        String statue = "1";
        switch (urlArg) {
            case "/unfinished":
                statue = "1";
                break;
            case "/finished":
                statue = "2";
                break;
            case "/going":
                statue = "3";
                break;
            case "/refund":
                statue = "4";
                break;
        }
        Statement statement = null;
        ResultSet resultSet = null;

        JSONArray jsonItem = new JSONArray();
        JSONObject jsonData = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        // 定义条目总数
        int count = 0;
        // 定义总共多少页
        int pageNum = 0;
        // 获取到一页显示几个
        int numPage = new Integer(req.getParameter("numPage"));
        // 获取到需要显示第几页
        int toPage = new Integer(req.getParameter("toPage"));
        try {
            Connection connection = JdbcUtil.getConnection();
            statement = connection.createStatement();
            String sql1 = "select count(*) from orders where `status` = " + statue;
            resultSet = statement.executeQuery(sql1);
            // 获取到有多少条数据
            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            if (toPage == 0) {
                toPage = 1;
            }

            int start = 0;
            // 一页展示的数量要小于等于总数量
            if (numPage < count) {
                pageNum = (int) (Math.ceil(count * 1.0 / numPage));
            } else {
                pageNum = 1;
            }

            if (toPage < 0) {
                toPage = pageNum;
            }

            // 总页数与获取到的页数比较
            if (pageNum >= toPage) {
                start = toPage * numPage - 11;
            }

            if (start < 0) {
                start = 0;
            }

            String sql = "select o.orderid, g.goodsname, c.customer_name, o.createtime, c.customer_contact, o.amount, u.username, o.num from orders as o, goods as g, customers as c, users as u where o.goodsid = g.goodsid and o.customerid = c.customerid and o.userid = u.userid and `status` = " + statue
                    + " order by o.createtime desc limit "+ start +", " + numPage;
//            System.out.println(sql);
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                // 获取页面需要的各类数据
                int ordersId = resultSet.getInt("orderid");
                String goodsName = resultSet.getString("goodsname");
                String customerName = resultSet.getString("customer_name");
                String createName = resultSet.getString("createtime");
                String customerContact = resultSet.getString("customer_contact");
                double amount = resultSet.getDouble("amount");
                String adminName = resultSet.getString("username");
                int num = resultSet.getInt("num");
                jsonItem = new JSONArray();
                jsonItem.add(ordersId);
                jsonItem.add(goodsName);
                jsonItem.add(customerName);
                jsonItem.add(createName);
                jsonItem.add(customerContact);
                jsonItem.add(amount);
                jsonItem.add(num);
                jsonItem.add(adminName);
                jsonArray.add(jsonItem);
            }
            jsonData.put("countPage", pageNum);
            jsonData.put("toPage", toPage);
            jsonData.put("data", jsonArray);
            // 返回Json数据
            resp.getWriter().write(String.valueOf(jsonData));
            JdbcUtil.closeResource(connection, statement, resultSet);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
