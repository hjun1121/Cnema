package com.cnema.qna;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.board.BoardDAO;
import com.cnema.board.BoardDTO;
import com.cnema.util.RowNum;

@Repository
public class QnaDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "qnaMapper.";
	
	public List<BoardDTO> selectList(RowNum rowNum) throws Exception {
		return sqlSession.selectList(namespace+"selectList", rowNum);
	}

	public QnaDTO selectOne(int num) throws Exception {
		return sqlSession.selectOne(namespace+"selectOne", num);
	}

	
	public int insert(QnaDTO boardDTO) throws Exception {
		return sqlSession.insert(namespace+"insert", boardDTO);
	}
	
	//update 필요없음
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(int num) throws Exception {
		return sqlSession.delete(namespace+"delete", num);
	}

	public int totalCount(RowNum rowNum) throws Exception {
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}

	

	public int getNum() throws Exception {
		return sqlSession.selectOne(namespace+"getNum");
	}


}
