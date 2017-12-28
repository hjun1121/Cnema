package com.cnema.c1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cnema.member.MemberService;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="myPageView", method=RequestMethod.GET)
	public void selectOne(String id){
		try {
			memberService.selectOne(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
