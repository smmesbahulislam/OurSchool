
package entities;

public class Course {
    private int cId;
    private String courseTitle;
    private String courseCode;
    private int courseCredit;
    private String courseType;
    private String courseDescription;

    public Course() {
    }

    public Course(String courseTitle, String courseCode, int courseCredit, String courseType, String courseDescription) {
        this.courseTitle = courseTitle;
        this.courseCode = courseCode;
        this.courseCredit = courseCredit;
        this.courseType = courseType;
        this.courseDescription = courseDescription;
    }

    public Course(int cId, String courseTitle, String courseCode, int courseCredit, String courseType, String courseDescription) {
        this.cId = cId;
        this.courseTitle = courseTitle;
        this.courseCode = courseCode;
        this.courseCredit = courseCredit;
        this.courseType = courseType;
        this.courseDescription = courseDescription;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
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

    public String getCourseDescription() {
        return courseDescription;
    }

    public void setCourseDescription(String courseDescription) {
        this.courseDescription = courseDescription;
    }
    
    
}
