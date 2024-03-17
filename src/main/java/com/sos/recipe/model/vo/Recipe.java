package com.sos.recipe.model.vo;

import java.sql.Date;

public class Recipe {
	private int recipeNo;
	private int categoryNo;
	private int userNo;
	private int productNo;
	private String recipeTitle;
	private String thumbnailUrl;
	private String recipeIntro;
	private String difficulty;
	private int serving;
	private int cookingTime;
	private Date postDate;
	private String status;
	
	public Recipe() {
		
	}

	public Recipe(int recipeNo, int categoryNo, int userNo, int productNo, String recipeTitle, String thumbnailUrl,
			String recipeIntro, String difficulty, int serving, int cookingTime, Date postDate, String status) {
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
		this.status = status;
	}

	public Recipe(int recipeNo, int categoryNo, String recipeTitle, String thumbnailUrl, String recipeIntro) {
		super();
		this.recipeNo = recipeNo;
		this.categoryNo = categoryNo;
		this.recipeTitle = recipeTitle;
		this.thumbnailUrl = thumbnailUrl;
		this.recipeIntro = recipeIntro;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", categoryNo=" + categoryNo + ", userNo=" + userNo + ", productNo="
				+ productNo + ", recipeTitle=" + recipeTitle + ", thumbnailUrl=" + thumbnailUrl + ", recipeIntro="
				+ recipeIntro + ", difficulty=" + difficulty + ", serving=" + serving + ", cookingTime=" + cookingTime
				+ ", postDate=" + postDate + ", status=" + status + "]";
	}
	
}
