package com.cnema.community;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.member.MemberDTO;
import com.cnema.message.MessageDTO;
import com.cnema.util.FileSaver;
import com.cnema.util.ListData;
import com.cnema.util.Pager;
import com.cnema.util.RowNum;

@Service
@Transactional
public class PageService {

	@Inject
	private PageDAO pageDAO;
	@Inject
	private FileSaver fileSaver;
	
	//mailSend
	public int mailSend(MessageDTO messageDTO) throws Exception {
		return pageDAO.mailSend(messageDTO);
	}
	
	//pageMemberProfile
	public List<MemberDTO> pageMemberProfile(int page_num, String search) throws Exception {
		return pageDAO.pageMemberProfile(page_num, search);
	}
	
	//recommendPageList
	public List<PageDTO> recommendPageList() throws Exception {
		return pageDAO.recommendPageList();
	}
	
	//joinPageList
	public List<PageDTO> joinPageList(String id) throws Exception {
		return pageDAO.joinPageList(id);
	}
	
	//mailCount
	public int mailCount(String id) throws Exception {
		return pageDAO.mailCount(id);
	}
	
	//sendMailView
	public MessageDTO sendMailView(int message_num) throws Exception {
		return pageDAO.selectMailOne(message_num);
	}
	
	//selectSendMail
	public ModelAndView selectSendMail(String id, ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(pageDAO.sendMailTotalCount(id));
		
		List<MessageDTO> ar = pageDAO.selectSendMail(id, rowNum);
		mv.addObject("pager", pager);
		mv.addObject("mailList", ar);
		return mv;
	}
	
	//selectMailOne
	public MessageDTO selectMailOne(int message_num) throws Exception {
		int result = 0;
		result = pageDAO.mailRead(message_num);
		MessageDTO messageDTO = new MessageDTO();
		if(result > 0) {
			messageDTO = pageDAO.selectMailOne(message_num);
		}
		
		return messageDTO;
	}
	
	//mailReceive
	public ModelAndView mailReceive(HttpSession session, ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String id = memberDTO.getId();
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(pageDAO.mailTotalCount(id));

		List<MessageDTO> mailList = pageDAO.mailReceive(id, rowNum);
		mv.addObject("pager", pager);
		mv.addObject("mailList", mailList);
		return mv;
	}

	//selectPageMemberOne
	public PageMemberDTO selectPageMemberOne(String id, int page_num) throws Exception {
		return pageDAO.selectPageMemberOne(id, page_num);
	}
	
	//pageContentsWrite
	public int pageContentsWrite(PageContentsDTO pageContentsDTO) throws Exception{
		int result = pageDAO.pageContentsWrite(pageContentsDTO);
		
		return result;
	}
	//pageCotentsList
	public List<PageContentsDTO> pageContentslist(int page) throws Exception{
		page=(page*10)+1;
		
		List<PageContentsDTO> ar = pageDAO.pageContentsList(page);
		
		return ar;
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
