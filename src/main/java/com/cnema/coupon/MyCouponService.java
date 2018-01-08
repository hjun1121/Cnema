package com.cnema.coupon;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MyCouponService {
	@Inject
	private MyCouponDAO myCouponDAO;
	
	/*희성*/
	public List<MyCouponDTO> myCouponList(String id,String kind) throws Exception{
		return myCouponDAO.myCouponList(id,kind);
	}
	public List<MyCouponDTO> myCouponAList(String id) throws Exception{
		return myCouponDAO.myCouponAList(id);
	}
}
