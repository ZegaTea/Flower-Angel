package model;



public class Product_Category {
	int id;
	int category_id;
	int product_id;
	public Product_Category(int id, int category_id, int product_id) {
		super();
		this.id = id;
		this.category_id = category_id;
		this.product_id = product_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public Product_Category() {
		super();
	}
	
	
}
