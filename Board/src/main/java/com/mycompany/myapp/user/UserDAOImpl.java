package com.mycompany.myapp.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertUser(UserVO vo) {
		mybatis.insert("userDAO.userRegister", vo);
	}

	@Override
	public void deleteUser(UserVO vo) {
		mybatis.delete("userDAO.deleteUser", vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		mybatis.update("userDAO.updateUser", vo);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		return mybatis.selectOne("userDAO.getUser", vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return mybatis.selectList("userDAO.getUserList", vo);
	}

}
