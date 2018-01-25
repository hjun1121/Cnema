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
	
	public List<PageDTO> myPageList(String id,String search) throws Exception {
		Map<String, Object> mpMap = new HashMap<>();
		mpMap.put("id", id);
		mpMap.put("search", search);
		return sqlSession.selectList(NAMESPACE+"myPageList", mpMap);
	}
	
	
	public List<Integer> pageNumList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"pageNumList",id);
	}
	
	public List<String> pageIdList(int num) throws Exception {
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("num", num);
		return sqlSession.selectList(NAMESPACE+"pageIdList",num);
	}
	
	public List<Integer> recommendPageList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"recommendPageList",id);
	}

	public PageDTO pageSelect(String search, int page_num) throws Exception{
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("search", search);
		rMap.put("page_num", page_num);
		return sqlSession.selectOne(NAMESPACE+"pageSelect",rMap);
	}

	public List<Integer> pageList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"pageList");
	}
}
