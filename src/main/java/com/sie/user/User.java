package com.sie.user;

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

@WebServlet("/user.do")
public class User extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String contactWay = req.getParameter("contactWay");
        HttpSession httpSession = req.getSession();
        Statement statement;
        try {
            Connection connection = JdbcUtil.getConnection();
            statement = connection.createStatement();
            String sql1 = "update users set `password` = \"" + password + "\" where username = \"" + username + "\"";
            String sql2 = "update users set `contact_way` = \"" + contactWay + "\" where username = \"" + username + "\"";
            if (!(password == null ||password.equals(""))) {
                statement.executeUpdate(sql1);
                httpSession.setAttribute("password", password);
            }
            if (!(contactWay == null || contactWay.equals(""))) {
                statement.executeUpdate(sql2);
                httpSession.setAttribute("contactWay", contactWay);
            }
            resp.sendRedirect("user/users.jsp");
            JdbcUtil.closeResource(connection, statement, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
