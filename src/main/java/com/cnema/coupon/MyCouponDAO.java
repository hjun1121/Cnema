package com.cnema.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class MyCouponDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="myCouponMapper.";
	
	/*heeseong*/
	public List<MyCouponDTO> myCouponList(String id,String type) throws Exception{
		Map<String, Object> cMap = new HashMap<String, Object>();
		cMap.put("id", id);
		cMap.put("type", type);
		return sqlSession.selectList(NAMESPACE+"myCouponList",cMap);
	}
	/*heeseong*/
	public List<MyCouponDTO> myCouponAList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"myCouponAList",id);
	}
	
	/*heeseong*/
	public int dateUpdate(String id) throws Exception{
		return sqlSession.update(NAMESPACE+"dateUpdate",id);
	}
}
