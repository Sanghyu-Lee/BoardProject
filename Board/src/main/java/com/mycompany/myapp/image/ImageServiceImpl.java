package com.mycompany.myapp.image;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageServiceImpl implements ImageService{

	@Autowired
	private ImageDAO dao;
	
	@Override
	public void insertImage(ImageVO vo) {
		dao.insertImage(vo);
	}

	@Override
	public void deleteImage(ImageVO vo) {
		dao.deleteImage(vo);
	}

	@Override
	public ImageVO getImage(ImageVO vo) {
		return dao.getImage(vo);
	}

	@Override
	public void updateImage(ImageVO vo) {
		dao.updateImage(vo);
	}

}
