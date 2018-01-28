package com.cnema.coupon;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;

@Service
public class CouponService {
	@Inject
	private CouponDAO couponDAO;

	public CouponDTO couponOne(String name) throws Exception{
		return couponDAO.couponOne(name);
	}
	
	/*heeseong*/
	public List<CouponDTO> couponAList() throws Exception{
		return couponDAO.couponAList();
	}
	/*heeseong*/
	public CouponDTO couponInfo(int c_num) throws Exception{
		return couponDAO.couponInfo(c_num);
	}
	/*heeseong*/
	public ModelAndView couponList(String kind, String search,ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(couponDAO.totalCount(kind,search));
		
		List<CouponDTO> cList = couponDAO.couponList(kind, search, rowNum);
		mv.addObject("cList", cList);
		mv.addObject("pager",pager);
		return mv;
		/*return couponDAO.couponList(kind,search);*/
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
