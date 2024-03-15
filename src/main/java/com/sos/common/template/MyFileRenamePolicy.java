/**
 * 
 */
package com.sos.common.template;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) {
		
		// 원본파일명 ("aaa.jpg")
		String originName = originFile.getName();
		
		
		// => 수정파일명 ("20240305151630_25412.jpg")
		//		파일업로드한시간(년월일시분초)_랜덤숫자5자리.확장자
		
		// 1. 파일업로드한시간(String currentTime)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 2. 랜덤숫자 5자리 (10000~99999)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		// 3. 원본파일확장자 (String ext)
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + "_" + ranNum + ext;
		
		
		return new File(originFile.getParent(), changeName); // 파일명 수정작업 후 수정된 파일 객체 
	}

}
