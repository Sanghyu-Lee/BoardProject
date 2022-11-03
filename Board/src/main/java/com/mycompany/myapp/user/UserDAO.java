package com.mycompany.myapp.user;

import java.util.List;

public interface UserDAO {
	void insertUser(UserVO vo);
	void deleteUser(UserVO vo);
	void updateUser(UserVO vo);
	UserVO getUser(UserVO vo);
	List<UserVO> getUserList(UserVO vo);
	
}
