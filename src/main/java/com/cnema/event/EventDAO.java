package com.cnema.event;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.board.BoardDAO;
import com.cnema.board.BoardDTO;
import com.cnema.util.RowNum;

@Repository
public class EventDAO implements BoardDAO{


	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "eventMapper.";
	
	@Override
	public List<BoardDTO> selectList(RowNum rowNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public BoardDTO selectOne(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int totalCount(RowNum rowNum) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int hitUpdate(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getNum() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
