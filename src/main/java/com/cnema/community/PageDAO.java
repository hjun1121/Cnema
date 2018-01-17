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
	
	
	//memberDropCount
	public int memberDropCount(int page_num) throws Exception {
		return sqlSession.update(NAMESPACE+"memberDropCount", page_num);
	}
	
	
	//memberDrop
	public int memberDrop(int page_num, String id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("page_num", page_num);
		map.put("id", id);
		return sqlSession.delete(NAMESPACE+"memberDrop", map);
	}
	
	
	//memberCheck
	public PageMemberDTO memberCheck(int page_num, String id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("page_num", page_num);
		map.put("id", id);
		return sqlSession.selectOne(NAMESPACE+"memberCheck", map);
	}

	//selectPageMember
	public List<PageMemberDTO> selectPageMemberList(int page_num) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectPageMemberList", page_num);
	}
	
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
	
	//memberCount
	public int memberCount(int page_num) throws Exception {
		return sqlSession.update(NAMESPACE+"memberCount", page_num);
	}
	
	//selectPageOne
	public PageDTO selectPageOne(int page_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"selectPageOne", page_num);
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
