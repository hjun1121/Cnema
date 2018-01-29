package com.cnema.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<BoardDTO> selectMyList(String id) throws Exception {
		return sqlSession.selectList(namespace+"selectMyList",id);
	}

	public QnaDTO selectOne(int num) throws Exception {
		return sqlSession.selectOne(namespace+"selectOne", num);
	}

	
	public int insert(QnaDTO boardDTO) throws Exception {
		return sqlSession.insert(namespace+"insert", boardDTO);
	}
	
	//qna 답글 다는 것으로 표현
	public int update(QnaDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"update",boardDTO);
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
	/*heeseong*/
	public int qTotalCount(String id,String kind,String search) throws Exception{
		Map<String, Object> qMap = new HashMap<>();
		qMap.put("id", id);
		qMap.put("kind", kind);
		qMap.put("search", search);
		return sqlSession.selectOne(namespace+"qTotalCount",qMap);
	}
	/*heeseong*/
	public List<QnaDTO> myQnaList(String id,String kind,String search,RowNum rowNum) throws Exception {
		Map<String, Object> qMap = new HashMap<>();
		qMap.put("id", id);
		qMap.put("kind", kind);
		qMap.put("search", search);
		qMap.put("rowNum", rowNum);
		return sqlSession.selectList(namespace+"myQnaList",qMap);
	}


}
