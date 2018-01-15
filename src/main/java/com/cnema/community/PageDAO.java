package com.cnema.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.member.MemberDTO;

@Repository
public class PageDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "communityMapper.";
	
	
	//pageInsert
	public int pageInsert(PageDTO pageDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"pageInsert", pageDTO);
	}
	
	//memberInsert
	public int memberInsert(PageDTO pageDTO, String id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("pageDTO", pageDTO);
		map.put("id", id);
		return sqlSession.insert(NAMESPACE+"memberInsert", map);
	}
	
	//selectRecommendPage
	public List<PageDTO> selectRecommendPage() throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectRecommendPage");
	}
	
	//selectPageList 가입 페이지 목록
	public List<PageDTO> selectPageList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectPageList", id);
	}

}
