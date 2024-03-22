package com.sos.product.model.vo;

import java.sql.Date;

public class Product {
	private int productNo;
	private String categoryNo;
	private String categoryName;
	private String productName;
	private int price;
	private String inventory;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	private int discountPrice;
	private String path;
	private String contentPath;
	private int likeNo;
	
	public Product() {}

	
	public Product(int productNo, String categoryNo, String productName, int price, String inventory, Date enrollDate,
			Date modifyDate, String status, int discountPrice, String path) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.productName = productName;
		this.price = price;
		this.inventory = inventory;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.discountPrice = discountPrice;
		this.path = path;
	}

	public Product(int productNo, String categoryNo, String productName, int price, int discountPrice, String path) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.productName = productName;
		this.price = price;
		this.discountPrice = discountPrice;
		this.path = path;
	}
	


	public Product(int productNo, String productName, int price, String inventory, String status, int discountPrice) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.inventory = inventory;
		this.status = status;
		this.discountPrice = discountPrice;
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

	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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



	public Date getModifyDate() {
		return modifyDate;
	}



	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
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

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public String getContentPath() {
		return contentPath;
	}

	public void setContentPath(String contentPath) {
		this.contentPath = contentPath;
	}


	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryNo=" + categoryNo + ", productName=" + productName
				+ ", price=" + price + ", inventory=" + inventory + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", status=" + status + ", discountPrice=" + discountPrice + ", path=" + path + "]";
	}


	
	

}
