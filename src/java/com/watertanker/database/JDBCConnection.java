package com.watertanker.database;
import java.sql.*;

public class JDBCConnection {

    public static Connection getConnection() {

        String url;

        String conn;
        try {
            url = "jdbc:mysql://localhost:3306/water_tanker";
            conn = "com.mysql.jdbc.Driver";
            Class.forName(conn);
            Connection cn = DriverManager.getConnection(url, "root", "");
            System.out.print(" Message from JDBCConnection Database is Connected");
            return cn;
        } catch (Exception e) {

            System.out.print(e.getMessage());
            return null;
        }

    }

}
