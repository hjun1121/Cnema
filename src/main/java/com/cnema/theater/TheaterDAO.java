package com.cnema.theater;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.movie.MovieDTO;

@Repository
public class TheaterDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private final String NAMESPACE="theaterMapper.";
	
	public TheaterDTO selectOne(int theater_num){
		return sqlSession.selectOne(NAMESPACE+"selectOne", theater_num);
	}
	
	public List<MovieDTO> selectList(){
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	
	public List<TheaterDTO> locationList(String area){
		return sqlSession.selectList(NAMESPACE+"locationList", area);
	}

	public List<TheaterDTO> areaList(){
		return sqlSession.selectList(NAMESPACE+"areaList");
	}
	
	/*heeseong*/
	public List<TheaterDTO> theatherAList() {
		return sqlSession.selectList(NAMESPACE+"theatherAList");
	}
	/*heeseong*/
	public List<TheaterDTO> thSearchList(String kind, String search) {
		Map<String, Object> thMap = new HashMap<>();
		thMap.put("kind", kind);
		thMap.put("search", search);
		return sqlSession.selectList(NAMESPACE+"thSearchList",thMap);
	}
	/*heeseong*/
	public TheaterDTO theaterInfo(int theater_num) {
		return sqlSession.selectOne(NAMESPACE+"theaterInfo",theater_num);
	}
	/*heeseong*/
	public int theaterRevision(TheaterDTO theaterDTO) {
		return sqlSession.update(NAMESPACE+"theaterRevision",theaterDTO);
	}
	/*heeseong*/
	public int theaterRemove(int theater_num) {
		return sqlSession.delete(NAMESPACE+"theaterRemove",theater_num);
	}
	/*heeseong*/
	public int theaterInsert(TheaterDTO theaterDTO) {
		return sqlSession.insert(NAMESPACE+"theaterInsert",theaterDTO);
	}
}
