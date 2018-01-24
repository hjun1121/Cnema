package com.cnema.community;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class CommunityDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "communityMapper.";

	public List<PageDTO> recommendPageList(String search) throws Exception {
		return sqlSession.selectList(NAMESPACE+"recommendPageList",search);
	}
	
	public List<PageDTO> selectPageList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectPageList", id);
	}

}
