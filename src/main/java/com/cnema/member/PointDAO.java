package com.cnema.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "pointMapper.";
	
	/*HeeSeong*/
	public List<PointDTO> pointList(String id,String testDatepicker1,String testDatepicker2) throws Exception{
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("id", id);
		pMap.put("datepicker1", testDatepicker1);
		pMap.put("datepicker2", testDatepicker2);
		return sqlSession.selectList(NAMESPACE+"pointList",pMap);
	}
	
	/*HeeSeong*/
	public List<PointDTO> pointAList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"pointAList",id);
	}
	/*HeeSeong*/
	public int pointInsert(int price,String id) throws Exception{
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("price", price);
		pMap.put("id", id);
		return sqlSession.insert(NAMESPACE+"pointInsert",pMap);
	}
}
