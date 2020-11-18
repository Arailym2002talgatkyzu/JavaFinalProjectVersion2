package Model;

public class User {
    private String username;
    private String name;
    private String surname;
    private String avatar;
    private String major;
    private String email;
    private String group;

    public User(String username, String name, String surname, String avatar, String major, String email, String group){
        this.username=username;
        this.name=name;
        this.surname=surname;
        this.avatar=avatar;
        this.major=major;
        this.email=email;
        this.group=group;
    }

    public String getUsername(){
        return username;
    }
    public String getName(){
        return name;
    }
    public String getSurname(){
        return surname;
    }
    public String getAvatar(){
        return avatar;
    }
    public String getMajor(){
        return major;
    }
    public String getEmail(){
        return email;
    }
    public String getGroup(){
        return group;
    }
}
