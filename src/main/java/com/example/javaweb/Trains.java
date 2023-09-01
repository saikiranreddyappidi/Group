package com.example.javaweb;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.Objects;

public class Trains {

    public static boolean create(String email, String password, String first_name, String last_name, String addr, String phno) throws SQLException, ClassNotFoundException {
        try {
            data_con connect = new data_con();
            System.out.println(email + password + first_name);
            String insertQuery = "INSERT INTO railway.users_reg (email, password,first_name,last_name,address,phno) VALUES (?, ?, ?,?,?,?)";
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
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean book_train(String train, String username,int seats) throws SQLException, ClassNotFoundException {
        data_con connect = new data_con();
        try {
            String insertQuery = "INSERT INTO railway.bookings (uname,trainno, seats) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connect.con.prepareStatement(insertQuery);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, train);
            preparedStatement.setInt(3, seats);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connect.con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        connect.con.close();
        return false;
    }

    public static ResultSet view() throws SQLException, ClassNotFoundException {
        data_con data = new data_con();
        Statement stmt = data.con.createStatement();
        String insertQuery = "select * from railway.trains";
        System.out.println(insertQuery);
        return stmt.executeQuery(insertQuery);
    }

    public static ResultSet ticket_history(String uname) throws SQLException, ClassNotFoundException {
        data_con data = new data_con();
        Statement stmt = data.con.createStatement();
        String insertQuery = "select * from railway.bookings where uname = '" + uname.trim() + "'";
        System.out.println(insertQuery);
        return stmt.executeQuery(insertQuery);
    }

    public static void cancel(String username) throws SQLException, ClassNotFoundException {
        data_con connect = new data_con();
        try {
            //delete the user from the user_login table
            String insertQuery = "DELETE FROM railway.user_login WHERE username = ?";
            PreparedStatement preparedStatement = connect.con.prepareStatement(insertQuery);
            preparedStatement.setString(1, username);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connect.con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        connect.con.close();
    }
}

