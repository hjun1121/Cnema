package com.cnema.reserve;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="reserveMapper.";
	
	/*heeseong*/
	public List<ReserveDTO> reserveList(String id,String kind) throws Exception{
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("id", id);
		rMap.put("kind", kind);
		return sqlSession.selectList(NAMESPACE+"reserveList", rMap);
	}
	/*heeseong*/
	public List<ReserveDTO> reserveAList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"reserveAList", id);
	}
	/*heeseong*/
	public int reserveDel(int reserve_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"reserveDel",reserve_num);
	}
}
