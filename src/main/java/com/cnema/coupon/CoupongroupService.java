package com.cnema.coupon;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;


/*heesoeng 코드*/
@Service
@Transactional
public class CoupongroupService {
	@Inject
	private CoupongroupDAO coupongroupDAO;
	
	public int groupInsert(String id,int number) throws Exception{
		return coupongroupDAO.groupInsert(id,number);
	}
	public int gTotalCount() throws Exception{
		return coupongroupDAO.gTotalCount();
	}
	public ModelAndView groupList(ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(coupongroupDAO.gTotalCount());
		
		List<Object> groupCountList = new ArrayList<>();
		List<CoupongroupDTO> groupCount = new ArrayList<>();
		List<CoupongroupDTO> groupList = coupongroupDAO.groupList(rowNum);
		for (int num = 0; num < groupList.size(); num++) {
			groupCount = coupongroupDAO.groupSList(groupList.get(num).getGroup_num());
			groupCountList.add(groupCount.size());
		}
		mv.addObject("groupCountList", groupCountList);
		mv.addObject("groupList", groupList);
		mv.addObject("pager",pager);
		return mv;
		/*return coupongroupDAO.groupList();*/
	}

	public List<CoupongroupDTO> groupSList(int group_num) throws Exception{
		return coupongroupDAO.groupSList(group_num);
	}
	public List<CoupongroupDTO> groupAList() throws Exception{
		return coupongroupDAO.groupAList();
	}

	public int groupRemove(int group_num) throws Exception{
		return coupongroupDAO.groupRemove(group_num);
	}

	public int withdrawal(String id) throws Exception{
		return coupongroupDAO.withdrawal(id);
	}
}
