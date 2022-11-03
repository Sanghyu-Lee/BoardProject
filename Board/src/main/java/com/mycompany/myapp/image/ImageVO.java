package com.mycompany.myapp.image;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ImageVO {
	private int image_Idx;
	private int board_Idx;
	private MultipartFile uploadImage;
	private String uploadImageStr;
}
