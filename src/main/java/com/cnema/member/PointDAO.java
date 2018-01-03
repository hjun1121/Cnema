package com.cnema.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "pointMapper.";
	
	public List<PointDTO> pointList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"pointList",id);
	}
}
