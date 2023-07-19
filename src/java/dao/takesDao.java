
package dao;

import helper.RegisteredCourse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class takesDao {
    private Connection con;

    public takesDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean savesIdAndcId(int sId,int cId){
        boolean f = false;
        try {
            String q = "insert into takes(studentID,courseID) values(?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, sId);
            pstmt.setInt(2, cId);
            
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public ArrayList<RegisteredCourse>getInformationAboutRegisteredCourses(int sId){
        ArrayList<RegisteredCourse>list = new ArrayList<>();
        
        try {
            String q = "Select s.sId, t.tId, c.cId, courseTitle, courseCode, courseCredit, courseType, courseDescription, t.tName, t.tEmail\n"
                    + "FROM takes tks\n"
                    + "JOIN student s ON tks.studentID = s.sId\n"
                    + "JOIN course c ON tks.courseID = c.cId\n"
                    + "JOIN teaches tch ON tks.courseID = tch.courseID\n"
                    + "JOIN teacher t ON tch.teacherID = t.tId\n"
                    + "WHERE s.sId = ?";
//            String q = "SELECT s.sName, c.courseTitle, c.courseCode, c.courseCredit, c.courseType, t.tName\n" +
//"FROM takes tks\n" +
//"JOIN student s ON tks.studentID = s.sId\n" +
//"JOIN course c ON tks.courseID = c.cId\n" +
//"JOIN teaches tch ON tks.courseID = tch.courseID\n" +
//"JOIN teacher t ON tch.teacherID = t.tId\n" +
//"WHERE s.sId = <sId>;";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, sId);
            ResultSet set = pstmt.executeQuery();
            
            while(set.next()){
//                int sId = set.getInt("sId");
                int tId = set.getInt("tId");
                int cId = set.getInt("cId");
                String teacherName = set.getString("tName");
                String teacherEmail = set.getString("tEmail");
                String courseTitle = set.getString("courseTitle");
                String courseCode = set.getString("courseCode");
                String courseCredit = set.getString("courseCredit");
                String courseType = set.getString("courseType");
                String courseDescription = set.getString("courseDescription");
                
                RegisteredCourse rc = new RegisteredCourse(sId, tId, cId, teacherName, teacherEmail, courseTitle, courseCode, courseCredit, courseType, courseDescription);
                list.add(rc);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
