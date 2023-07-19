
package helper;


public class RegisteredCourse {
    private int sId;
    private int tId;
    private int cId;
    private String studentName;
    private String studentEmail;
    private String teacherName;
    private String teacherEmail;
    private String courseTitle;
    private String courseCode;
    private String courseCredit;
    private String courseType;
    private String courseDescription;

    public RegisteredCourse() {
    }
    
    public RegisteredCourse(int sId, int cId, String studentName, String studentEmail, String courseTitle, String courseCode, String courseCredit, String courseType, String courseDescription) {
        this.sId = sId;
        this.cId = cId;
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.courseTitle = courseTitle;
        this.courseCode = courseCode;
        this.courseCredit = courseCredit;
        this.courseType = courseType;
        this.courseDescription = courseDescription;
    }
    
        public RegisteredCourse(int sId, int tId, int cId, String teacherName, String teacherEmail, String courseTitle, String courseCode, String courseCredit, String courseType, String courseDescription) {
        this.sId = sId;
        this.tId = tId;
        this.cId = cId;
        this.teacherName = teacherName;
        this.teacherEmail = teacherEmail;
        this.courseTitle = courseTitle;
        this.courseCode = courseCode;
        this.courseCredit = courseCredit;
        this.courseType = courseType;
        this.courseDescription = courseDescription;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherEmail() {
        return teacherEmail;
    }

    public void setTeacherEmail(String teacherEmail) {
        this.teacherEmail = teacherEmail;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
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

    public String getCourseCredit() {
        return courseCredit;
    }

    public void setCourseCredit(String courseCredit) {
        this.courseCredit = courseCredit;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

    public String getCourseDescription() {
        return courseDescription;
    }

    public void setCourseDescription(String courseDescription) {
        this.courseDescription = courseDescription;
    }
    
    
}
