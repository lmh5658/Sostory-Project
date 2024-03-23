package com.sos.recipe.model.vo;

public class RecipeInsert {
	
	private String productName;
	private String recipeTitle;
	private String thumbnailUrl;
	private String recipeIntro;
	private int serving;
	private String difficulty;
	private int cookingTime;

	//재료
	private String ingredientName;
	private String amount;
	private String unit;

	
	//스텝
	private int stepNo;
	private int userNo;
	private String stepContent;
	private String stepAttachUrl;
	
	
	public RecipeInsert() {
		
	}
	
	//등록
	public RecipeInsert(String productName,String recipeTitle, String thumbnailUrl, String recipeIntro,  int serving, int cookingTime, String difficulty) {
		super();
		this.productName = productName;
		this.recipeTitle = recipeTitle;
		this.thumbnailUrl = thumbnailUrl;
		this.recipeIntro = recipeIntro;
		this.serving = serving;
		this.difficulty = difficulty;
		this.cookingTime = cookingTime;
	}
	
	//재료등록
	public RecipeInsert(String ingredientName, String amount, String unit) {
		super();
		this.ingredientName = ingredientName;
		this.amount = amount;
		this.unit = unit;
	}
	
	//스텝등록
	public RecipeInsert(int stepNo, int userNo, String stepContent, String stepAttachUrl) {
		super();
		this.stepNo = stepNo;
		this.userNo = userNo;
		this.stepContent = stepContent;
		this.stepAttachUrl = stepAttachUrl;
	}
	
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getStepNo() {
		return stepNo;
	}

	public void setStepNo(int stepNo) {
		this.stepNo = stepNo;
	}

	public String getStepContent() {
		return stepContent;
	}

	public void setStepContent(String stepContent) {
		this.stepContent = stepContent;
	}

	public String getStepAttachUrl() {
		return stepAttachUrl;
	}

	public void setStepAttachUrl(String stepAttachUrl) {
		this.stepAttachUrl = stepAttachUrl;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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
	public int getServing() {
		return serving;
	}
	public void setServing(int serving) {
		this.serving = serving;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public int getCookingTime() {
		return cookingTime;
	}
	public void setCookingTime(int cookingTime) {
		this.cookingTime = cookingTime;
	}
	public String getIngredientName() {
		return ingredientName;
	}
	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Override
	public String toString() {
		return "RecipeInsert [productName=" + productName + ", recipeTitle=" + recipeTitle + ", thumbnailUrl="
				+ thumbnailUrl + ", recipeIntro=" + recipeIntro + ", serving=" + serving + ", difficulty=" + difficulty
				+ ", cookingTime=" + cookingTime + ", ingredientName=" + ingredientName + ", amount=" + amount
				+ ", unit=" + unit + ", stepNo=" + stepNo + ", userNo=" + userNo + ", stepContent=" + stepContent
				+ ", stepAttachUrl=" + stepAttachUrl + "]";
	}

	
	
	
	
}