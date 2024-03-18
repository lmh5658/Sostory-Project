package com.sos.product.model.vo;

public class Qna {
	private int answerNo;
	private String productNo;
	private String userNo;
	private String adminNo;
	private String answerDate;
	private String answerTitle;
	private String answerContent;
	private String answerType;
	private String answerStatus;
	private String reply;
	private String replyDate;
	
	public Qna() {}

	public Qna(int answerNo, String productNo, String userNo, String adminNo, String answerDate, String answerTitle,
			String answerContent, String answerType, String answerStatus, String reply, String replyDate) {
		super();
		this.answerNo = answerNo;
		this.productNo = productNo;
		this.userNo = userNo;
		this.adminNo = adminNo;
		this.answerDate = answerDate;
		this.answerTitle = answerTitle;
		this.answerContent = answerContent;
		this.answerType = answerType;
		this.answerStatus = answerStatus;
		this.reply = reply;
		this.replyDate = replyDate;
	}

	public int getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	public String getAnswerTitle() {
		return answerTitle;
	}

	public void setAnswerTitle(String answerTitle) {
		this.answerTitle = answerTitle;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnswerType() {
		return answerType;
	}

	public void setAnswerType(String answerType) {
		this.answerType = answerType;
	}

	public String getAnswerStatus() {
		return answerStatus;
	}

	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		return "Qna [answerNo=" + answerNo + ", productNo=" + productNo + ", userNo=" + userNo + ", adminNo=" + adminNo
				+ ", answerDate=" + answerDate + ", answerTitle=" + answerTitle + ", answerContent=" + answerContent
				+ ", answerType=" + answerType + ", answerStatus=" + answerStatus + ", reply=" + reply + ", replyDate="
				+ replyDate + "]";
	}

	
	
	
	
}
