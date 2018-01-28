package com.cnema.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.util.RowNum;

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

	public List<CoupongroupDTO> groupList(RowNum rowNum) throws Exception{
		Map<String, Object> cgMap = new HashMap<>();
		cgMap.put("rowNum", rowNum);
		return sqlSession.selectList(NAMESPACE+"groupList",cgMap);
		/*return sqlSession.selectList(NAMESPACE+"groupList");*/
	}
	
	public int gTotalCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"gTotalCount");
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

	public List<CoupongroupDTO> groupAList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"groupAList");
	}

}
