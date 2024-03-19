package com.sos.pay.model.vo;

public class Pay {

	
	
	private String count;
	private String productName;
	private String price;
	private String path;
	
	public Pay() {}

	public Pay(String count, String productName, String price, String path) {
		super();
		this.count = count;
		this.productName = productName;
		this.price = price;
		this.path = path;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "Pay [count=" + count + ", productName=" + productName + ", price=" + price + ", path=" + path + "]";
	}

	
	
	
	
	
	
	
	
	
	
}
