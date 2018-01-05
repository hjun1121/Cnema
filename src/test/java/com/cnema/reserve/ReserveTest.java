package com.cnema.reserve;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.cnema.c1.AbstractTest;

public class ReserveTest extends AbstractTest {

	@Inject
	private ReserveDAO reserveDAO;
	
	@Test
	public void test() {
		int result = 0;
		try {
			result = reserveDAO.reserveDel(4);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(result);
	}

}
