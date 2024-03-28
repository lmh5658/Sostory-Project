package com.sos.myPage.model.vo;

public class Address {

	private int addressNo;
	/*
	 * 배송지 조회시 : 회원이름 (String)
	 * 배송지 등록시 : 회원번호 (int)
	 */
	private String addressWriter;
	private String addressLocal;
	private String addressName;
	private String addressAddress;
	private String addressDetail;
	private String address;
	private String addressPhone;
	private String addressType;			// Y(기본배송지) | N(기타배송지)
	private String addressStatus;		// Y(유효배송지) | N(삭제배송지)
	
	public Address() {}

	public Address(int addressNo, String addressWriter, String addressLocal, String addressName, String addressAddress,
			String addressDetail, String addressPhone, String addressType, String addressStatus) {
		super();
		this.addressNo = addressNo;
		this.addressWriter = addressWriter;
		this.addressLocal = addressLocal;
		this.addressName = addressName;
		this.addressAddress = addressAddress;
		this.addressDetail = addressDetail;
		this.addressPhone = addressPhone;
		this.addressType = addressType;
		this.addressStatus = addressStatus;
	}
	
	

	public Address(String addressAddress, String addressDetail, String addressLocal) {
		super();
		this.addressAddress = addressAddress;
		this.addressDetail = addressDetail;
		this.addressLocal = addressLocal;
	}
	
	public Address(String addressAddress, String addressDetail, String addressLocal, String addressName,
			String addressPhone) {
		super();
		this.addressAddress = addressAddress;
		this.addressDetail = addressDetail;
		this.addressLocal = addressLocal;
		this.addressName = addressName;
		this.addressPhone = addressPhone;
	}

	public int getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}

	public String getAddressWriter() {
		return addressWriter;
	}

	public void setAddressWriter(String addressWriter) {
		this.addressWriter = addressWriter;
	}

	public String getAddressLocal() {
		return addressLocal;
	}

	public void setAddressLocal(String addressLocal) {
		this.addressLocal = addressLocal;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getAddressAddress() {
		return addressAddress;
	}

	public void setAddressAddress(String addressAddress) {
		this.addressAddress = addressAddress;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressPhone() {
		return addressPhone;
	}

	public void setAddressPhone(String addressPhone) {
		this.addressPhone = addressPhone;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getAddressStatus() {
		return addressStatus;
	}

	public void setAddressStatus(String addressStatus) {
		this.addressStatus = addressStatus;
	}

	@Override
	public String toString() {
		return "Address [addressNo=" + addressNo + ", addressWriter=" + addressWriter + ", addressLocal=" + addressLocal
				+ ", addressName=" + addressName + ", addressAddress=" + addressAddress + ", addressDetail="
				+ addressDetail + ", addressPhone=" + addressPhone + ", addressType=" + addressType + ", addressStatus="
				+ addressStatus + "]";
	}
	
}
