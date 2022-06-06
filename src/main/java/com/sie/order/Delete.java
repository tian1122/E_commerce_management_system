package com.sie.order;

import com.util.JdbcUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/delete.do")
public class Delete extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");
        int ordersId = new Integer(req.getParameter("ordersId"));
        Statement statement = null;
        try {
            Connection connection = JdbcUtil.getConnection();
            statement = connection.createStatement();
            String sql = "delete from orders where orderid = " + ordersId;
            statement.executeUpdate(sql);
            JdbcUtil.closeResource(connection, statement, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("orders/view.jsp");
    }
}
