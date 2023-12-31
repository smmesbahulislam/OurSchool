package entities;
public class User {
    private int id;
    private String email;
    private String password;
    private String name;
    private String gender;
    private String role;

    public User() {
    }

    public User(String email, String password, String name, String gender, String role) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.role = role;
    }

    public User(int id, String email, String password, String name, String gender, String role) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.role = role;
    }
    
    
//    getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
}
