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
	
	public List<PointDTO> pointList(String id,String testDatepicker) throws Exception{
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("id", id);
		pMap.put("datepicker", testDatepicker);
		return sqlSession.selectList(NAMESPACE+"pointList",pMap);
	}
}
