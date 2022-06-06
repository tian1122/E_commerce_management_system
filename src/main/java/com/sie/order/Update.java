package com.sie.order;

import com.util.JdbcUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/update.do")
public class Update extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");
        String ordersId = req.getParameter("orderId");
        String goodsName = req.getParameter("goodsName");
        String customersName = req.getParameter("customersName");
        String createDate = req.getParameter("createDate");
        String contactWay = req.getParameter("contactWay");
        String subtotal = req.getParameter("subtotal");
        String num = req.getParameter("num");
        String admin = req.getParameter("admin");
        String adminId = req.getParameter("adminId");
        String customersId = req.getParameter("customersId");
        HttpSession httpSession = req.getSession();
        String userId = (String) httpSession.getAttribute("userId");
        try {
            Connection connection = JdbcUtil.getConnection();
            Statement statement = null;
            statement = connection.createStatement();
            String sql = "call updateOrder(%s, %s, %s, \"%s\", %s, \"%s\", \"%s\")";
            sql = String.format(sql, userId, ordersId, num, goodsName, customersId, customersName, contactWay);
            statement.executeUpdate(sql);
            JdbcUtil.closeResource(connection, statement, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("orders/view.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
