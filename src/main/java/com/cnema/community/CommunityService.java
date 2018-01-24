package com.cnema.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

/*heesoeng code*/
@Service
public class CommunityService {
	@Inject
	private CommunityDAO communityDAO;
	
	public List<PageDTO> recommendPageList(String search) throws Exception {
		return communityDAO.recommendPageList(search);
	}
	
	public List<PageDTO> myPageList(String id,String search) throws Exception {
		return communityDAO.myPageList(id,search);
	}
	
	/*public List<PageDTO> pageList(String search) throws Exception{
		return communityDAO.pageList(search);
	}*/
}
