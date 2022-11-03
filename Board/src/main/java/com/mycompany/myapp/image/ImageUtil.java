package com.mycompany.myapp.image;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class ImageUtil {

	public String uploadImage(MultipartFile uploadFile, String path) throws IOException {
		String fileName = null;
		if(!uploadFile.isEmpty()) {
				String uuid = UUID.randomUUID().toString();
				String file = uploadFile.getOriginalFilename();
				String baseFileName = file.substring(0, file.lastIndexOf("."));
				String extension = file.substring(file.lastIndexOf("."));
				fileName = uuid + "_" + baseFileName + extension;
				
				uploadFile.transferTo(new File(path + fileName));
		}
		return fileName;
	}
	
	public void deleteImage(String oldFileName,  String path) {
		// 기존파일 불러와서 delete메소드를 사용하기 위한 객체 생성
		File oldFile = new File(path + oldFileName);
		if (oldFile.exists()) {
			oldFile.delete();
		}
	}
}
