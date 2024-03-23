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
	private int rowNum;
	private String count;
	private int reviewCount;
	
	public Product() {}

	

	public Product(int productNo, String categoryNo, String categoryName, String productName, int price,
			String inventory, Date enrollDate, Date modifyDate, String status, int discountPrice, String path,
			String contentPath, int likeNo, int rowNum, String count, int reviewCount) {
		super();
		this.productNo = productNo;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.productName = productName;
		this.price = price;
		this.inventory = inventory;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.discountPrice = discountPrice;
		this.path = path;
		this.contentPath = contentPath;
		this.likeNo = likeNo;
		this.rowNum = rowNum;
		this.count = count;
		this.reviewCount = reviewCount;
	}



	public Product(int productNo, String categoryName, String productName, int price, int discountPrice, String path) {
		super();
		this.productNo = productNo;
		this.categoryName = categoryName;
		this.productName = productName;
		this.price = price;
		this.discountPrice = discountPrice;
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



	public String getContentPath() {
		return contentPath;
	}



	public void setContentPath(String contentPath) {
		this.contentPath = contentPath;
	}



	public int getLikeNo() {
		return likeNo;
	}



	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}



	public int getRowNum() {
		return rowNum;
	}



	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}



	public String getCount() {
		return count;
	}



	public void setCount(String count) {
		this.count = count;
	}



	public int getReviewCount() {
		return reviewCount;
	}



	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}



	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", categoryNo=" + categoryNo + ", categoryName=" + categoryName
				+ ", productName=" + productName + ", price=" + price + ", inventory=" + inventory + ", enrollDate="
				+ enrollDate + ", modifyDate=" + modifyDate + ", status=" + status + ", discountPrice=" + discountPrice
				+ ", path=" + path + ", contentPath=" + contentPath + ", likeNo=" + likeNo + ", rowNum=" + rowNum
				+ ", count=" + count + ", reviewCount=" + reviewCount + "]";
	}



	

	
	
	
	


	
	

}
