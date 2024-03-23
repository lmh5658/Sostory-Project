package com.sos.recipe.model.vo;

public class Step {
	private int stepNo;
	private int userNo;
	private String stepContent;
	private String stepAttachUrl;
	
	public Step() {
		
	}
	
	//스텝등록
	public Step( int userNo, String stepContent, String stepAttachUrl) {
		super();
		this.userNo = userNo;
		this.stepContent = stepContent;
		this.stepAttachUrl = stepAttachUrl;
	}

	public int getStepNo() {
		return stepNo;
	}

	public void setStepNo(int stepNo) {
		this.stepNo = stepNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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


	

	@Override
	public String toString() {
		return "Step [stepNo=" + stepNo + ", userNo=" + userNo + ", stepContent=" + stepContent + ", stepAttachUrl="
				+ stepAttachUrl + "]";
	}

	
	
	
}
  