
package helper;

import java.sql.*;


public class ConnectionProvider {
    private static Connection con;
    
    public static Connection getConnection(){
        try {
            if(con == null){
//                driver class load
                Class.forName("com.mysql.cj.jdbc.Driver");
//                create a connection
                String url = "jdbc:mysql://localhost:3306/Web_Tech";
                String user="root";
                String pass = "Mesbah@1245";
                con = DriverManager.getConnection(url,user,pass);
                    
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
