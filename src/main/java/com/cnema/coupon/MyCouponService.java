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
	/*희성*/
	public List<MyCouponDTO> myCouponAList(String id) throws Exception{
		return myCouponDAO.myCouponAList(id);
	}
	/*희성*/
	public int dateUpdate(String id) throws Exception{
		return myCouponDAO.dateUpdate(id);
	}
	/*희성*/
	public List<MyCouponDTO> myCouponDList(String id,String dp1,String dp2) throws Exception{
		return myCouponDAO.myCouponDList(id,dp1,dp2);
	}
}
