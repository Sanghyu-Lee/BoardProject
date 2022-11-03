package com.mycompany.myapp.image;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImageDAOImpl implements ImageDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertImage(ImageVO vo) {
		mybatis.insert("imageDAO.insertImage", vo);
	}

	@Override
	public void deleteImage(ImageVO vo) {
		mybatis.delete("imageDAO.deleteImage", vo);
	}

	@Override
	public ImageVO getImage(ImageVO vo) {
		return mybatis.selectOne("imageDAO.getImage", vo);
	}

	@Override
	public void updateImage(ImageVO vo) {
		mybatis.update("imageDAO.updateImage", vo);
	}
}
