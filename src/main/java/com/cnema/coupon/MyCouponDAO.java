package com.cnema.coupon;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MyCouponDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="myCouponMapper.";
	
	public MyCouponDTO selectOne(String id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectOne",id);
	}
}
