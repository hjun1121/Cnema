package com.cnema.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

/*heesoeng code*/
@Service
public class CommunityService {
	@Inject
	private CommunityDAO communityDAO;
	
	public PageDTO recommendPageList(String search,int num) throws Exception {
		return communityDAO.recommendPageList(search,num);
	}
	
	public List<PageDTO> myPageList(String id,String search) throws Exception {
		return communityDAO.myPageList(id,search);
	}
	
	public List<Integer> pageNumList(String id) throws Exception{
		return communityDAO.pageNumList(id);
	}
}
