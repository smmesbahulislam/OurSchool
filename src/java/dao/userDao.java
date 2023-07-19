package dao;

import entities.User;
import java.sql.*;

public class userDao {
    private Connection con;

    public userDao(Connection con) {
        this.con = con;
    }
    
//    method to insert user to database
    public boolean saveUser(User user){
        boolean f = false;
        try {
            String q = "insert into user(email,password,name,gender,role) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getRole());
            
            pstmt.executeUpdate();
            f = true;
            
            if(user.getRole().equals("Teacher")){
                String q1 = "insert into teacher(tName,tEmail,tGender) values(?,?,?)";
                PreparedStatement s = this.con.prepareStatement(q1);
                s.setString(1, user.getName());
                s.setString(2, user.getEmail());
                s.setString(3, user.getGender());
                
                s.executeUpdate();
            }else if(user.getRole().equals("Student")){
                String q1 = "insert into student(sName,sEmail,sGender) values(?,?,?)";
                PreparedStatement s = this.con.prepareStatement(q1);
                s.setString(1, user.getName());
                s.setString(2, user.getEmail());
                s.setString(3, user.getGender());
                
                s.executeUpdate();
                
            }else if(user.getRole().equals("Admin")){
                String q1 = "insert into admin(aName,aEmail,aGender) values(?,?,?)";
                PreparedStatement s = this.con.prepareStatement(q1);
                s.setString(1, user.getName());
                s.setString(2, user.getEmail());
                s.setString(3, user.getGender());
                
                s.executeUpdate();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByEmailPasswordAndRole(String email,String password,String role){
        User user = null;
        try{
            String q = "select * from user where email = ? and password = ? and role = ?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setString(3, role);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                user = new User();
                
                String name = set.getString("name");
                
                user.setName(name);
                user.setId(set.getInt("uid"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setRole(set.getString("role"));
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
}
