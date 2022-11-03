package com.mycompany.myapp.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertBoard(BoardVO vo) {
		mybatis.insert("boardDAO.insertBoard", vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("boardDAO.deleteBoard", vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		mybatis.update("boardDAO.updateBoard", vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return mybatis.selectOne("boardDAO.getBoard", vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return mybatis.selectList("boardDAO.getBoardList", vo);
	}

	@Override
	public int totalCount(BoardVO vo) {
		return mybatis.selectOne("boardDAO.totalCount", vo);
	}

	@Override
	public int nextIdx() {
		return mybatis.selectOne("boardDAO.nextIdx");
	}


}
