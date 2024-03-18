package com.sos.recipe.model.vo;

import java.sql.Date;

public class Recipe {
	private int recipeNo;
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
	
	//category
	private String categoryName;
	private int categoryNo;

	//Member
	private String userName;
	private String userPath;
	
	//like
	private int likeRefno;

	//product
	private String productName;
	private int price;
	private int discountPrice;
	private String path;
	
	public Recipe() {
		
	}
	
	public Recipe(int recipeNo, String categoryName, String recipeTitle, String thumbnailUrl, String recipeIntro,
			String userName, String userPath, int likeRefno, String productName, int price, int discountPrice,
			String path) {
		super();
		this.recipeNo = recipeNo;
		this.categoryName = categoryName;
		this.recipeTitle = recipeTitle;
		this.thumbnailUrl = thumbnailUrl;
		this.recipeIntro = recipeIntro;
		this.userName = userName;
		this.userPath = userPath;
		this.likeRefno = likeRefno;
		this.productName = productName;
		this.price = price;
		this.discountPrice = discountPrice;
		this.path = path;
	}


	public Recipe(int recipeNo, int userNo, int productNo, String recipeTitle, String thumbnailUrl, String recipeIntro,
			String difficulty, int serving, int cookingTime, Date postDate, String status, String categoryName,
			int categoryNo, String userName, String userPath, int likeRefno, String productName, int price,
			int discountPrice, String path) {
		super();
		this.recipeNo = recipeNo;
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
		this.categoryName = categoryName;
		this.categoryNo = categoryNo;
		this.userName = userName;
		this.userPath = userPath;
		this.likeRefno = likeRefno;
		this.productName = productName;
		this.price = price;
		this.discountPrice = discountPrice;
		this.path = path;
	}




	public int getRecipeNo() {
		return recipeNo;
	}


	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
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


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public int getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserPath() {
		return userPath;
	}


	public void setUserPath(String userPath) {
		this.userPath = userPath;
	}


	public int getLikeRefno() {
		return likeRefno;
	}


	public void setLikeRefno(int likeRefno) {
		this.likeRefno = likeRefno;
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


	@Override
	public String toString() {
		return "Recipe [recipeNo=" + recipeNo + ", userNo=" + userNo + ", productNo=" + productNo + ", recipeTitle="
				+ recipeTitle + ", thumbnailUrl=" + thumbnailUrl + ", recipeIntro=" + recipeIntro + ", difficulty="
				+ difficulty + ", serving=" + serving + ", cookingTime=" + cookingTime + ", postDate=" + postDate
				+ ", status=" + status + ", categoryName=" + categoryName + ", categoryNo=" + categoryNo + ", userName="
				+ userName + ", userPath=" + userPath + ", likeRefno=" + likeRefno + ", productName=" + productName
				+ ", price=" + price + ", discountPrice=" + discountPrice + ", path=" + path + "]";
	}

	
}
