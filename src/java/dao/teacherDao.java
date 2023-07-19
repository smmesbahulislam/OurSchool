package dao;

import entities.Teacher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class teacherDao {

    private Connection con;

    public teacherDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Teacher> getAllTeachers() {
        ArrayList<Teacher> list = new ArrayList<>();
        try {
            String q = "select * from teacher";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);

            while (set.next()) {
                int tId = set.getInt("tId");
                String tName = set.getString("tName");
                String tEmail = set.getString("tEmail");
                String tGender = set.getString("tGender");

                Teacher teacher = new Teacher(tId, tName, tEmail, tGender);
                list.add(teacher);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int gettId(String name, String email) {
        int tId = -1;
        try {
            String q = "SELECT tId FROM teacher WHERE tName = ? AND tEmail = ?";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, name);
            pstmt.setString(2, email);

            ResultSet rs = pstmt.executeQuery();

//            int tId = -1; // initialize with default value
            if (rs.next()) {
                tId = rs.getInt("tId"); // extract the tId value from the ResultSet
            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
        }
        return tId;
    }

}
