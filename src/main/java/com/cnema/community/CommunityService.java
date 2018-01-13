package com.cnema.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cnema.util.FileSaver;

@Service
public class CommunityService {

	@Inject
	private PageDAO pageDAO;
	@Inject
	private FileSaver fileSaver;
	
	
	//selectRecommendPage
	public List<PageDTO> selectRecommendPage() throws Exception {
		return pageDAO.selectRecommendPage();
	}
	
	
	//selectPageList
	public List<PageDTO> selectPageList(String id) throws Exception {
		return pageDAO.selectPageList(id);
	}
	

}
