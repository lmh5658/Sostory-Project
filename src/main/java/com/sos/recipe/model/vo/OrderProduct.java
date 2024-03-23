package com.sos.recipe.model.vo;

public class OrderProduct {
	private String productName;

	public OrderProduct() {
		
	}

	public OrderProduct(String productName) {
		super();
		this.productName = productName;

	}

	
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "OrderProduct [productName=" + productName + "]";
	}
 


	
}

