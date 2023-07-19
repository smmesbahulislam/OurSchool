
package helper;


public class RegisteredStudent {
    private int sId;
    private String studentName;
    private String studentEmail;
    private String studentGender;

    public RegisteredStudent() {
    }

    public RegisteredStudent(String studentName, String studentEmail, String studentGender) {
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.studentGender = studentGender;
    }

    public RegisteredStudent(int sId, String studentName, String studentEmail, String studentGender) {
        this.sId = sId;
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.studentGender = studentGender;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
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

    public String getStudentGender() {
        return studentGender;
    }

    public void setStudentGender(String studentGender) {
        this.studentGender = studentGender;
    }
    
    
}
