package com.cnema.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<PageDTO> myPageList(String id,String search) throws Exception {
		Map<String, Object> mpMap = new HashMap<>();
		mpMap.put("id", id);
		mpMap.put("search", search);
		return sqlSession.selectList(NAMESPACE+"myPageList", mpMap);
	}
	
	/*public List<PageDTO> pageList(String search) throws Exception{
		return sqlSession.selectList(NAMESPACE+"pageList",search);
	}*/

}
