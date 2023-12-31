package com.example.javaweb;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.Objects;

public class user_reg {

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

    public static int login(String username, String password) throws SQLException, ClassNotFoundException {
        System.out.println("username: " + username + " password: " + password);
        data_con connect = new data_con();
        try {
            String insertQuery = "INSERT INTO railway.user_login (username, paswd,datetime) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connect.con.prepareStatement(insertQuery);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connect.con.close();
            return check(username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        connect.con.close();
        return 2;
    }

    public static int check(String mail, String pass) {
        try {
            data_con data = new data_con();
            Statement stmt = data.con.createStatement();
            String insertQuery = "select password from railway.users_reg " + "where email='" + mail.trim() + "' ";
            System.out.println(insertQuery);
            ResultSet result = stmt.executeQuery(insertQuery);
            result.next();
            System.out.println("email:" + result.getString(1));
            if(Objects.equals(pass, result.getString(1))){
                return 1;
            }
            else{
                return 0;
            }
        }
        catch (Exception e){
            return -1;
        }
    }

    public static void logout(String username) throws SQLException, ClassNotFoundException {
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

