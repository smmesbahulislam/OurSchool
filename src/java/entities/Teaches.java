
package entities;


public class Teaches {
    private int takes_id;
    private int teacherID;
    private int courseID;

    public Teaches() {
    }

    public Teaches(int teacherID, int courseID) {
        this.teacherID = teacherID;
        this.courseID = courseID;
    }

    public Teaches(int takes_id, int teacherID, int courseID) {
        this.takes_id = takes_id;
        this.teacherID = teacherID;
        this.courseID = courseID;
    }

    public int getTakes_id() {
        return takes_id;
    }

    public void setTakes_id(int takes_id) {
        this.takes_id = takes_id;
    }

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }
    
    
}
