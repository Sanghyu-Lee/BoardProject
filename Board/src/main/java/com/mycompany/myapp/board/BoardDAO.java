package com.mycompany.myapp.board;

import java.util.List;

public interface BoardDAO {
	void insertBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	BoardVO getBoard(BoardVO vo);
	List<BoardVO> getBoardList(BoardVO vo);
	int totalCount(BoardVO vo);
	int nextIdx();
}
