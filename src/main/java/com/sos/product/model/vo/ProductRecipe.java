package com.sos.product.model.vo;

import java.sql.Date;

public class ProductRecipe {
	
	private int recipeNo;
	private String categoryNo;
	private String userNo;
	private String productNo;
	private String recipeTitle;
	private String thumbnailUrl;
	private String recipeIntro;
	private String difficulty;
	private int serving; 
	private int cookingTime;
	private Date postDate;
	private String recipeStatus;
	private int likeCount;
	private int productPrice;
	private String productPath;
	

	public ProductRecipe() {}


	public ProductRecipe(int recipeNo, String categoryNo, String userNo, String productNo, String recipeTitle,
			String thumbnailUrl, String recipeIntro, String difficulty, int serving, int cookingTime, Date postDate,
			String recipeStatus, int likeCount, int productPrice, String productPath) {
		super();
		this.recipeNo = recipeNo;
		this.categoryNo = categoryNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.recipeTitle = recipeTitle;
		this.thumbnailUrl = thumbnailUrl;
		this.recipeIntro = recipeIntro;
		this.difficulty = difficulty;
		this.serving = serving;
		this.cookingTime = cookingTime;
		this.postDate = postDate;
		this.recipeStatus = recipeStatus;
		this.likeCount = likeCount;
		this.productPrice = productPrice;
		this.productPath = productPath;
	}


	public int getRecipeNo() {
		return recipeNo;
	}


	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}


	public String getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}


	public String getUserNo() {
		return userNo;
	}


	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}


	public String getProductNo() {
		return productNo;
	}


	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}


	public String getRecipeTitle() {
		return recipeTitle;
	}


	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}


	public String getThumbnailUrl() {
		return thumbnailUrl;
	}


	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}


	public String getRecipeIntro() {
		return recipeIntro;
	}


	public void setRecipeIntro(String recipeIntro) {
		this.recipeIntro = recipeIntro;
	}


	public String getDifficulty() {
		return difficulty;
	}


	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}


	public int getServing() {
		return serving;
	}


	public void setServing(int serving) {
		this.serving = serving;
	}


	public int getCookingTime() {
		return cookingTime;
	}


	public void setCookingTime(int cookingTime) {
		this.cookingTime = cookingTime;
	}


	public Date getPostDate() {
		return postDate;
	}


	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}


	public String getRecipeStatus() {
		return recipeStatus;
	}


	public void setRecipeStatus(String recipeStatus) {
		this.recipeStatus = recipeStatus;
	}


	public int getLikeCount() {
		return likeCount;
	}


	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public String getProductPath() {
		return productPath;
	}


	public void setProductPath(String productPath) {
		this.productPath = productPath;
	}


	@Override
	public String toString() {
		return "ProductRecipe [recipeNo=" + recipeNo + ", categoryNo=" + categoryNo + ", userNo=" + userNo
				+ ", productNo=" + productNo + ", recipeTitle=" + recipeTitle + ", thumbnailUrl=" + thumbnailUrl
				+ ", recipeIntro=" + recipeIntro + ", difficulty=" + difficulty + ", serving=" + serving
				+ ", cookingTime=" + cookingTime + ", postDate=" + postDate + ", recipeStatus=" + recipeStatus
				+ ", likeCount=" + likeCount + ", productPrice=" + productPrice + ", productPath=" + productPath + "]";
	}


	

	
	
}
