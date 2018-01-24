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
	
	public TheaterDTO selectOne(int theater_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne", theater_num);
	}
	
	public List<MovieDTO> selectList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	
	public List<TheaterDTO> locationList(String area) throws Exception{
		return sqlSession.selectList(NAMESPACE+"locationList", area);
	}

	public List<TheaterDTO> areaList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"areaList");
	}
	public List<TheaterDTO> qrAreaList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"qrAreaList");
	}
	
	/*heeseong*/
	/*public List<TheaterDTO> theatherAList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"theatherAList");
	}*/
	/*heeseong*/
	public List<TheaterDTO> theaterList(String kind, String search)  throws Exception{
		Map<String, Object> thMap = new HashMap<>();
		thMap.put("kind", kind);
		thMap.put("search", search);
		return sqlSession.selectList(NAMESPACE+"theaterList",thMap);
	}
	/*heeseong*/
	public TheaterDTO theaterInfo(int theater_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"theaterInfo",theater_num);
	}
	/*heeseong*/
	public int theaterRevision(TheaterDTO theaterDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"theaterRevision",theaterDTO);
	}
	/*heeseong*/
	public int theaterRemove(int theater_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"theaterRemove",theater_num);
	}
	/*heeseong*/
	public int theaterInsert(TheaterDTO theaterDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"theaterInsert",theaterDTO);
	}
}
