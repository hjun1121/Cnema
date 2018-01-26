package com.cnema.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class PageDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "pageMapper.";
	
	
	//selectPageMemberOne
	public PageMemberDTO selectPageMemberOne(String id, int page_num) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("page_num", page_num);
		return sqlSession.selectOne(NAMESPACE+"selectPageMemberOne", map);
	}
	
	
	//pageContentsWrite
	public int pageContentsWrite(PageContentsDTO pageContentsDTO){
		return sqlSession.update(NAMESPACE+"pageContentsWrite", pageContentsDTO);
	}
	
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
		Map<String, Object> map = new HashMap<>();
		map.put("pageDTO", pageDTO);
		return sqlSession.insert(NAMESPACE+"pageInsert", map);
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
	public List<PageDTO> recommendPageList(String search) throws Exception {
		return sqlSession.selectList(NAMESPACE+"recommendPageList",search);
	}
	
	//selectPageList 가입 페이지 목록
	public List<PageDTO> selectPageList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectPageList", id);
	}

}
