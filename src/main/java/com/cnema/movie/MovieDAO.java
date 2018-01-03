package com.cnema.movie;



import java.util.List;

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
	}

}
