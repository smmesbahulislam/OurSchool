
package dao;

import java.sql.*;


public class studentDao {
    private Connection con;

    public studentDao(Connection con) {
        this.con = con;
    }
    
    
    public int getsId(String name,String email){
        int sId = -1;
        try {
            String q = "SELECT sId FROM student WHERE sName=? AND sEmail=?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            
            ResultSet set = pstmt.executeQuery();
            
             if(set.next())
                 sId = set.getInt("sId");
             
             set.close();
             pstmt.close();
            
                
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sId;
    }
}
