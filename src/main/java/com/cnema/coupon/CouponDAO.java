package com.cnema.coupon;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="couponMapper.";
	
	public List<CouponDTO> couponList() {
		return sqlSession.selectList(NAMESPACE+"couponList");
	}
	
	public CouponDTO couponInfo(int ctype) {
		return sqlSession.selectOne(NAMESPACE+"couponInfo",ctype);
	}
	
}
