package com.cnema.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class MovieDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "movieMapper.";


	//selectOne
	public MovieDTO selectOne(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}

	//insert
	public int insert(MovieDTO movieDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"insert", movieDTO);
	}

	//delete

	//update
	
	//wishList
	public List<WishDTO> wishList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"wishList");
	}
	
	//wish
	public int movieWish(String id, int num) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put(id, num);
		return sqlSession.update(NAMESPACE+"movieWish", map);
	}

	//selectList
	public List<MovieDTO> movieList(String kind) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		return sqlSession.selectList(NAMESPACE+"movieList", map);
	}
	
	/*heeseong*/
	public MovieDTO movieInfo(int movie_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"movieInfo",movie_num);
	}
	
	/*heeseong*/
	public List<MovieDTO> movieAList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"movieAList");
	}
	
}
