package com.cnema.movie;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.cnema.c1.AbstractTest;

public class MovieDAOTest extends AbstractTest {

	@Inject
	private MovieDAO movieDAO;

	@Test
	public void test() {
		try {
			MovieDTO movieDTO = movieDAO.selectOne(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
