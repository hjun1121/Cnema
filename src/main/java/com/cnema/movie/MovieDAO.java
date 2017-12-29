package com.cnema.movie;



import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class MovieDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "movieMapper.";


	//selectList
	
	//selectOne
	public MovieDTO selectOne(int num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", num);
	}

	//insert

	//delete

	//update



}
