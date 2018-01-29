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
		return sqlSession.selectList(namespace+"ingSelectList", rowNum);
	}
	@Override
	public BoardDTO selectOne(int num) throws Exception {
		return sqlSession.selectOne(namespace+"selectOne", num);
	}
	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		int result = sqlSession.insert(namespace+"insert", boardDTO);
		return result;
	}
	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(namespace+"update", boardDTO);
	}
	@Override
	public int delete(int num) throws Exception {
		return sqlSession.delete(namespace+"delete", num);
	}
	@Override
	public int totalCount(RowNum rowNum) throws Exception {
		return sqlSession.selectOne(namespace+"ingTotalCount", rowNum);
	}
	//종료된 이벤트
	public int endTotalCount(RowNum rowNum) throws Exception{
		return sqlSession.selectOne(namespace+"endTotalCount", rowNum);
	}
	
	public List<EventDTO> endSelectList(RowNum rowNum) throws Exception {
		return sqlSession.selectList(namespace+"endSelectList", rowNum);
	}
	
	
	@Override
	public int hitUpdate(int num) throws Exception {
		return sqlSession.update(namespace+"hitUpdate", num);
	}
	@Override
	public int getNum() throws Exception {
		return sqlSession.selectOne(namespace+"getNum");
	}
	
	
}
