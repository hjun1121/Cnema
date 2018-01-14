package com.cnema.coupon;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CouponService {
	@Inject
	private CouponDAO couponDAO;

	/*heeseong*/
	public List<CouponDTO> couponList() throws Exception{
		return couponDAO.couponList();
	}
	/*heeseong*/
	public CouponDTO couponInfo(int name) throws Exception{
		return couponDAO.couponInfo(name);
	}
	/*heeseong*/
	public List<CouponDTO> couponSList(String kind, String search) throws Exception{
		return couponDAO.couponSList(kind,search);
	}
	/*heeseong*/
	public int couponInsert(CouponDTO couponDTO) throws Exception{
		return couponDAO.couponInsert(couponDTO);
	}
	/*heeseong*/
	public int couponRevision(CouponDTO couponDTO) throws Exception{
		return couponDAO.couponRevision(couponDTO);
	}
	/*heeseong*/
	public CouponDTO couponRevisionInfo(String name) throws Exception{
		return couponDAO.couponRevisionInfo(name);
	}
	
}
