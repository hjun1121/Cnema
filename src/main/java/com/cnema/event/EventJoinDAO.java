package com.cnema.event;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.board.BoardDTO;

@Repository
public class EventJoinDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "eventMapper.";
	
	public int insert(EventJoinDTO eventJoinDTO) throws Exception {
		int result = sqlSession.insert(namespace+"joinInsert", eventJoinDTO);
		return result;
	}
	
}
