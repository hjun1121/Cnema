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
	
	public List<PageDTO> selectPageList(String id) throws Exception {
		return communityDAO.selectPageList(id);
	}
}
