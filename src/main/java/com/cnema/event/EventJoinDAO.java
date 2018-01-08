package com.cnema.event;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EventJoinDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "eventMapper.";
	
}
