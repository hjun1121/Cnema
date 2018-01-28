package com.cnema.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cnema.util.RowNum;

@Repository
public class CouponDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="couponMapper.";
	
	public CouponDTO couponOne(String name) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"couponOne",name);
	}
	
	/*heeseong
	public List<CouponDTO> couponList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"couponList");
	}*/
	/*heeseong*/
	public CouponDTO couponInfo(int c_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"couponInfo",c_num);
	}
	/*heeseong*/
	public int totalCount(String kind, String search) throws Exception{
		Map<String, Object> cMap = new HashMap<>();
		cMap.put("kind", kind);
		cMap.put("search", search);
		return sqlSession.selectOne(NAMESPACE+"totalCount",cMap);
	}
	/*heeseong*/
	public List<CouponDTO> couponList(String kind, String search,RowNum rowNum) throws Exception{
		Map<String, Object> cMap = new HashMap<>();
		cMap.put("kind", kind);
		cMap.put("search", search);
		cMap.put("rowNum", rowNum);
		return sqlSession.selectList(NAMESPACE+"couponList",cMap);
	}
	/*heeseong*/
	public int couponInsert(CouponDTO couponDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"couponInsert",couponDTO);
	}
	/*heeseong*/
	public int couponRevision(CouponDTO couponDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"couponRevision",couponDTO);
	}
	/*heeseong*/
	public CouponDTO couponRevisionInfo(String name) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"couponRevisionInfo",name);
	}

	public List<CouponDTO> couponAList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"couponAList");
	}
}
