package com.cnema.member;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.junit.Test;

import com.cnema.c1.AbstractTest;
import com.cnema.theater.TheaterDAO;
import com.cnema.theater.TheaterDTO;
import com.cnema.util.EmailDAO;

public class MemberTest extends AbstractTest {

	@Inject
	private MemberDAO memberDAO;
	@Inject
	private EmailDAO emailDAO;
	@Inject
	private TheaterDAO theaterDAO;
	
	@Test
	public void test() {
		
		try {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId("joy");
			memberDTO.setName("joy");
			memberDTO.setEmail("library_4@naver.com");
			List<MemberDTO> ar =  memberDAO.idFind(memberDTO);
			System.out.println(ar.size());
			System.out.println(ar.get(0).getAddr1());
			System.out.println(ar.get(1).getAddr1());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
