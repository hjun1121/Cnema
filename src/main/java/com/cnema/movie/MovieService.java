package com.cnema.movie;


import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service
public class MovieService {

<<<<<<< HEAD
	@Inject
	private MovieDAO movieDAO;
	
	public MovieDTO selectOne(int num) throws Exception{
		return movieDAO.selectOne(num);

=======
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
>>>>>>> parent of 2ba8889... 씨발럼
	}

}
