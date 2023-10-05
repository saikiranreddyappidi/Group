package com.example.javaweb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class data_con{
    Connection con;
    data_con() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/railway", "root", "password");
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        data_con obj = new data_con();
    }
}
