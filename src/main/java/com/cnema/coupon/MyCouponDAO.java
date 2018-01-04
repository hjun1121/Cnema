package com.cnema.coupon;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MyCouponDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="myCouponMapper.";
	
	/*heeseong*/
	public List<MyCouponDTO> myCouponList(String id) throws Exception{
		return sqlSession.selectList(NAMESPACE+"myCouponList",id);
	}
}
