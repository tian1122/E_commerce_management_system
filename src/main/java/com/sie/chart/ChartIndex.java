package com.sie.chart;


import com.util.DateGet;
import com.util.JdbcUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet("/chart/index")
public class ChartIndex extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");
        try {
//            JSONArray jsonValues = new JSONArray();
            JSONObject jsonObject = new JSONObject();
            JSONObject jsonObject1 = new JSONObject();
            DateGet dateGet = new DateGet();
            // 数据库中的日期数组
            ArrayList<String> arrayList = new ArrayList<>();
            // 数据库中的金额数组
            ArrayList<Double> arrayList1 = new ArrayList<>();
            // 一周日期数组
            ArrayList<String> arrayList2 = dateGet.getDays(7);
            // 需要返回的金额数组
            double[] doubleArrayList = new double[7];
            // 建立数据库连接
            Connection connection = JdbcUtil.getConnection();
            Statement statement = null;
            ResultSet resultSet = null;
            statement = connection.createStatement();
            String sql = "SELECT sum(amount) as amountAll,  date_format(createtime,'%Y-%m-%d') as time FROM orders  WHERE DATEDIFF(createtime,NOW())<=0 AND DATEDIFF(createtime,NOW())>-7 group by time";
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                double amount = resultSet.getDouble("amountAll");
                String date = resultSet.getString("time");
                arrayList.add(date);
                arrayList1.add(amount);
            }
            for (int i = 0; i < arrayList2.size(); i++) {
                for (int j = 0; j < arrayList.size(); j++) {
                    if (arrayList2.get(i).equals(arrayList.get(j))){
                        doubleArrayList[i] = arrayList1.get(j);
                        break;
                    }
                }
            }
            jsonObject.put("yData", doubleArrayList);
            jsonObject.put("xData", arrayList2);

            // bar data waiting for apply

            jsonObject1.put("lineChart", jsonObject);
            jsonObject1.put("barChart", jsonObject);
            resp.getWriter().write(String.valueOf(jsonObject));
            JdbcUtil.closeResource(connection, statement, resultSet);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
