package com.cnema.coupon;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.theater.TheaterDTO;
import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;

@Service
@Transactional
public class MyCouponService {
	@Inject
	private MyCouponDAO myCouponDAO;
	
	public List<MyCouponDTO> myCouponList(String id)throws Exception{
		return myCouponDAO.myCouponList(id);
	}
	
	public int qrCouponUpdate(int c_num, String id) throws Exception{
		return myCouponDAO.qrCouponUpdate(c_num, id);
	}
	
	/*heeseong*/
	public int hTotalCount(String id,String type) throws Exception{
		return myCouponDAO.hTotalCount(id, type);
	}
	/*희성*/
	public ModelAndView myCouponHistoryList(String id,String type,ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(myCouponDAO.hTotalCount(id, type));
		
		List<MyCouponDTO> mcList = myCouponDAO.myCouponHistoryList(id, type, rowNum);
		mv.addObject("mcList", mcList);
		mv.addObject("pager",pager);
		return mv;
		/*return myCouponDAO.myCouponHistoryList(id,kind);*/
	}
	/*희성*/
	public List<MyCouponDTO> myCouponAList(String id) throws Exception{
		return myCouponDAO.myCouponAList(id);
	}
	/*희성*/
	public int dateUpdate(String id) throws Exception{
		return myCouponDAO.dateUpdate(id);
	}
	/*heeseong*/
	public int dTotalCount(String id,String dp1,String dp2) throws Exception{
		return myCouponDAO.dTotalCount(id, dp1,dp2);
	}
	/*희성*/
	public ModelAndView myCouponDList(String id,String dp1,String dp2,ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(myCouponDAO.dTotalCount(id, dp1,dp2));
		
		List<MyCouponDTO> cdList = myCouponDAO.myCouponDList(id, dp1,dp2, rowNum);
		mv.addObject("cdList", cdList);
		mv.addObject("pager",pager);
		return mv;
		/*return myCouponDAO.myCouponDList(id,dp1,dp2);*/
	}
	/*희성*/
	public int couponInsert(String id, CouponDTO couponDTO) throws Exception{
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, couponDTO.getV_day());
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
		String v_date = sd.format(cal.getTime());
		
		return myCouponDAO.couponInsert(id,couponDTO,v_date);
	}
	/*희성*/
	public int couponCount(String id) throws Exception{
		return myCouponDAO.couponCount(id);
	}
	/*희성*/
	public int couponACount(String id) throws Exception{
		return myCouponDAO.couponACount(id);
	}
	/*희성*/
	public int withdrawal(String id) throws Exception{
		return myCouponDAO.withdrawal(id);
	}
}
