package com.cnema.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cnema.reserve.ReserveDTO;

@Service
public class MemberService {
	@Inject
	private MemberDAO memberDAO;
	
	/*kim*/
	public MemberDTO login(MemberDTO memberDTO) throws Exception{
		return memberDAO.login(memberDTO);
	}
	
	public int join(MemberDTO memberDTO) throws Exception{
		return memberDAO.join(memberDTO);
	}
	
	/*heeseong*/
	public MemberDTO memberInfo(String id) throws Exception{
		return memberDAO.memberInfo(id);
	}
}
