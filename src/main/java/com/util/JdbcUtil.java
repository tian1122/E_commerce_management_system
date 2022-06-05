package com.util;

import java.sql.*;

public final class JdbcUtil {
    private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/web_management?user=root&password=Tian123%40&characterEncoding=UTF-8";
    private static final String user = "root";
    private static final String password = "TIan123@";

    private JdbcUtil(){}

    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url);
    }
    public static void closeResource(Connection connection, Statement statement, ResultSet resultSet) {
        closeResultSet(resultSet);
        closeStatement(statement);
        closeConnection(connection);
    }

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        connection = null;
    }

    public static void closeStatement(Statement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        statement = null;
    }

    public static void closeResultSet(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        resultSet = null;
    }
}
