
package helper;


public class Enrollment {
    private String teacherName;
    private String courseTitle;
    private String courseCode;
    private int courseCredit;
    private String courseType;
    private int tId;
    private int cId;

    public Enrollment(String teacherName, String courseTitle, String courseCode, int courseCredit, String courseType, int tId, int cId) {
        this.teacherName = teacherName;
        this.courseTitle = courseTitle;
        this.courseCode = courseCode;
        this.courseCredit = courseCredit;
        this.courseType = courseType;
        this.tId = tId;
        this.cId = cId;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public Enrollment() {
    }

    public Enrollment(String teacherName, String courseTitle, String courseCode, int courseCredit, String courseType) {
        this.teacherName = teacherName;
        this.courseTitle = courseTitle;
        this.courseCode = courseCode;
        this.courseCredit = courseCredit;
        this.courseType = courseType;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public int getCourseCredit() {
        return courseCredit;
    }

    public void setCourseCredit(int courseCredit) {
        this.courseCredit = courseCredit;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }
    
    
}
