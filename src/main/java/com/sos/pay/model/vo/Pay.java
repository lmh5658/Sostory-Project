package com.sos.pay.model.vo;

public class Pay {

	
	
	private String count;
	private String productName;
	private String price;
	private String path;
	private String discountPrice;
	private String productNo;
	private String priceMinusDcprice;
	
	
	public Pay() {}

	public Pay(String count, String productName, String price, String path, String discountPrice, String productNo, String priceMinusDcprice) {
		super();
		this.count = count;
		this.productName = productName;
		this.price = price;
		this.path = path;
		this.discountPrice = discountPrice;
		this.productNo = productNo;
		this.priceMinusDcprice = priceMinusDcprice;
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
	
	
	public String getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(String discountPrice) {
		this.discountPrice = discountPrice;
	}
	
	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	
	

	public String getPriceMinusDcprice() {
		return priceMinusDcprice;
	}

	public void setPriceMinusDcprice(String priceMinusDcprice) {
		this.priceMinusDcprice = priceMinusDcprice;
	}

	@Override
	public String toString() {
		return "Pay [count=" + count + ", productName=" + productName + ", price=" + price + ", path=" + path + "]";
	}

	
	
	
	
	
	
	
	
	
	
}
