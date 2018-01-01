package com.cnema.movie;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


@Service
public class MovieService {

	@Inject
	private MovieDAO movieDAO;
	
	public MovieDTO selectOne(int num) throws Exception{
		return movieDAO.selectOne(num);

	}

	public ModelAndView selectList() throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}

}
