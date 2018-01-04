package com.cnema.member;

import static org.junit.Assert.*;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.junit.Test;

import com.cnema.c1.AbstractTest;
import com.cnema.reserve.TicketPriceDAO;
import com.cnema.reserve.TicketPriceDTO;
import com.cnema.theater.DayDTO;
import com.cnema.theater.TheaterDAO;
import com.cnema.theater.TheaterDTO;
import com.cnema.util.EmailDAO;

public class MemberTest extends AbstractTest {

	@Inject
	private MemberDAO memberDAO;
	@Inject
	private EmailDAO emailDAO;
	@Inject
	private TheaterDAO theaterDAO;
	@Inject
	private TicketPriceDAO ticketPriceDAO;
	

	
	@Test
	public void test() {
		
		try {
			List<DayDTO> ar = theaterDAO.dayList();
			System.out.println(ar.size());
			
			for(DayDTO dayDTO : ar){
				System.out.println(dayDTO.getDay_num());
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
