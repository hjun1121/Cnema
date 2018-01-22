package com.cnema.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CoupongroupDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="coupongroupMapper.";
	
	public int groupInsert(String id,int number) throws Exception{
		Map<String, Object> gMap = new HashMap<>();
		gMap.put("id", id);
		gMap.put("number", number);
		return sqlSession.insert(NAMESPACE+"groupInsert",gMap);
	}

	public List<CoupongroupDTO> groupList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"groupList");
	}

	public List<CoupongroupDTO> groupSList(int group_num) throws Exception{
		return sqlSession.selectList(NAMESPACE+"groupSList",group_num);
	}

	public int groupRemove(int group_num) throws Exception{
		Map<String, Object> gMap = new HashMap<>();
		gMap.put("group_num",group_num);
		return sqlSession.delete(NAMESPACE+"groupRemove",gMap);
	}

	public int withdrawal(String id) throws Exception{
		return sqlSession.delete(NAMESPACE+"withdrawal",id);
	}
}
