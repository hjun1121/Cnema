package com.cnema.coupon;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MyCouponService {
	@Inject
	private MyCouponDAO myCouponDAO;
	
	public int qrCouponUpdate(int c_num, String id) throws Exception{
		return myCouponDAO.qrCouponUpdate(c_num, id);
	}
	
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
	public int couponInsert(String id, CouponDTO couponDTO) throws Exception{
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, couponDTO.getV_day());
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
		String v_date = sd.format(cal.getTime());
		
		couponDTO.setV_date(v_date);
		
		return myCouponDAO.couponInsert(id,couponDTO);
	}
	/*희성*/
	public int couponCount(String id) throws Exception{
		return myCouponDAO.couponCount(id);
	}
}
