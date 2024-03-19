package com.sos.cart.model.vo;

public class Cart {

	 // 상품 이름, 상품 가격, 상품 할인가격, 상품이미지 경로
	 private int userNo;
	 private int productNo;
	 private int cartAmount;
	 
	 
	 private String productName;
	 private int price;
	 private int discountPrice;
	 private String path;
	 private String categoryName;

	 
	 public Cart() {}
	 
	 
	 
	 
	public Cart(int userNo, int productNo, int cartAmount, String productName, int price, int discountPrice,
			String path, String categoryName) {
		super();
		this.userNo = userNo;
		this.productNo = productNo;
		this.cartAmount = cartAmount;
		this.productName = productName;
		this.price = price;
		this.discountPrice = discountPrice;
		this.path = path;
		this.categoryName=categoryName;
	}




	public Cart(int userNo, int productNo, int cartAmount) {
		super();
		this.userNo = userNo;
		this.productNo = productNo;
		this.cartAmount = cartAmount;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public int getCartAmount() {
		return cartAmount;
	}


	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
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
	
	

	public String getCategoryName() {
		return categoryName;
	}




	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}




	@Override
	public String toString() {
		return "Cart [userNo=" + userNo + ", productNo=" + productNo + ", cartAmount=" + cartAmount + "]";
	}
	 
	 
	 
	 
}
