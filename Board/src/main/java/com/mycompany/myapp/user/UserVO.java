package com.mycompany.myapp.user;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	 // 아이디 
    private String userID;

    // 비밀번호 
    private String password;
    private String userPassword;

    // 가입일자 
    private Date regdate;

    // 성별 
    private String gender;

    // 닉네임 
    private String userNickname;

    // 이메일 
    private String email;
}
