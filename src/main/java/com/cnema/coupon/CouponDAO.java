package com.cnema.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="couponMapper.";
	
	public CouponDTO couponOne(String name) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"couponOne",name);
	}
	
	/*heeseong*/
	public List<CouponDTO> couponList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"couponList");
	}
	/*heeseong*/
	public CouponDTO couponInfo(int name) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"couponInfo",name);
	}
	/*heeseong*/
	public List<CouponDTO> couponSList(String kind, String search) throws Exception{
		Map<String, Object> cMap = new HashMap<>();
		cMap.put("kind", kind);
		cMap.put("search", search);
		return sqlSession.selectList(NAMESPACE+"couponSList",cMap);
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
	
}
