
package entities;


public class Teacher {
    private int tId;
    private String tName;
    private String tEmail;
    private String tGender;

    public Teacher() {
    }

    public Teacher(String tName, String tEmail, String tGender) {
        this.tName = tName;
        this.tEmail = tEmail;
        this.tGender = tGender;
    }

    public Teacher(int tId, String tName, String tEmail, String tGender) {
        this.tId = tId;
        this.tName = tName;
        this.tEmail = tEmail;
        this.tGender = tGender;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public String gettEmail() {
        return tEmail;
    }

    public void settEmail(String tEmail) {
        this.tEmail = tEmail;
    }

    public String gettGender() {
        return tGender;
    }

    public void settGender(String tGender) {
        this.tGender = tGender;
    }
    
    
}
