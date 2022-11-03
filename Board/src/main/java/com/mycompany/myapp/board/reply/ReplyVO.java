package com.mycompany.myapp.board.reply;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int reply_Idx;
	private int board_Idx;
	private String reply;
	private String replyer;
	private Date replyDate;
}
