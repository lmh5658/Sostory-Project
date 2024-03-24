package com.sos.newProduct.model.vo;

public class ProductNew {
	
	private int productNo;
	private int userNo;
	private String type;
	
	
	public ProductNew() {}


	public ProductNew(int productNo, int userNo, String type) {
		super();
		this.productNo = productNo;
		this.userNo = userNo;
		this.type = type;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	@Override
	public String toString() {
		return "productNew [productNo=" + productNo + ", userNo=" + userNo + ", type=" + type + "]";
	}
	
	
	

}
