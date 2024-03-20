package com.sos.product.model.vo;

public class AttachmentProduct {
	private int proFileNo;
	private String fileName;
	private String fileChangeName;
	private String fileUrl;
	private String fileRoute;
	private String status;
	private int refNo;
	private String type;
	
	public AttachmentProduct() {}

	public AttachmentProduct(int proFileNo, String fileName, String fileChangeName, String fileRoute, String status,
			int refNo, String type) {
		super();
		this.proFileNo = proFileNo;
		this.fileName = fileName;
		this.fileChangeName = fileChangeName;
		this.fileRoute = fileRoute;
		this.status = status;
		this.refNo = refNo;
		this.type = type;
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

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
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
		return "AttachmentProduct [proFileNo=" + proFileNo + ", fileName=" + fileName + ", fileChangeName="
				+ fileChangeName + ", fileRoute=" + fileRoute + ", status=" + status + ", refNo=" + refNo + ", type="
				+ type + "]";
	}
	
	

}
