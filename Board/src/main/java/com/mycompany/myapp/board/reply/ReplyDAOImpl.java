package com.mycompany.myapp.board.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertReply(ReplyVO vo) {
		mybatis.insert("replyDAO.insertReply", vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		mybatis.delete("replyDAO.deleteReply", vo);	
	}

	@Override
	public List<ReplyVO> getReplyList(ReplyVO vo) {
		return mybatis.selectList("replyDAO.getReplyList", vo);
	}

}
