package com.sie.order;

import com.bean.OrdersBean;
import com.util.JdbcUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/insert.do")
public class Inert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");
        OrdersBean ordersBean = new OrdersBean();
        HttpSession httpSession = req.getSession();
        try {
            Connection connection = JdbcUtil.getConnection();
            Statement statement = null;
            ResultSet resultSet = null;
            statement = connection.createStatement();
            // 执行存储结构
            String sql = "call insertOrder(" + httpSession.getAttribute("userId") + ", @v_out);";
            statement.executeUpdate(sql);
            String sql2 = "select * from orders where orderid = (select @v_out);\n";
            resultSet = statement.executeQuery(sql2);
            if (resultSet.next()) {
                ordersBean.setOrderId(resultSet.getInt("orderid"));
                ordersBean.setOrderIdReadOnly("readonly");
                ordersBean.setAdmin((String) httpSession.getAttribute("username"));
                ordersBean.setAdminReadOnly("readonly");
                ordersBean.setGoodsName("");
                ordersBean.setGoodsNameReadOnly("");
                ordersBean.setCustomersName("");
                ordersBean.setCustomersNameReadOnly("");
                ordersBean.setCreateDate(resultSet.getString("createtime"));
                ordersBean.setCreateDateReadOnly("readonly");
                ordersBean.setContactWay("");
                ordersBean.setContactWayReadOnly("");
                ordersBean.setSubtotal(0);
                ordersBean.setSubtotalReadOnly("readonly");
                ordersBean.setAdminId(Integer.parseInt((String) httpSession.getAttribute("userId")));
                ordersBean.setAdminIdReadOnly("readonly");
                ordersBean.setCustomerId(resultSet.getInt("customerid"));
                ordersBean.setCustomerIdReadOnly("readonly");
                ordersBean.setNum(0);
                ordersBean.setNumReadOnly("");
                httpSession.setAttribute("insertData", ordersBean);
            }
            JdbcUtil.closeResource(connection, statement, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("orders/update.jsp");
    }
}