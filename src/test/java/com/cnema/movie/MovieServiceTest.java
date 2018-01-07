package com.cnema.movie;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.cnema.c1.AbstractTest;

public class MovieServiceTest extends AbstractTest {

	@Inject
	private MovieService movieService;
	
	@Inject
	private MovieDAO movieDAO;
	
	@Test
	public void test() {
		String id="joy";
		int movie_num = 26;
		int result = 0;
		try {
			result = movieDAO.movieWish(id, movie_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(result);
	}

}
