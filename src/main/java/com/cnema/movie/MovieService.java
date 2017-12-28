package com.cnema.movie;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.util.FileSaver;
import com.cnema.util.ListData;

@Service
public class MovieService {

	@Inject
	private MovieDAO movieDAO;
	@Inject
	private FileSaver fileSaver;
	
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<MovieDTO> ar = movieDAO.selectList();
		mv.addObject("list", ar);
		mv.setViewName("movie/movie_chart");
		return mv;
	}
}
