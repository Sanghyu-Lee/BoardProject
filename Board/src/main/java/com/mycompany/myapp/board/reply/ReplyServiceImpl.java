package com.mycompany.myapp.board.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO dao;
	
	@Override
	public void insertReply(ReplyVO vo) {
		dao.insertReply(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) {
		dao.deleteReply(vo);
	}

	@Override
	public List<ReplyVO> getReplyList(ReplyVO vo) {
		return dao.getReplyList(vo);
	}

}
