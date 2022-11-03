package com.mycompany.myapp.image;

public interface ImageDAO {
	void insertImage(ImageVO vo);
	void deleteImage(ImageVO vo);
	void updateImage(ImageVO vo);
	ImageVO getImage(ImageVO vo);
}
