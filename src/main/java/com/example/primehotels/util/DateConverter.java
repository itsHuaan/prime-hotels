package com.example.primehotels.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConverter {
    public static Date stringToDate(String dateString) {
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        try {
            return dateFormat.parse(dateString);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public static java.sql.Date utilDateToSqlDate(Date utilDate) {
        return new java.sql.Date(utilDate.getTime());
    }

    public static java.sql.Date stringToSqlDate(String dateString) {
        Date utilDate = stringToDate(dateString);
        return utilDateToSqlDate(utilDate);
    }

}
