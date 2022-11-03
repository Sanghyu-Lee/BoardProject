package com.mycompany.myapp.board.reply;

import java.util.List;

public interface ReplyDAO {
	void insertReply(ReplyVO vo);
	void deleteReply(ReplyVO vo);
	List<ReplyVO> getReplyList(ReplyVO vo);
}
