package com.example.javaweb;
import java.sql.*;
import java.time.LocalDateTime;

public class user_reg {

    public static void create(String email, String password, String first_name, String last_name, String addr, String phno) throws SQLException, ClassNotFoundException {
        data_con connect = new data_con();
        try {
            String insertQuery = "INSERT INTO users_reg (email, password,first_name,last_name,address,phno) VALUES (?, ?, ?,?,?,?)";
            PreparedStatement preparedStatement = connect.con.prepareStatement(insertQuery);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, first_name);
            preparedStatement.setString(4, last_name);
            preparedStatement.setString(5, addr);
            preparedStatement.setString(6, phno);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connect.con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean login(String username, String password) throws SQLException, ClassNotFoundException {
        data_con connect = new data_con();
        System.out.println("username: " + username + " password: " + password);
        try {
            String insertQuery = "INSERT INTO user_login (username, paswd,datetime) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connect.con.prepareStatement(insertQuery);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connect.con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

}


