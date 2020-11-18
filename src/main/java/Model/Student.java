package Model;

public class Student {
    private String name;
    private String surname;
    private String avatar;
    private String group;

    public Student( String name, String surname, String avatar, String group){
        this.name=name;
        this.surname=surname;
        this.avatar=avatar;
        this.group=group;
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
    public String getGroup(){
        return group;
    }
}
