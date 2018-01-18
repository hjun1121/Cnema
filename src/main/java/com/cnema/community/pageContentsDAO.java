package com.cnema.community;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class pageContentsDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "pageContentsMapper.";

	//contentsInsert
	public int contentsInsert(String id, int page_num, PageContentsDTO pageContentsDTO) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("page_num", page_num);
		map.put("pageContentsDTO", pageContentsDTO);
		return sqlSession.insert(NAMESPACE+"contentsInsert", map);
	}
		
	
	
}

