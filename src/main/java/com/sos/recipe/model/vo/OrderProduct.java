package com.sos.recipe.model.vo;

public class OrderProduct {
	private String productName;
	private int productNo;
	private int categoryNo;

	
	public OrderProduct() {
		
	}

	//레시피 목록 부르기
	public OrderProduct(String productName, int productNo, int categoryNo) {
		super();
		this.productName = productName;
		this.productNo = productNo;
		this.categoryNo = categoryNo;
	}
	

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "OrderProduct [productName=" + productName + ", productNo=" + productNo + ", categoryNo=" + categoryNo
				+ "]";
	}


 


	
}

