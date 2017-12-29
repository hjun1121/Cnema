package com.cnema.movie;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.util.FileSaver;

@Service
public class MovieService {

<<<<<<< HEAD

	@Inject
	private MovieDAO movieDAO;
//	@Inject
//	private FileSaver fileSaver;
=======
	@Inject
	private MovieDAO movieDAO;
	@Inject
	private FileSaver fileSaver;
>>>>>>> parent of 41279c7... Hi

	public ModelAndView selectList() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<MovieDTO> ar = movieDAO.selectList();
		mv.addObject("list", ar);
		mv.setViewName("movie/movie_chart");
		return mv;
	}

}
