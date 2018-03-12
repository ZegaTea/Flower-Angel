package model;



public class ProductDetail {
	int id;
	int product_id;
	String link_image;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getLink_image() {
		return link_image;
	}
	public void setLink_image(String link_image) {
		this.link_image = link_image;
	}
	public ProductDetail(int id, int product_id, String link_image) {
		super();
		this.id = id;
		this.product_id = product_id;
		this.link_image = link_image;
	}
	public ProductDetail() {
		super();
	}
	
	
}
