package com.cnema.coupon;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MyCouponService {
	@Inject
	private MyCouponDAO myCouponDAO;
	
	public MyCouponDTO selectOne(String id) throws Exception{
		return myCouponDAO.selectOne(id);
	}
}
