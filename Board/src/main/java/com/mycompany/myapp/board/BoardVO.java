package com.mycompany.myapp.board;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	// 게시글IDX
	private int board_Idx;

	// 작성자O
	private String writer;

	// 제목
	private String title;

	// 내용
	private String content;

	// 등록일자
	private Date regdate;

	// 수정일자
	private Date update_Date;

	// 페이징
	private int pageNum;

	private int startIdx;

	private int endIdx;
	
	// 검색
	
	private String searchCondition;
	
	private String searchKeyword;
}
