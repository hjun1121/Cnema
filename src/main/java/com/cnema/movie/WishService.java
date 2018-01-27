package com.cnema.movie;

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
public class WishService {
	@Inject
	private WishDAO wishDAO;
	
	/*heeseong*/
	public int wTotalCount(String id,String kind) throws Exception{
		return wishDAO.wTotalCount(id,kind);
	}
	/*희성*/
	public ModelAndView wishList(String id,String kind, ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(wishDAO.wTotalCount(id,kind));
		
		List<WishDTO> wishList = wishDAO.wishList(id, kind,rowNum);
		mv.addObject("wList", wishList);
		mv.addObject("pager",pager);
		return mv;
		/*return wishDAO.wishList(id,kind);*/
	}
	/*희성*/
	public int wishListDelete(int wish_num) throws Exception{
		return wishDAO.wishListDelete(wish_num);
	}
}
