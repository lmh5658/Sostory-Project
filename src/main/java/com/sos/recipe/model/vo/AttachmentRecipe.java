package com.sos.recipe.model.vo;

public class AttachmentRecipe {
	private int proFileNo;
	private String fileName;
	private String fileChangeName;
	private String fileRoute;
	private String status;
	private int refNo; 
	private String type;
	
	public AttachmentRecipe() {
		
	}

	public int getProFileNo() {
		return proFileNo;
	}

	public void setProFileNo(int proFileNo) {
		this.proFileNo = proFileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileChangeName() {
		return fileChangeName;
	}

	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
	}

	public String getFileRoute() {
		return fileRoute;
	}

	public void setFileRoute(String fileRoute) {
		this.fileRoute = fileRoute;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "AttachmentRecipe [proFileNo=" + proFileNo + ", fileName=" + fileName + ", fileChangeName="
				+ fileChangeName + ", fileRoute=" + fileRoute + ", status=" + status + ", refNo=" + refNo + ", type="
				+ type + "]";
	}
	
	
	
}
