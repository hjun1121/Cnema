package com.cnema.community;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cnema.member.MemberDTO;
import com.cnema.util.FileSaver;

@Service
@Transactional
public class CommunityService {

	@Inject
	private PageDAO pageDAO;
	@Inject
	private FileSaver fileSaver;
	
	
	//memberCheck
	public int memberCheck(int page_num, String id) throws Exception {
		PageMemberDTO pageMemberDTO = null;
		int result = 0;
		pageMemberDTO = pageDAO.memberCheck(page_num, id);
		if(pageMemberDTO != null) {
			result = 1;
		}
		
		return result;
	}
	
	
	//selectPageMemberList
	public List<PageMemberDTO> selectPageMemberList(int page_num) throws Exception {
		return pageDAO.selectPageMemberList(page_num);
	}
	
	
	//memberInsert
	public int memberInsert(PageDTO pageDTO, String id) throws Exception {
		int result = pageDAO.memberInsert(pageDTO, id);
		result = pageDAO.memberCount(pageDTO.getPage_num());
		
		return result;
	}
	
	
	//pageInsert
	public int pageInsert(PageDTO pageDTO, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String id = "";
		id = memberDTO.getId();
		System.out.println("communityServie id : " + id);
		MultipartFile file = pageDTO.getFile();
		String name = fileSaver.fileSave(file, session, "page_logo");
		pageDTO.setFileName(name);
		pageDTO.setOriName(file.getOriginalFilename());
		int result = pageDAO.pageInsert(pageDTO);
		System.out.println(pageDTO.getPage_num());
		result = pageDAO.memberInsert(pageDTO, id);

		return result;
	}
	
	
	//selectPageOne
	public PageDTO selectPageOne(int page_num) throws Exception {
		return pageDAO.selectPageOne(page_num);
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
