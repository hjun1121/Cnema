package com.cnema.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cnema.util.FileSaver;

@Service
public class CommunityService {

	@Inject
	private CommunityService communityService;
	@Inject
	private FileSaver fileSaver;
	
	
	//selectRecommendPage
	public List<PageDTO> selectRecommendPage() throws Exception {
		return communityService.selectRecommendPage();
	}
	
	
	//selectPageList
	public List<PageDTO> selectPageList(String id) throws Exception {
		return communityService.selectPageList(id);
	}
	
	
}
