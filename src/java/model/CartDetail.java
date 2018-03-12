package model;



public class CartDetail {
	int id;
	int cart_id;
	int product_id;
	int quantity;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public CartDetail(int id, int cart_id, int product_id, int quantity) {
		super();
		this.id = id;
		this.cart_id = cart_id;
		this.product_id = product_id;
		this.quantity = quantity;
	}
	public CartDetail() {
		super();
	}
	
	
}
