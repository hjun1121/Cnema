package com.cnema.theater;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.movie.MovieDTO;

@Repository
public class TheaterDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private final String NAMESPACE="theaterMapper.";
	
	public List<MovieDTO> selectList(){
		
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	
	public List<TheaterDTO> locationList(String area){
		return sqlSession.selectList(NAMESPACE+"locationList", area);
	}
}
