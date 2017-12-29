package com.cnema.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Inject
	private MemberDAO memberDAO;
	
	public int login(MemberDTO memberDTO) throws Exception{
		return memberDAO.login(memberDTO);
	}
	
	public int join(MemberDTO memberDTO) throws Exception{
		return memberDAO.join(memberDTO);
	}
	
	public MemberDTO selectOne(String id) throws Exception{
		return memberDAO.selectOne(id);
	}
}
