package com.cnema.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.util.RowNum;

@Repository
public class PointDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "pointMapper.";
	
	public int getPoint(PointDTO pointDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"getPoint", pointDTO);
	}
	
	public int usePoint(PointDTO pointDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"usePoint", pointDTO);
	}
	
	/*heeseong*/
	public int pTotalCount(String id,String testDatepicker1,String testDatepicker2) throws Exception{
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("id", id);
		
		pMap.put("datepicker1", testDatepicker1);
		pMap.put("datepicker2", testDatepicker2);
		return sqlSession.selectOne(NAMESPACE+"pTotalCount",pMap);
	}
	/*HeeSeong*/
	public List<PointDTO> pointList(String id,String testDatepicker1,String testDatepicker2,RowNum rowNum) throws Exception{
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("id", id);
		pMap.put("datepicker1", testDatepicker1);
		pMap.put("datepicker2", testDatepicker2);
		pMap.put("rowNum", rowNum);
		return sqlSession.selectList(NAMESPACE+"pointList",pMap);
		/*Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("id", id);
		pMap.put("datepicker1", testDatepicker1);
		pMap.put("datepicker2", testDatepicker2);
		return sqlSession.selectList(NAMESPACE+"pointList",pMap);*/
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
	/*HeeSeong*/
	public int withdrawal(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"withdrawal",id);
	}
}
