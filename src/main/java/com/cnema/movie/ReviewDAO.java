package com.cnema.movie;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "reviewMapper.";
	public int reviewInsert(int movie_num, String id, String review) {
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("movie_num", movie_num);
		rMap.put("id", id);
		rMap.put("review", review);
		return sqlSession.insert(NAMESPACE+"reviewInsert",rMap);
	}
	
}
