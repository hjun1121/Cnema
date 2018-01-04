package com.cnema.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.board.BoardDAO;
import com.cnema.board.BoardDTO;
import com.cnema.util.RowNum;

@Repository
public class NoticeDAO implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "noticeMapper.";
	
	@Override
	public List<BoardDTO> selectList(RowNum rowNum) throws Exception {
		return sqlSession.selectList(namespace+"selectList", rowNum); 
	}
	@Override
	public BoardDTO selectOne(int num) throws Exception {
		return sqlSession.selectOne(namespace+"selectOne", num);
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
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}
	@Override
	public int hitUpdate(int num) throws Exception {
		return sqlSession.update(namespace+"hitUpdate", num);
	}
	@Override
	public int getNum() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
}
