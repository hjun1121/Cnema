package com.cnema.movie;


import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service
public class MovieService {

	@Inject
	private MovieDAO movieDAO;
	
	public MovieDTO selectOne(int num) throws Exception{
		return movieDAO.selectOne(num);

	}

}
