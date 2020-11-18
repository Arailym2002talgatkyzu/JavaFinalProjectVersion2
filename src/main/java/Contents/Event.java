package Contents;

public class Event {
    private Integer id;
    private String title;
    private String url;
    private String date;
    private String owner;

    public Event(String title, String url, String date, String owner) {
        this.title = title;
        this.url = url;
        this.date = date;
        this.owner = owner;
    }

    public Event(Integer id, String title, String url, String date, String owner) {
        this.id = id;
        this.title = title;
        this.url = url;
        this.date = date;
        this.owner = owner;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

}
