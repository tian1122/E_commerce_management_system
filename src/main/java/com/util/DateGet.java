package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateGet {

    public ArrayList<String> getDays(int intervals) {
        ArrayList<String> pastDaysList = new ArrayList<>();
        for (int i = intervals -1; i >= 0; i--) {
            int past = i;
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);
            Date today = calendar.getTime();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String result = format.format(today);
            pastDaysList.add(result);
        }
        return pastDaysList;
    }

    //获取最近一年的月份
    public ArrayList<String> getThisYearMonths(){
        //建一个容器
        ArrayList<String> months=new ArrayList<>();
        //获取日历对象
        Calendar calendar = Calendar.getInstance();
        //调整到12个月以前
        calendar.add(Calendar.MONTH,-11);
        //循环12次获取12个月份
        for (int i = 0; i < 12; i++) {
            //日历对象转为Date对象
            Date date = calendar.getTime();
            //将date转为字符串
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
            String dateStr = sdf.format(date);
            //向list集合中添加
            months.add(dateStr);
            //每次月份+1
            calendar.add(Calendar.MONTH,1);
        }
        return months;
    }
}
