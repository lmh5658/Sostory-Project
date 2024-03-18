package com.sos.product.model.vo;

public class ProductReview {
	
	private int productNo;
	private String writerNo;
	private int rating;
	private String reviewContent;
	private String postDate;
	private int reviewAttachmentPath;
	
	public ProductReview() {}

	public ProductReview(int productNo, String writerNo, int rating, String reviewContent, String postDate,
			int reviewAttachmentPath) {
		super();
		this.productNo = productNo;
		this.writerNo = writerNo;
		this.rating = rating;
		this.reviewContent = reviewContent;
		this.postDate = postDate;
		this.reviewAttachmentPath = reviewAttachmentPath;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(String writerNo) {
		this.writerNo = writerNo;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public int getReviewAttachmentPath() {
		return reviewAttachmentPath;
	}

	public void setReviewAttachmentPath(int reviewAttachmentPath) {
		this.reviewAttachmentPath = reviewAttachmentPath;
	}

	@Override
	public String toString() {
		return "ProductReview [productNo=" + productNo + ", writerNo=" + writerNo + ", rating=" + rating
				+ ", reviewContent=" + reviewContent + ", postDate=" + postDate + ", reviewAttachmentPath="
				+ reviewAttachmentPath + "]";
	}

	
	

}
