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
	/*public List<ReserveDTO> reserveList(String id,String kind) throws Exception{
		Map<String, String> reserveMap = new HashMap<>();
		reserveMap.put("id",id);
		reserveMap.put("kind",kind);
		return sqlSession.selectList(NAMESPACE+"reserveList", reserveMap);
	}*/
	public List<ReserveDTO> reserveList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"reserveList", id);
	}
	/*heeseong*/
	public int reserveDel(int reserve_num) throws Exception{
		return sqlSession.delete(NAMESPACE+"reserveDel",reserve_num);
	}
}
