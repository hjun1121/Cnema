package com.cnema.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cnema.reserve.ReserveDTO;
import com.cnema.util.FileSaver;

@Service
public class MemberService {
	@Inject
	private MemberDAO memberDAO;
	
	@Inject
	private FileSaver fileSaver;
	
	/*kim*/
	public MemberDTO login(MemberDTO memberDTO) throws Exception{
		return memberDAO.login(memberDTO);
	}
	
	public int join(MemberDTO memberDTO, HttpSession session) throws Exception{
		
		MultipartFile file = memberDTO.getFile();
		String name = fileSaver.fileSave(file, session, "profil");
		memberDTO.setFileName(name);
		memberDTO.setOriName(file.getOriginalFilename());
		int result = memberDAO.join(memberDTO);
		
		return result;
	}
	
	/*heeseong*/
	public MemberDTO memberInfo(String id) throws Exception{
		return memberDAO.memberInfo(id);
	}
}
