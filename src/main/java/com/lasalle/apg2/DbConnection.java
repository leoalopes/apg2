package com.lasalle.apg2;

import java.sql.DriverManager;
import java.sql.Connection;

public class DbConnection {
    private static Connection conn = null;

    public static Connection getConnection() {
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apg2", "admin", "12310");
        } catch(Exception e) {
            System.out.println("Problem occured while getting connection to the Database = " + e.getMessage());
        }
        return conn;
    }

    public static void close() {
        if(conn != null) {
            try {
                conn.close();
            } catch(Exception e) {
                
            }
        }
    }
}
