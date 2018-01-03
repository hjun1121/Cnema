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

	//selectList
<<<<<<< HEAD
	public List<MovieDTO> movieList(String kind) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("kind", kind);
		return sqlSession.selectList(NAMESPACE+"movieList", map);
=======
	public List<MovieDTO> movieList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"movieList");
	}
	
	/*heeseong*/
	public MovieDTO movieInfo(int movie_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"movieInfo",movie_num);
	}
	
	//gradeList
	public List<MovieDTO> gradeList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"gradeList");
	}
	
	//open_dateList
	public List<MovieDTO> open_dateList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"open_dateList");
>>>>>>> 2633f51e9c8713bf09261993101137dc86be93d9
	}

}
