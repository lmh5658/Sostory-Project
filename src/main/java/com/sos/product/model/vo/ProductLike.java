package com.sos.product.model.vo;

import java.sql.Date;

public class ProductLike {
	private int likeNo;
	private int userNo;
	private String likeType;
	private int likeRefNo;
	private Date likeDate;
	
	public ProductLike() {}

	public ProductLike(int likeNo, int userNo, String likeType, int likeRefNo, Date likeDate) {
		super();
		this.likeNo = likeNo;
		this.userNo = userNo;
		this.likeType = likeType;
		this.likeRefNo = likeRefNo;
		this.likeDate = likeDate;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getLikeType() {
		return likeType;
	}

	public void setLikeType(String likeType) {
		this.likeType = likeType;
	}

	public int getLikeRefNo() {
		return likeRefNo;
	}

	public void setLikeRefNo(int likeRefNo) {
		this.likeRefNo = likeRefNo;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	@Override
	public String toString() {
		return "ProductLike [likeNo=" + likeNo + ", userNo=" + userNo + ", likeType=" + likeType + ", likeRefNo="
				+ likeRefNo + ", likeDate=" + likeDate + "]";
	}
	
	
}
