package model;

public class Category {

    int id;
    String category_name;
    String category_path;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public Category(int id, String category_name, String category_path) {
        this.id = id;
        this.category_name = category_name;
        this.category_path = category_path;
    }

    public String getCategory_path() {
        return category_path;
    }

    public void setCategory_path(String category_path) {
        this.category_path = category_path;
    }

    public Category() {
        super();
    }

}
