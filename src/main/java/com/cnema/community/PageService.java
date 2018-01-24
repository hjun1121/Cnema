package com.cnema.community;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cnema.member.MemberDTO;
import com.cnema.util.FileSaver;

@Service
public class PageService {

	@Inject
	private PageDAO pageDAO;
	@Inject
	private FileSaver fileSaver;
	
	//pageContentsWrite
	public int pageContentsWrite(PageContentsDTO pageContentsDTO)throws Exception{
		int result = pageDAO.pageContentsWrite(pageContentsDTO);
		
		return result;
	}
	
	//memberDrop
	public int memberDrop(int page_num, String id) throws Exception {
		int result = pageDAO.memberDrop(page_num, id);
		result = pageDAO.memberDropCount(page_num);
		
		return result;
	}
	
	//memberCheck
	public int memberCheck(int page_num, String id) throws Exception {
		PageMemberDTO pageMemberDTO = null;
		int result = 0;
		pageMemberDTO = pageDAO.memberCheck(page_num, id);
		if(pageMemberDTO != null) { //가입한 페이지일 경우
			if(pageMemberDTO.getType() == 20) { //그룹장일 경우
				result = 20;
			} else {
				result = 11; //일반회원일 경우
			}
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
		MultipartFile file = pageDTO.getFile();
		String name = fileSaver.fileSave(file, session, "page_logo");
		pageDTO.setFileName(name);
		pageDTO.setOriName(file.getOriginalFilename());
		int result = pageDAO.pageInsert(pageDTO);
		result = pageDAO.memberInsert(pageDTO, id);

		return result;
	}
	
	
	//selectPageOne
	public PageDTO selectPageOne(int page_num) throws Exception {
		return pageDAO.selectPageOne(page_num);
	}
	
}
