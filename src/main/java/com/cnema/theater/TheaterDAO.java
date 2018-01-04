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
	
	public List<DayDTO> dayList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"dayList");
	}
	
	public TheaterDTO selectOne(int theater_num){
		return sqlSession.selectOne(NAMESPACE+"selectOne", theater_num);
	}
	
	public List<MovieDTO> selectList(){
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	
	public List<TheaterDTO> locationList(String area){
		return sqlSession.selectList(NAMESPACE+"locationList", area);
	}
}
