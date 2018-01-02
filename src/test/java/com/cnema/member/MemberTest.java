package com.cnema.member;

import static org.junit.Assert.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.junit.Test;

import com.cnema.c1.AbstractTest;
import com.cnema.util.EmailDAO;

public class MemberTest extends AbstractTest {

	@Inject
	private MemberDAO memberDAO;
	@Inject
	private EmailDAO emailDAO;
	
	
	@Test
	public void test() {
		
		try {
			String email = "library_4@naver.com";
			emailDAO.send(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
