package com.cnema.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cnema.util.FileSaver;

@Service
public class MemberService {
	@Inject
	private MemberDAO memberDAO;
	
	@Inject
	private FileSaver fileSaver;
	
	/*kim*/
	public int pwUpdate(MemberDTO memberDTO){
		return memberDAO.pwUpdate(memberDTO);
	}
	
	public int qrPointUpdate(int point, int getPoint, String id) throws Exception{
		return memberDAO.qrPointUpdate(point, getPoint, id);
	}
	
	public List<MemberDTO> idFind(MemberDTO memberDTO) throws Exception{
		return memberDAO.idFind(memberDTO);
	}
	
	public int pwFind(MemberDTO memberDTO) throws Exception{
		return memberDAO.pwFind(memberDTO);
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception{
		return memberDAO.login(memberDTO);
	}

	public int join(MemberDTO memberDTO, HttpSession session) throws Exception{
		if(memberDTO.getFile().getOriginalFilename() ==""){
			memberDTO.setFileName("defaultProfile.jpg");
			memberDTO.setOriName("defaultProfile.jpg");
		}else{
			MultipartFile file = memberDTO.getFile();
			String name = fileSaver.fileSave(file, session, "profil");
			memberDTO.setFileName(name);
			memberDTO.setOriName(file.getOriginalFilename());
		}
		int result = memberDAO.join(memberDTO);
		
		return result;
	}
	
	
	
	/*heeseong*/
	public MemberDTO memberInfo(String id) throws Exception{
		return memberDAO.memberInfo(id);
	}
	/*heeseong*/
	public List<MemberDTO> memberList() throws Exception{
		return memberDAO.memberList();
	}
	/*heeseong*/
	public List<MemberDTO> memberCList(int ctype) throws Exception{
		return memberDAO.memberCList(ctype);
	}
	/*heeseong*/
	public int withdrawal(String id) throws Exception{
		return memberDAO.withdrawal(id);
	}
	/*heeseong*/
	public int myInfoRevision(MemberDTO memberDTO) throws Exception{
		return memberDAO.myInfoRevision(memberDTO);
	}
	/*heeseong*/
	public int pointUpdate(int price, String id) throws Exception{
		return memberDAO.pointUpdate(price,id);
	}
}
