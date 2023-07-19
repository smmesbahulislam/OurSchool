package dao;

import entities.Teaches;
import helper.Enrollment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class teachesDao {

    private Connection con;

    public teachesDao(Connection con) {
        this.con = con;
    }

    public boolean saveteacherIDAndCourseID(Teaches teaches) {
        boolean f = false;
        try {
            String q = "insert into teaches(teacherID,courseID) values(?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, teaches.getTeacherID());
            pstmt.setInt(2, teaches.getCourseID());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public ArrayList<Enrollment> getInformationAboutEnrolledCourses() {
        ArrayList<Enrollment> list = new ArrayList<>();
        try {
            String q = "SELECT t.tId, c.cId, t.tName, c.courseTitle, c.courseCode, c.courseCredit, c.courseType\n"
                + "FROM teaches tch\n"
                + "JOIN teacher t ON tch.teacherID = t.tId\n"
                + "JOIN course c ON tch.courseID = c.cId;";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            
            while(set.next()){
                int tId = set.getInt("tId");
                int cId = set.getInt("cId");
                String tName = set.getString("tName");
                String courseTitle = set.getString("courseTitle");
                String courseCode = set.getString("courseCode");
                int courseCredit = set.getInt("courseCredit");
                String courseType = set.getString("courseType");
                
                Enrollment en = new Enrollment(tName, courseTitle, courseCode, courseCredit, courseType,tId,cId);
                list.add(en);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return list;
    }
    
    public ArrayList<Enrollment>getInformationAboutEnrolledCoursesByTeacherId(int tId){
        ArrayList<Enrollment>list = new ArrayList<>();
        try {
            String q = "Select t.tName, c.cId, c.courseTitle,c.courseCode,c.courseCredit,c.courseType\n"
                    +"FROM teaches tch\n"
                    +"JOIN teacher t ON tch.teacherID = t.tId\n"
                    +"JOIN course c ON tch.courseID = c.cId\n"
                    +"WHERE t.tId = ?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, tId);
            ResultSet set = pstmt.executeQuery();
            
            while(set.next()){
                String tName = set.getString("tName");
                int cId = set.getInt("cId");
                String courseTitle = set.getString("courseTitle");
                String courseCode = set.getString("courseCode");
                int courseCredit = set.getInt("courseCredit");
                String courseType = set.getString("courseType");
                
                Enrollment en = new Enrollment(tName, courseTitle, courseCode, courseCredit, courseType, tId, cId);
                list.add(en);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
