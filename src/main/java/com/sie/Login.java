package com.sie;

import com.util.JdbcUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/login.do")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String username = new String(req.getParameter("username"));
        String password = new String(req.getParameter("password"));
        HttpSession httpSession = req.getSession();
        String loginMsg = null;
        if (username.equals("")) {
            loginMsg = "登录失败，用户名为空！";
            httpSession.setAttribute("loginMsg", loginMsg);
            resp.sendRedirect("login.jsp");
        }else if (password.equals("")) {
            loginMsg = "登录失败，密码为空！";
            httpSession.setAttribute("loginMsg", loginMsg);
            resp.sendRedirect("login.jsp");
        } else {
          try{
              Connection connection = JdbcUtil.getConnection();
              Statement statement = null;
              ResultSet resultSet = null;
              statement = connection.createStatement();
              String sql = "select * from users where username = '"+ username + "' and password='" + password + "'";
              resultSet = statement.executeQuery(sql);
              if (resultSet.next()) {
                  httpSession.setAttribute("username", username);
                  resp.sendRedirect("index.jsp");
              }else {
                  loginMsg = "登录失败，用户名或者密码错误！";
                  httpSession.setAttribute("loginMsg", loginMsg);
                  resp.sendRedirect("login.jsp");
              }
              JdbcUtil.closeResource(connection, statement, resultSet);
          } catch (Exception e) {
              e.printStackTrace();
          }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
