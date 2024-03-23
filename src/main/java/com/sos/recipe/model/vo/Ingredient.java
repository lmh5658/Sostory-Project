package com.sos.recipe.model.vo;

public class Ingredient {
	
	private String ingredientName;
	private String amount;
	private String unit;

	
	public Ingredient() {
		
	}

	//재료등록
	public Ingredient(String ingredientName, String amount, String unit) {
		super();
		this.ingredientName = ingredientName;
		this.amount = amount;
		this.unit = unit;
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
		return "Ingredient [ingredientName=" + ingredientName + ", amount=" + amount + ", unit=" + unit + "]";
	}

	
}
