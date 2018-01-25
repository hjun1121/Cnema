package com.cnema.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

/*heesoeng code*/
@Service
public class CommunityService {
	@Inject
	private CommunityDAO communityDAO;
	
	
	public List<PageDTO> myPageList(String id,String search) throws Exception {
		return communityDAO.myPageList(id,search);
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
}
