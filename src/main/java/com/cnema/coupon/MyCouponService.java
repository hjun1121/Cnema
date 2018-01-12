package com.cnema.coupon;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cnema.member.MemberDTO;

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
	/*희성*/
	public int couponInsert(MemberDTO memberDTO, CouponDTO couponDTO) throws Exception{
		return myCouponDAO.couponInsert(memberDTO,couponDTO);
	}
}
