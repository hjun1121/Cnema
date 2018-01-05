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
	
	//wishInsert
	public int wishInsert(String id, int movie_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("movie_num", movie_num);
		return sqlSession.insert(NAMESPACE+"wishInsert", map);
	}
	
	//wish
	public int movieWish(String id, int movie_num) throws Exception {
		return sqlSession.update(NAMESPACE+"movieWish", movie_num);
	}
	public int movieWish1(int movie_num) throws Exception{
		System.out.println("innnnnnnnnnnnnnnnnnnnnnn ");
		System.out.println(movie_num);
		movie_num =  sqlSession.update(NAMESPACE+"movieWish", movie_num);
		System.out.println("===========" + movie_num + "+++++++++++++++++++++");
		//return sqlSession.update(NAMESPACE+"movieWish", movie_num);
		return movie_num;
		
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
