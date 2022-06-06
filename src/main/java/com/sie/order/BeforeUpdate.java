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

@WebServlet("/beforeUpdate.do")
public class BeforeUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");
        String ordersId = req.getParameter("orderId");
        OrdersBean ordersBean = new OrdersBean();
        HttpSession httpSession = req.getSession();
        try {
            Connection connection = JdbcUtil.getConnection();
            Statement statement = null;
            ResultSet resultSet = null;
            statement = connection.createStatement();
            // 执行存储结构
            String sql = "SELECT u.userid, o.orderid, o.amount, o.createtime, o.num, c.customer_name, c.customerid, c.customer_contact, u.username, g.goodsname FROM `orders` as o, customers as c, goods as g, users as u where u.userid = o.userid and c.customerid = o.customerid and g.goodsid = o.goodsid and orderid =" + ordersId;
            resultSet = statement.executeQuery(sql);
            if (resultSet.next()) {
                ordersBean.setOrderId(resultSet.getInt("orderid"));
                ordersBean.setOrderIdReadOnly("readonly");
                ordersBean.setAdmin(resultSet.getString("username"));
                ordersBean.setAdminReadOnly("readonly");
                ordersBean.setGoodsName(resultSet.getString("goodsname"));
                ordersBean.setGoodsNameReadOnly("readonly");
                ordersBean.setCustomersName(resultSet.getString("customer_name"));
                ordersBean.setCustomersNameReadOnly("readonly");
                ordersBean.setCreateDate(resultSet.getString("createtime"));
                ordersBean.setCreateDateReadOnly("readonly");
                ordersBean.setContactWay(resultSet.getString("customer_contact"));
                ordersBean.setContactWayReadOnly("");
                ordersBean.setSubtotal(resultSet.getInt("amount"));
                ordersBean.setSubtotalReadOnly("readonly");
                ordersBean.setAdminId(resultSet.getInt("userid"));
                ordersBean.setAdminIdReadOnly("readonly");
                ordersBean.setCustomerId(resultSet.getInt("customerid"));
                ordersBean.setCustomerIdReadOnly("readonly");
                ordersBean.setNum(resultSet.getInt("num"));
                ordersBean.setNumReadOnly("readonly");
                httpSession.setAttribute("insertData", ordersBean);
            }
            JdbcUtil.closeResource(connection, statement, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("orders/update.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
