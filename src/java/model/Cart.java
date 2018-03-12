package model;

public class Cart {

    int id;
    int user_id;
    int status_id;
    double total_cost;
    double discount;
    String shipping_address;
    String note;
    String phone_number;
    long day_create;
    long day_modify;

    String status_name;

    String email;
    String date_create;
    String date_modify;

    public String getDate_create() {
        return date_create;
    }

    public void setDate_create(String date_create) {
        this.date_create = date_create;
    }

    public String getDate_modify() {
        return date_modify;
    }

    public void setDate_modify(String date_modify) {
        this.date_modify = date_modify;
    }
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getStatus_name() {
        return status_name;
    }

    public void setStatus_name(String status_name) {
        this.status_name = status_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public double getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(double total_cost) {
        this.total_cost = total_cost;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getShipping_address() {
        return shipping_address;
    }

    public void setShipping_address(String shipping_address) {
        this.shipping_address = shipping_address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public long getDay_create() {
        return day_create;
    }

    public void setDay_create(long day_create) {
        this.day_create = day_create;
    }

    public long getDay_modify() {
        return day_modify;
    }

    public void setDay_modify(long day_modify) {
        this.day_modify = day_modify;
    }

    public Cart(int id, int user_id, int status_id, double total_cost,
            double discount, String shipping_address, String note,
            String phone_number, long day_create, long day_modify) {
        super();
        this.id = id;
        this.user_id = user_id;
        this.status_id = status_id;
        this.total_cost = total_cost;
        this.discount = discount;
        this.shipping_address = shipping_address;
        this.note = note;
        this.phone_number = phone_number;
        this.day_create = day_create;
        this.day_modify = day_modify;
    }

    public Cart() {
        super();
    }

}
