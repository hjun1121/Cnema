package com.cnema.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Inject
	private MemberDAO memberDAO;
	
	public MemberDTO selectOne(MemberDTO memberDTO)throws Exception{
		return memberDAO.selectOne(memberDTO);
	}
}
