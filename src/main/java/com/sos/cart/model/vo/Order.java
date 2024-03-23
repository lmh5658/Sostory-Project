package com.sos.cart.model.vo;

public class Order {

	private int userNo;
	private String name;
	private String phone;
	private String email;
	private String address;
	private String addressDetail;
	private String requestContent;
	private int pay;
	private String accountHolder;
	private String bankName;
	private String accountNumber;
	private String payDate;
	private int orderNo;
	
	
	public Order() {}


	public Order(int userNo, String name, String phone, String email, String address, String addressDetail, String requestContent,
			int pay, String accountHolder, String bankName, String accountNumber, String payDate, int orderNo) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.addressDetail = addressDetail;
		this.requestContent = requestContent;
		this.pay = pay;
		this.accountHolder = accountHolder;
		this.bankName = bankName;
		this.accountNumber = accountNumber;
		this.userNo=userNo;
		this.payDate=payDate;
	}
	
	


	public Order(int userNo, String name, String phone, String email, String address, String addressDetail,
			String requestContent, int pay, String accountHolder, String bankName, String accountNumber) {
		super();
		this.userNo = userNo;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.addressDetail = addressDetail;
		this.requestContent = requestContent;
		this.pay = pay;
		this.accountHolder = accountHolder;
		this.bankName = bankName;
		this.accountNumber = accountNumber;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getAddressDetail() {
		return addressDetail;
	}


	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}


	public String getRequestContent() {
		return requestContent;
	}


	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}


	public int getPay() {
		return pay;
	}


	public void setPay(int pay) {
		this.pay = pay;
	}


	public String getAccountHolder() {
		return accountHolder;
	}


	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}


	public String getBankName() {
		return bankName;
	}


	public void setBankName(String bankName) {
		this.bankName = bankName;
	}


	public String getAccountNumber() {
		return accountNumber;
	}


	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	
	

	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	

	public String getPayDate() {
		return payDate;
	}


	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	
	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	@Override
	public String toString() {
		return "Order [name=" + name + ", phone=" + phone + ", email=" + email + ", address=" + address
				+ ", addressDetail=" + addressDetail + ", requestContent=" + requestContent + ", pay=" + pay
				+ ", accountHolder=" + accountHolder + ", bankName=" + bankName + ", accountNumber=" + accountNumber
				+ "]";
	}
	
	
	
	
	
	
}
