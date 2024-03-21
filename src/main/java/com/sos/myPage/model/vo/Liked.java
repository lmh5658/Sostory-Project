package com.sos.myPage.model.vo;

public class Liked {

	private int likedNo;
	private int likedTotal;
	private String categoryName;
	private int productNo;
	private String productName;
	private int price;
	private int discountPrice;
	private String productThumbnailUrl;
	private int recipeNo;
	private String recipeWriter;
	private String recipeTitle;
	private String recipeIntro;
	private String recipeThumbnailUrl;
	private double rating;
	private String userProfileUrl;
	
	public Liked() {}

	public Liked(int likedNo, int likedTotal, String categoryName, int productNo, String productName, int price,
			int discountPrice, String productThumbnailUrl, int recipeNo, String recipeWriter, String recipeTitle,
			String recipeIntro, String recipeThumbnailUrl, double rating, String userProfileUrl) {
		super();
		this.likedNo = likedNo;
		this.likedTotal = likedTotal;
		this.categoryName = categoryName;
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.discountPrice = discountPrice;
		this.productThumbnailUrl = productThumbnailUrl;
		this.recipeNo = recipeNo;
		this.recipeWriter = recipeWriter;
		this.recipeTitle = recipeTitle;
		this.recipeIntro = recipeIntro;
		this.recipeThumbnailUrl = recipeThumbnailUrl;
		this.rating = rating;
		this.userProfileUrl = userProfileUrl;
	}

	public int getLikedNo() {
		return likedNo;
	}

	public void setLikedNo(int likedNo) {
		this.likedNo = likedNo;
	}

	public int getLikedTotal() {
		return likedTotal;
	}

	public void setLikedTotal(int likedTotal) {
		this.likedTotal = likedTotal;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
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

	public String getProductThumbnailUrl() {
		return productThumbnailUrl;
	}

	public void setProductThumbnailUrl(String productThumbnailUrl) {
		this.productThumbnailUrl = productThumbnailUrl;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public String getRecipeWriter() {
		return recipeWriter;
	}

	public void setRecipeWriter(String recipeWriter) {
		this.recipeWriter = recipeWriter;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public String getRecipeIntro() {
		return recipeIntro;
	}

	public void setRecipeIntro(String recipeIntro) {
		this.recipeIntro = recipeIntro;
	}

	public String getRecipeThumbnailUrl() {
		return recipeThumbnailUrl;
	}

	public void setRecipeThumbnailUrl(String recipeThumbnailUrl) {
		this.recipeThumbnailUrl = recipeThumbnailUrl;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}
	
	public String getUserProfileUrl() {
		return userProfileUrl;
	}

	public void setUserProfileUrl(String userProfileUrl) {
		this.userProfileUrl = userProfileUrl;
	}

	@Override
	public String toString() {
		return "Liked [likedNo=" + likedNo + ", categoryName=" + categoryName + ", productNo=" + productNo
				+ ", productName=" + productName + ", price=" + price + ", discountPrice=" + discountPrice
				+ ", productThumbnailUrl=" + productThumbnailUrl + ", recipeNo=" + recipeNo + ", recipeWriter="
				+ recipeWriter + ", recipeTitle=" + recipeTitle + ", recipeIntro=" + recipeIntro
				+ ", recipeThumbnailUrl=" + recipeThumbnailUrl + ", rating=" + rating + ", userProfileUrl="
				+ userProfileUrl + "]";
	}
	
}
