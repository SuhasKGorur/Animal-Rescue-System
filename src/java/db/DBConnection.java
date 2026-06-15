package db;

import java.sql.Connection; //DB connection object
import java.sql.DriverManager; //creates connection

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null; //like a token

        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/animal_rescue_db",
                    "root",
                    "root");

        } catch (Exception e) {

            e.printStackTrace(); //shows me complete error message

        }

        return con;
    }
}