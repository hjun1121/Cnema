package com.cnema.community;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cnema.util.FileSaver;

@Service
public class CommunityService {

	@Inject
	private PageDAO pageDAO;
	@Inject
	private FileSaver fileSaver;
	
	
	//pageInsert
	public int pageInsert(PageDTO pageDTO, String id, HttpSession session) throws Exception {
		MultipartFile file = pageDTO.getFile();
		String name = fileSaver.fileSave(file,  session,  "page_logo");
		pageDTO.setFileName(name);
		pageDTO.setOriName(file.getOriginalFilename());
		int result = pageDAO.pageInsert(pageDTO, id);
		
		return result;
	}
	
	
	//selectRecommendPage
	public List<PageDTO> selectRecommendPage() throws Exception {
		return pageDAO.selectRecommendPage();
	}
	
	
	//selectPageList
	public List<PageDTO> selectPageList(String id) throws Exception {
		return pageDAO.selectPageList(id);
	}
	

}
