package com.cnema.community;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class PageDAO {
	
	private SqlSession sqlSession;
	private static final String NAMESPACE = "communityMapper.";
	
	
	//selectRecommendPage
	public List<PageDTO> selectRecommendPage() throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectRecommendPage");
	}
	
	//selectPageList 가입 페이지 목록
	public List<PageDTO> selectPageList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectPageList", id);
	}

}
