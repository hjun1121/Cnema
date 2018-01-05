package com.cnema.reserve;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.cnema.c1.AbstractTest;

public class ReserveTest extends AbstractTest {

	@Inject
	private ReserveDAO reserveDAO;
	
	@Test
	public void test() {
		/*List<ReserveDTO> rList = new ArrayList<>();
		try {
			rList = reserveDAO.reserveList("joy","2018");
			System.out.println(rList.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
}
