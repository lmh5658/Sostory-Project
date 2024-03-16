package com.sos.product.model.vo;

import java.sql.Date;

public class Product {
	private int productNo;
	private String categoryNo;
	private String productName;
	private int price;
	private String inventory; 
	private Date enrollDate;
	private Date modify_date;
	private String status;
	private int discountPrice;
	private String path;
	
	public Product() {}

	public Product(int productNo, String categoryNo, String productName, int price, String inventory, Date enrollDate,
			Date modify_date, String status, int discountPrice, String path) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.productName = productName;
		this.price = price;
		this.inventory = inventory;
		this.enrollDate = enrollDate;
		this.modify_date = modify_date;
		this.status = status;
		this.discountPrice = discountPrice;
		this.path = path;
	}
	
	

	public Product(int productNo, String categoryNo, String productName, int price, String path) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.productName = productName;
		this.price = price;
		this.path = path;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getInventory() {
		return inventory;
	}

	public void setInventory(String inventory) {
		this.inventory = inventory;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryNo=" + categoryNo + ", productName=" + productName
				+ ", price=" + price + ", inventory=" + inventory + ", enrollDate=" + enrollDate + ", modify_date="
				+ modify_date + ", status=" + status + ", discountPrice=" + discountPrice + ", path=" + path + "]";
	}
	
	

}
