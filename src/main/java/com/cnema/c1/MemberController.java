package com.cnema.c1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	
	@RequestMapping(value="myPageView", method=RequestMethod.GET)
	public void selectOne(String id){
		System.out.println("dododo");
		/*try {
			memberService.selectOne(id);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
	}
	
}
