package com.cnema.coupon;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CouponService {
	@Inject
	private CouponDAO couponDAO;

	public List<CouponDTO> couponList() {
		return couponDAO.couponList();
	}
	
	public CouponDTO couponInfo(int ctype) {
		return couponDAO.couponInfo(ctype);
	}
	
}
