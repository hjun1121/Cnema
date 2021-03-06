package com.cnema.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;

/*heesoeng code*/
@Service
public class CommunityService {
	@Inject
	private CommunityDAO communityDAO;
	
	public int totalCount(String id, String search) throws Exception{
		return communityDAO.totalCount(id, search);
	}
	public ModelAndView myPageList(String id,String search,ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(communityDAO.totalCount(id,search));
		
		List<PageDTO> myPageList = communityDAO.myPageList(id, search, rowNum);
		mv.addObject("myPageList", myPageList);
		mv.addObject("pager",pager);
		return mv;
	}
	
	
	public List<Integer> pageNumList(String id) throws Exception{
		return communityDAO.pageNumList(id);
	}

	public List<String> pageIdList(int num) throws Exception {
		return communityDAO.pageIdList(num);
	}
	
	public List<Integer> recommendPageList(String id) throws Exception {
		return communityDAO.recommendPageList(id);
	}
	
	public PageDTO pageSelect(String search, int page_num) throws Exception{
		return communityDAO.pageSelect(search,page_num);
	}

	public List<Integer> pageList() throws Exception{
		return communityDAO.pageList();
	}
	public int pageMemberNum(int p_num) throws Exception{
		return communityDAO.pageMemberNum(p_num);
	}
	public List<PageDTO> myPageAList(String id) throws Exception{
		return communityDAO.myPageAList(id);
	}
	public int pTotalCount(String search) throws Exception{
		return communityDAO.pTotalCount(search);
	}
	public ModelAndView pageAllList(String search,ListData listData) throws Exception{
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(communityDAO.pTotalCount(search));
		
		List<PageDTO> pageAllList = communityDAO.pageAllList(search, rowNum);
		mv.addObject("pageAllList", pageAllList);
		mv.addObject("pager",pager);
		return mv;
	}
	
}
