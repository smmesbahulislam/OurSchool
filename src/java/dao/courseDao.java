
package dao;

import entities.Course;
import helper.RegisteredStudent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class courseDao {
    private Connection con;

    public courseDao(Connection con) {
        this.con = con;
    }

//    method of insert course to database
    public boolean saveCourse(Course course){
        boolean f = false;
        try {
            String q = "insert into course(courseTitle,courseCode,courseCredit,courseType,courseDescription) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, course.getCourseTitle());
            pstmt.setString(2, course.getCourseCode());
            pstmt.setInt(3, course.getCourseCredit());
            pstmt.setString(4, course.getCourseType());
            pstmt.setString(5, course.getCourseDescription());
            
            pstmt.executeUpdate();
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public ArrayList<Course>getAllCourses(){
        ArrayList<Course>list = new ArrayList<>();
        try {
            String q = "select * from course";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                int cId = set.getInt("cId");
                String courseTitle = set.getString("courseTitle");
                String courseCode = set.getString("courseCode");
                int courseCredit = set.getInt("courseCredit");
                String courseType = set.getString("courseType");
                String courseDescription = set.getString("courseDescription");
                
                Course course = new Course(cId,courseTitle, courseCode, courseCredit, courseType, courseDescription);
                list.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<RegisteredStudent>getAllRegisteredStudentsUsingcId(int cId){
        ArrayList<RegisteredStudent>list = new ArrayList<>();
        try {
            String q = "select s.sId, sName, sEmail, sGender\n"
                    +"FROM takes tks\n"
                    +"JOIN student s ON tks.studentID = s.sId\n"
                    +"JOIN course c ON tks.courseID = c.cId\n"
                    +"WHERE c.cId = ?";
            
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, cId);
            ResultSet set = pstmt.executeQuery();
            
            while(set.next()){
                int sId = set.getInt("sId");
                String studentName = set.getString("sName");
                String studentEmail = set.getString("sEmail");
                String studentGender = set.getString("sGender");
                
                RegisteredStudent rs = new RegisteredStudent(sId, studentName, studentEmail, studentGender);
                list.add(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
}
