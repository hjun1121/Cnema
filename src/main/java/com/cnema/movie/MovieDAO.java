package com.cnema.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional
public class MovieDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "movieMapper.";

	
	//warningUpdate
	public int warningUpdate(int review_num) throws Exception {
		return sqlSession.update(NAMESPACE+"warningUpdate", review_num);
	}
	
	
	//warningInsert
	public int warningInsert(String id, int review_num) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("review_num", review_num);
		return sqlSession.insert(NAMESPACE+"warningInsert", map);
	}
	
	
	//reviewList
	public List<ReviewDTO> reviewList(int movie_num) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("movie_num", movie_num);
		return sqlSession.selectList(NAMESPACE+"reviewList", map);
	}

	//selectOne
	public MovieDTO selectOne(int movie_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", movie_num);
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
	
	//wishList
	public List<WishDTO> wishList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+"wishList1", id);
	}
	
	//wishInsert
	public int wishInsert(String id, int movie_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("movie_num", movie_num);
		return sqlSession.insert(NAMESPACE+"wishInsert", map);
	}
	
	//wishDelete
	public int wishDelete(String id, int movie_num) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("movie_num", movie_num);
		return sqlSession.delete(NAMESPACE+"wishDelete", map);
	}

	//wish
	public int movieWish(int movie_num) throws Exception {
		return sqlSession.update(NAMESPACE+"movieWish", movie_num);
	}
	
	//wishReturn
	public int movieWishReturn(int movie_num) throws Exception {
		return sqlSession.update(NAMESPACE+"movieWishReturn", movie_num);
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
	/*heeseong*/
	public int movieRevision(MovieDTO movieDTO) {
		return sqlSession.update(NAMESPACE+"movieRevision",movieDTO);
	}
}
